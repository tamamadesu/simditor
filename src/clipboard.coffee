
class Clipboard extends SimpleModule

  @pluginName: 'Clipboard'

  opts:
    pasteImage: false

  _init: ->
    @editor = @_module

    if @opts.pasteImage and typeof @opts.pasteImage != 'string'
      @opts.pasteImage = 'inline'

    @editor.body.on 'paste', (e) =>
      if @editor.triggerHandler(e) == false
        return false

      range = @editor.selection.deleteRangeContents()
      range.collapse(true) unless range.collapsed
      @editor.selection.range range
      $blockEl = @editor.selection.blockNodes().last()
      isPlainText = $blockEl.is 'pre, table'

      return false if !isPlainText and @_processPasteByClipboardApi(e)

      return false if @_pasteBin

      @editor.inputManager.throttledValueChanged.clear()
      @editor.inputManager.throttledSelectionChanged.clear()
      @editor.undoManager.throttledPushState.clear()

      @pasting = true
      @_getPasteContent isPlainText, (pasteContent) =>
        @_processPasteContent isPlainText, $blockEl, pasteContent
        @pasting = false

  _processPasteByClipboardApi: (e) ->
    # clipboard api is buggy in MS Edge
    return if @editor.util.browser.edge

    # paste file in chrome
    if e.originalEvent.clipboardData && e.originalEvent.clipboardData.items &&
        e.originalEvent.clipboardData.items.length > 0
      pasteItem = e.originalEvent.clipboardData.items[0]

      if /^image\//.test(pasteItem.type)
        imageFile = pasteItem.getAsFile()
        return unless imageFile? and @opts.pasteImage

        unless imageFile.name
          imageFile.name = "Clipboard Image.png"

        return if @editor.triggerHandler('pasting', [imageFile]) == false

        uploadOpt = {}
        uploadOpt[@opts.pasteImage] = true
        @editor.uploader?.upload(imageFile, uploadOpt)
        return true

  _getPasteContent: (isPlainText, callback) ->
    @_pasteBin = $ '<div contenteditable="true" />'
      .addClass 'simditor-paste-bin'
      .attr 'tabIndex', '-1'
      .appendTo @editor.el

    state =
      html: @editor.body.html()
      caret: @editor.undoManager.caretPosition()

    @_pasteBin.focus()

    setTimeout =>
      @editor.hidePopover()
      @editor.body.html state.html
      @editor.undoManager.caretPosition state.caret
      @editor.body.focus()
      @editor.selection._reset()

      if isPlainText
        pasteContent = @editor.formatter.clearHtml @_pasteBin.html(), true
      else
        pasteContent = $('<div/>').append(@_pasteBin.contents())
        pasteContent.find('table colgroup').remove() # clear table cols width
        @editor.formatter.format pasteContent
        @editor.formatter.decorate pasteContent
        @editor.formatter.beautify pasteContent.children()
        pasteContent = pasteContent.contents()

      @_pasteBin.remove()
      @_pasteBin = null
      callback pasteContent
    , 0

  _processPasteContent: (isPlainText, $blockEl, pasteContent) ->
    return if @editor.triggerHandler('pasting', [pasteContent]) == false

    if !pasteContent
      return
    else if isPlainText
      if $blockEl.is('table')
        lines = pasteContent.split('\n')
        lastLine = lines.pop()
        for line in lines
          @editor.selection.insertNode document.createTextNode(line)
          @editor.selection.insertNode $('<br/>')
        @editor.selection.insertNode document.createTextNode(lastLine)
      else
        pasteContent = $('<div/>').text(pasteContent)
        for node in pasteContent.contents()
          @editor.selection.insertNode($(node)[0])
    else if $blockEl.is @editor.body
      @editor.selection.insertNode(node) for node in pasteContent
    else if pasteContent.length < 1
      return
    else if pasteContent.length == 1
      if pasteContent.is('p')
        children = pasteContent.contents()

        if children.length == 1 and children.is('img')
          $img = children

          # paste image in firefox and IE 11
          if /^data:image/.test($img.attr('src'))
            return unless @opts.pasteImage
            blob = @editor.util.dataURLtoBlob $img.attr( "src" )
            blob.name = "Clipboard Image.png"

            uploadOpt = {}
            uploadOpt[@opts.pasteImage] = true
            @editor.uploader?.upload(blob, uploadOpt)
            return

          # cannot paste image in safari
          else if $img.is('img[src^="webkit-fake-url://"]')
            return

        @editor.selection.insertNode(node) for node in children

      else if $blockEl.is('p') and @editor.util.isEmptyNode $blockEl
        $blockEl.replaceWith pasteContent
        @editor.selection.setRangeAtEndOf(pasteContent)
      else if pasteContent.is('ul, ol')
        if pasteContent.find('li').length == 1
          pasteContent = $('<div/>').text(pasteContent.text())
          for node in pasteContent.contents()
            @editor.selection.insertNode($(node)[0])
        else if $blockEl.is 'li'
          $blockEl.parent().after pasteContent
          @editor.selection.setRangeAtEndOf(pasteContent)
        else
          $blockEl.after pasteContent
          @editor.selection.setRangeAtEndOf(pasteContent)
      else
        $blockEl.after pasteContent
        @editor.selection.setRangeAtEndOf(pasteContent)
    else
      $blockEl = $blockEl.parent() if $blockEl.is 'li'

      if @editor.selection.rangeAtStartOf($blockEl)
        insertPosition = 'before'
      else if @editor.selection.rangeAtEndOf($blockEl)
        insertPosition = 'after'
      else
        @editor.selection.breakBlockEl($blockEl)
        insertPosition = 'before'

      $blockEl[insertPosition](pasteContent)
      @editor.selection.setRangeAtEndOf(pasteContent.last())

    @editor.inputManager.throttledValueChanged()
