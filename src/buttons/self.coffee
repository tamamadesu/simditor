



# class TestButton extends Button

#     name: 'test'
#     icon: 'bold'

#     htmlTag: 'strong'
#     disableTag: 'pre'
    
#     # 刷新执行
#     _status: ->
#     _activeStatus: ->
#         # @setActive true
#     # 刷新执行
#     render: (args...) ->
#         super args...

#     formatHTML: ($node) ->
#         $node.attr("style","")
#         $node.contents().each (i,item) =>
#             $(item).attr("style","")
#             if item.nodeType != 3
#                 this.formatHTML($(item))
#             else
#                 return true

#     command: (param) ->
#         console.log(param)
#         range = @editor.selection.range()
#         $cont = $(range.extractContents())
#         console.log($cont)
#         # console.log($cont.parent())

#         # bold
#         # 剪切所选的内容
#         # $cont  = $(@editor.selection.blockNodes())
#         # document.execCommand 'bold'
#         # $cont.contents().each (i, item) =>
#         #     if item.tagName == "B"
#         #         $strong = $("<strong />")
#         #         $strong.html($(item).contents())
#         #         $(item).replaceWith($strong);
#         # @editor.selection.range range


#         # format
#         # $cont  = $(@editor.selection.blockNodes())
#         # this.formatHTML($cont)



#         # range.insertNode $link.get(0)

#         # 设置光标在某元素后
#         # @editor.selection.setRangeAtEndOf($link[0]);

#         # range.selectNodeContents $link[0]
#         # 选中某选择范围
#         # @editor.selection.range range
#         $(document).trigger 'selectionchange'

#         # $("body").append(cont)



# class TestButton extends Button

#     name: 'test'
#     icon: 'bold'
#     htmlTag: 'h1, h2, h3, h4'

#     disableTag: 'pre, table'

#     _init: ->
#         @menu = [{
#           name: '14',
#           text: '14px',
#           param: 'margin-top:14px'
#         }, {
#           name: '20px',
#           text: '20px',
#           param: 'margin-top:20px'
#         }]
#         super()
#     _activeStatus: ->
#         $rootNodes = @editor.selection.rootNodes()
#         console.log($(this.menuEl).find("li"))
#         $(this.menuEl).find("li").attr("style",'')
#         if $rootNodes
#             if $rootNodes.attr("style")
#                 top_px = $rootNodes.attr("style").split("margin-top:")[1].split("px")[0] 
#                 $(this.menuEl).find("li").each (i,item) =>
#                     console.log($(item).text()+"--"+ (top_px+"px"))
#                     if $(item).text() == top_px+"px"
#                         $(item).attr("style","background-color:#f6f6f6")
#                 @setActive true
#             else
#                 @setActive false
#         else
#             @setActive false

#     setActive: (active, param) ->
#         super active

#         @el.removeClass 'active-p active-h1 active-h2 active-h3'
#         @el.addClass('active active-' + param) if active

#     command: (param) ->

#         $rootNodes = @editor.selection.rootNodes()
#         $rootNodes.attr("style",param);
#         @setActive true

#         @editor.trigger 'valuechanged'
#         

class TestButton extends Button

    name: 'test'
    icon: 'bold'

    _init: ->
        @menu = [{
          name: '14',
          text: '14px',
          param: 'margin-top:14px'
        }, {
          name: '20px',
          text: '20px',
          param: 'margin-top:20px'
        }]
        super()
    _activeStatus: ->
        $rootNodes = @editor.selection.rootNodes()
        $(this.menuEl).find("li").attr("style",'')
        if $rootNodes
            if $rootNodes.attr("style")
                top_px = $rootNodes.attr("style").split("font-size:")[1].split("px")[0] 
                $(this.menuEl).find("li").each (i,item) =>
                    console.log($(item).text()+"--"+ (top_px+"px"))
                    if $(item).text() == top_px+"px"
                        $(item).attr("style","background-color:#f6f6f6")
                @setActive true
            else
                @setActive false
        else
            @setActive false

    setActive: (active, param) ->
        super active

        @el.removeClass 'active-p active-h1 active-h2 active-h3'
        @el.addClass('active active-' + param) if active

    command: (param) ->

        range = @editor.selection.range()
        $cont = $(range.extractContents())
        if $cont.text()
            $fz   = $("<span />")
                    .attr("style","font-size:"+param)
                    .append($cont.contents())
            range.insertNode $fz[0]
            @editor.selection.setRangeAtEndOf($fz[0]);

        @editor.trigger 'valuechanged'


class FormatButton extends Button

      name:'format'

      icon:'clear mdi-icon mdi-editor-format-clear'

      htmlTag:'strong'

      disableTag:'pre'

      formatHTML: -> 

        $node.attr("style", "")

        $node.contents().each(function(i, item) {
            $(item).attr("style", "")
            if (item.nodeType !== 3) {
              return @this.formatHTML($(item))
            } else {
              return true
            }
        })


      command: (parm) ->

        document.execCommand('removeformat')

        $cont = $(this.editor.selection.blockNodes())

        this.formatHTML($cont)

        unless @editor.util.support.oninput
            @editor.trigger 'valuechanged'
        @editor.trigger 'valuechanged'




marginMenu = [
  {
    name: 'normal',
    text: ' normal',
    param: 'auto'
  }, {
    name: '14',
    text: '14px',
    param: '14px'
  }, {
    name: '20',
    text: '20px',
    param: '20px'
  }, {
    name: '26',
    text: '26px',
    param: '26px'
  }, {
    name: '30',
    text: '30px',
    param: '30px'
  }
]

class MarginTopButton extends Button
    name = "marginTop"
    icon = "margin mdi-icon mdi-editor-vertical-align-top"
    _init = ->
        @title = "上边距"
        @menu = marginMenu

    _activeStatus = ->
        $rootNodes = @editor.selection.rootNodes()
        $(@menuEl).find("li").attr "style", ""
        $px = $rootNodes[0].style.marginTop
        top_px = parseFloat($px)
        if top_px
            @setActive true
            $(@menuEl).find("li").each((i, item) ->
                $(item).css "background-color", "#f6f6f6"  if $(item).text() is $px
        else
            @setActive false

    command = (param) ->
      $rootNodes = undefined
      $rootNodes = @editor.selection.rootNodes()
      if param isnt "auto"
        $rootNodes.css "margin-top", param
      else
        $rootNodes[0].style.marginTop = ""
      @setActive true
      @editor.trigger "valuechanged"

class MarginBottomButton extends Button
    name = "marginTop"
    icon = "margin mdi-icon mdi-editor-vertical-align-Bottom"
    _init = ->
        @title = "上边距"
        @menu = marginMenu

    _activeStatus = ->
        $rootNodes = @editor.selection.rootNodes()
        $(@menuEl).find("li").attr "style", ""
        $px = $rootNodes[0].style.marginTop
        top_px = parseFloat($px)
        if top_px
            @setActive true
            $(@menuEl).find("li").each((i, item) ->
                $(item).css "background-color", "#f6f6f6"  if $(item).text() is $px
        else
            @setActive false

    command = (param) ->
      $rootNodes = @editor.selection.rootNodes()
      if param isnt "auto"
        $rootNodes.css "margin-top", param
      else
        $rootNodes[0].style.marginBottom = ""

      @setActive true
      @editor.trigger "valuechanged"


class FontSizeButton extends Button

    name = "fontSize"
    icon = "margin mdi-icon mdi-editor-format-size"
    _init = ->
      @title = "字号大小"
      @menu = [
        name: "normal"
        text: " normal"
        param: "auto"
      ,
        name: "14"
        text: "14px"
        param: "14px"
      ,
        name: "20"
        text: "20px"
        param: "20px"
      ,
        name: "26"
        text: "26px"
        param: "26px"
      ,
        name: "30"
        text: "30px"
        param: "30px"
       ]
       super()

    _activeStatus = ->
      $rootNodes = @editor.selection.rootNodes()
      $(@menuEl).find("li").attr "style", ""
      $px = $rootNodes[0].style.fontSize
      top_px = parseFloat($px)
      if top_px
        @setActive true
        $(@menuEl).find("li").each ((_this) ->
          (i, item) ->
            $(item).css "background-color", "#f6f6f6"  if $(item).text() is $px
        )(this)
      else
        @setActive false

    command = (param) ->
      $rootNodes = @editor.selection.rootNodes()
      if param isnt "auto"
        $rootNodes.css "font-size", param
      else
        $rootNodes[0].style.fontSize = ""
      @setActive true
      @editor.trigger "valuechanged"




class HTMLButton extends Button

    name: 'html'

    icon: 'html5'

    needFocus: false

    _init: ->
        super()

        @editor.textarea.on 'focus', (e) =>
          @editor.el.addClass('focus')
            .removeClass('error')

        @editor.textarea.on 'blur', (e) =>
          @editor.el.removeClass 'focus'
          @editor.setValue @editor.textarea.val()
          @editor.trigger 'valuechanged'

        @editor.textarea.on 'input', (e) =>
          @_resizeTextarea()

    command: ->
        @editor.blur()
        @editor.el.toggleClass 'simditor-html'
        @editor.htmlMode = @editor.el.hasClass 'simditor-html'

        if @editor.htmlMode
          @editor.hidePopover()
          @editor.textarea.val @beautifyHTML(@editor.textarea.val())
          @_resizeTextarea()

        for button in @editor.toolbar.buttons
          if button.name == 'html'
            button.setActive @editor.htmlMode
          else
            button.setDisabled @editor.htmlMode
    beautifyHTML: (args...) ->
        if beautify.html
          beautify.html args...
        else
          beautify args...

    _resizeTextarea: ->
        @_textareaPadding ||= @editor.textarea.innerHeight() - @editor.textarea.height()
        @editor.textarea
          .height(@editor.textarea[0].scrollHeight - @_textareaPadding)


class VideoButton extends Button

    _videoTpl  = "<p><iframe width=\"620\" height=\"500\" frameborder=0 allowFullScreen=\"true\" quality=\"high\" align=\"middle\" allowScriptAccess=\"always\" src=\"---video-src---\"></iframe></p>"
    name       = "video"
    icon       = "video mdi-icon mdi-av-videocam"
    title      = "插入视频"
    htmlTag    = "embed"
    disableTag = "pre, table"
    render = ->
      args = (if 1 <= arguments.length then slice.call(arguments, 0) else [])
      @editor.formatter._allowedTags.push "embed"
      @editor.formatter._allowedAttributes["embed"] = [ "allowfullscreen", "id", "quality", "width", "height", "align", "src", "type" ]
      VideoButton.__super__.render.apply this, args
      @popover = new VideoPopover(button: this)

    getUrl = (url) ->
      site = [ "qq", "youku", "56" ]
      real = ""
      urlHandle = (item) ->
        switch item
          when "qq"
            id = url.split("vid=")[1].split("&")[0]
            src = "http://v.qq.com/iframe/player.html?vid=" + id + "&tiny=0&auto=0"
          when "youku"
            id = url.split(".html")[0].split("id_")[1]
            src = "http://player.youku.com/embed/" + id
          when "56"
            console.log "not support"

      urlHandle site.filter((item) ->
        item  if url.indexOf(item) isnt -1
      )[0]

    parseVideoSrc = (src) ->
      if src and src.match(/\.swf\b/)
        videoSrc = src
      else videoSrc = @getUrl(src)  if src

      videoSrc

    loadVideo = (src, target) ->
      videoSrc = @parseVideoSrc(src)
      return  unless videoSrc
      videoNode = $(@_videoTpl.replace("---video-src---", videoSrc))
      target.html videoNode
      @editor.trigger "valuechanged"
      @editor.trigger "selectionchanged"

    command = ->
      range = @editor.selection.range()
      startNode = range.startContainer
      endNode = range.endContainer
      $startBlock = @editor.selection.nodes().first()
      $endBlock = @editor.selection.nodes().end()
      range.deleteContents()
      if $startBlock[0] is $endBlock[0]
        if $startBlock.is("li")
          $startBlock = @editor.util.furthestNode($startBlock, "ul, ol")
          $endBlock = $startBlock
          range.setEndAfter $startBlock[0]
          range.collapse false
        else if $startBlock.is("p")
          if @editor.util.isEmptyNode($startBlock)
            range.selectNode $startBlock[0]
            range.deleteContents()
          else if @editor.selection.rangeAtEndOf($startBlock, range)
            range.setEndAfter $startBlock[0]
            range.collapse false
          else if @editor.selection.rangeAtStartOf($startBlock, range)
            range.setEndBefore $startBlock[0]
            range.collapse false
          else
            $breakedEl = @editor.selection.breakBlockEl($startBlock, range)
            range.setEndBefore $breakedEl[0]
            range.collapse false
      popoverTarget = $("</p>")
      popoverTarget = $(@editor.selection.blockNodes())
      @popover.show popoverTarget


class VideoPopover extends Popover

    render = ->
        _tpl = "<div class=\"link-settings\">\n  <div class=\"settings-field\">\n    <label>视频地址</label>\n    <input class=\"video-src\" type=\"text\"/>\n  </div>\n</div>"
        @el.addClass("video-popover").append _tpl
        @srcEl = @el.find(".video-src")
        @srcEl.on "keydown", ((_this) ->
          (e) ->
            if e.which is 13
              e.preventDefault()
              _this.button.loadVideo _this.srcEl.val(), _this.target
              _this.srcEl.blur()
        )(this)
        @srcEl.on "blur", ((_this) ->
          ->
            _this.hide()
        )(this)

    show = ->
        args = (if 1 <= arguments.length then slice.call(arguments, 0) else [])
        VideoPopover.__super__.show.apply this, args
        @srcEl.val ""
        @srcEl.focus()




Simditor.Toolbar.addButton HTMLButton
Simditor.Toolbar.addButton FormatButton
Simditor.Toolbar.addButton MarginTopButton
Simditor.Toolbar.addButton MarginBottomButton
Simditor.Toolbar.addButton FontSizeButton
Simditor.Toolbar.addButton VideoButton
