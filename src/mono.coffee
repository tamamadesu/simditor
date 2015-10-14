

marginMenu = [
  {
    name: 'normal',
    text: ' normal',
    param: 'auto'
  }, {
    name: '5',
    text: '5px',
    param: '5px'
  }, {
    name: '10',
    text: '10px', 
    param: '10px'
  }, {
    name: '26',
    text: '26px',
    param: '26px'
  }, {
    name: '35',
    text: '35px',
    param: '35px'
  }
]

charsContent = [
    { name:"tsfh", title:"特殊字符", content:("、,。,·,ˉ,ˇ,¨,〃,々,—,～,‖,…,‘,’,“,”,〔,〕,〈,〉,《,》,「,」,『,』,〖,〗,【,】,±,×,÷,∶,∧,∨,∑,∏,∪,∩,∈,∷,√,⊥,∥,∠,⌒,⊙,∫,∮,≡,≌,≈,∽,∝,≠,≮,≯,≤,≥,∞,∵,∴,♂,♀,°,′,″,℃,＄,¤,￠,￡,‰,§,№,☆,★,○,●,◎,◇,◆,□,■,△,▲,※,→,←,↑,↓,〓,〡,〢,〣,〤,〥,〦,〧,〨,〩,㊣,㎎,㎏,㎜,㎝,㎞,㎡,㏄,㏎,㏑,㏒,㏕,︰,￢,￤,℡,ˊ,ˋ,˙,–,―,‥,‵,℅,℉,↖,↗,↘,↙,∕,∟,∣,≒,≦,≧,⊿,═,║,╒,╓,╔,╕,╖,╗,╘,╙,╚,╛,╜,╝,╞,╟,╠,╡,╢,╣,╤,╥,╦,╧,╨,╩,╪,╫,╬,╭,╮,╯,╰,╱,╲,╳,▁,▂,▃,▄,▅,▆,▇,�,█,▉,▊,▋,▌,▍,▎,▏,▓,▔,▕,▼,▽,◢,◣,◤,◥,☉,⊕,〒,〝,〞").split(",")},
    { name:"lmsz", title:"罗马字符", content:("ⅰ,ⅱ,ⅲ,ⅳ,ⅴ,ⅵ,ⅶ,ⅷ,ⅸ,ⅹ,Ⅰ,Ⅱ,Ⅲ,Ⅳ,Ⅴ,Ⅵ,Ⅶ,Ⅷ,Ⅸ,Ⅹ,Ⅺ,Ⅻ").split(",")},
    { name:"szfh", title:"数学字符", content:("⒈,⒉,⒊,⒋,⒌,⒍,⒎,⒏,⒐,⒑,⒒,⒓,⒔,⒕,⒖,⒗,⒘,⒙,⒚,⒛,⑴,⑵,⑶,⑷,⑸,⑹,⑺,⑻,⑼,⑽,⑾,⑿,⒀,⒁,⒂,⒃,⒄,⒅,⒆,⒇,①,②,③,④,⑤,⑥,⑦,⑧,⑨,⑩,㈠,㈡,㈢,㈣,㈤,㈥,㈦,㈧,㈨,㈩").split(",")},
    { name:"rwfh", title:"日文字符", content:("ぁ,あ,ぃ,い,ぅ,う,ぇ,え,ぉ,お,か,が,き,ぎ,く,ぐ,け,げ,こ,ご,さ,ざ,し,じ,す,ず,せ,ぜ,そ,ぞ,た,だ,ち,ぢ,っ,つ,づ,て,で,と,ど,な,に,ぬ,ね,の,は,ば,ぱ,ひ,び,ぴ,ふ,ぶ,ぷ,へ,べ,ぺ,ほ,ぼ,ぽ,ま,み,む,め,も,ゃ,や,ゅ,ゆ,ょ,よ,ら,り,る,れ,ろ,ゎ,わ,ゐ,ゑ,を,ん,ァ,ア,ィ,イ,ゥ,ウ,ェ,エ,ォ,オ,カ,ガ,キ,ギ,ク,グ,ケ,ゲ,コ,ゴ,サ,ザ,シ,ジ,ス,ズ,セ,ゼ,ソ,ゾ,タ,ダ,チ,ヂ,ッ,ツ,ヅ,テ,デ,ト,ド,ナ,ニ,ヌ,ネ,ノ,ハ,バ,パ,ヒ,ビ,ピ,フ,ブ,プ,ヘ,ベ,ペ,ホ,ボ,ポ,マ,ミ,ム,メ,モ,ャ,ヤ,ュ,ユ,ョ,ヨ,ラ,リ,ル,レ,ロ,ヮ,ワ,ヰ,ヱ,ヲ,ン,ヴ,ヵ,ヶ").split(",")},
    { name:"xlzm", title:"希腊字母", content:("Α,Β,Γ,Δ,Ε,Ζ,Η,Θ,Ι,Κ,Λ,Μ,Ν,Ξ,Ο,Π,Ρ,Σ,Τ,Υ,Φ,Χ,Ψ,Ω,α,β,γ,δ,ε,ζ,η,θ,ι,κ,λ,μ,ν,ξ,ο,π,ρ,σ,τ,υ,φ,χ,ψ,ω").split(",")},
    { name:"ewzm", title:"俄文字符", content:("А,Б,В,Г,Д,Е,Ё,Ж,З,И,Й,К,Л,М,Н,О,П,Р,С,Т,У,Ф,Х,Ц,Ч,Ш,Щ,Ъ,Ы,Ь,Э,Ю,Я,а,б,в,г,д,е,ё,ж,з,и,й,к,л,м,н,о,п,р,с,т,у,ф,х,ц,ч,ш,щ,ъ,ы,ь,э,ю,я").split(",")},
    { name:"pyzm", title:"拼音字母", content:("ā,á,ǎ,à,ē,é,ě,è,ī,í,ǐ,ì,ō,ó,ǒ,ò,ū,ú,ǔ,ù,ǖ,ǘ,ǚ,ǜ,ü").split(",")},
    { name:"yyyb", title:"英语音标", content:("i:,i,e,æ,ʌ,ə:,ə,u:,u,ɔ:,ɔ,a:,ei,ai,ɔi,əu,au,iə,εə,uə,p,t,k,b,d,g,f,s,ʃ,θ,h,v,z,ʒ,ð,tʃ,tr,ts,dʒ,dr,dz,m,n,ŋ,l,r,w,j,").split(",")},
    { name:"zyzf", title:"其他", content:("ㄅ,ㄆ,ㄇ,ㄈ,ㄉ,ㄊ,ㄋ,ㄌ,ㄍ,ㄎ,ㄏ,ㄐ,ㄑ,ㄒ,ㄓ,ㄔ,ㄕ,ㄖ,ㄗ,ㄘ,ㄙ,ㄚ,ㄛ,ㄜ,ㄝ,ㄞ,ㄟ,ㄠ,ㄡ,ㄢ,ㄣ,ㄤ,ㄥ,ㄦ,ㄧ,ㄨ").split(",")}
];

class FormatButton extends Button

      name:'format'

      icon:'clear mdi-icon mdi-editor-format-clear'

      htmlTag:'strong'

      disableTag:'pre'

      formatHTML: -> 

        $node.attr("style", "")

        $node.contents().each((i, item) ->
            $(item).attr("style", "")
            if (item.nodeType != 3)
              return @this.formatHTML($(item))
            else
              return true
        )


      command: (parm) ->

        document.execCommand('removeformat')

        $cont = $(this.editor.selection.blockNodes())

        this.formatHTML($cont)

        unless @editor.util.support.oninput
            @editor.trigger 'valuechanged'
        @editor.trigger 'valuechanged'

class MarginTopButton extends Button

    name:"marginTop"
    icon:"margin mdi-icon mdi-editor-vertical-align-top"

    _init: ->
        @title = "上边距"
        @menu = marginMenu
        super()
    _activeStatus: ->
        $rootNodes = @editor.selection.rootNodes()
        $(@menuEl).find("li").attr "style", ""
        $px = $rootNodes[0].style.marginTop
        top_px = parseFloat($px)
        if top_px
            @setActive true
            $(@menuEl).find("li").each((i, item) ->
                $(item).css "background-color", "#f6f6f6"  if $(item).text() is $px
            )
        else
            @setActive false

    command : (param) ->
        $rootNodes = undefined
        $rootNodes = @editor.selection.rootNodes()
        if param isnt "auto"
            $rootNodes.css "margin-top", param
        else
            $rootNodes[0].style.marginTop = ""
        @setActive true
        @editor.trigger "valuechanged"

class MarginBottomButton extends Button
    name:"marginBottom"
    icon:"margin mdi-icon mdi-editor-vertical-align-Bottom"
    _init: ->
        @title = "上边距"
        @menu = marginMenu

    _activeStatus: ->
        $rootNodes = @editor.selection.rootNodes()
        $(@menuEl).find("li").attr "style", ""
        $px = $rootNodes[0].style.marginBottom
        top_px = parseFloat($px)
        if top_px
            @setActive true
            $(@menuEl).find("li").each((i, item) ->
                $(item).css "background-color", "#f6f6f6"  if $(item).text() is $px
            )
        else
            @setActive false

    command : (param) ->
      $rootNodes = @editor.selection.rootNodes()
      if param isnt "auto"
        $rootNodes.css "margin-top", param
      else
        $rootNodes[0].style.marginBottom = ""

      @setActive true
      @editor.trigger "valuechanged"

class FontSizeButton extends Button

    name: "fontSize"
    icon: "margin mdi-icon mdi-editor-format-size"
    _init: ->
      @title = "字号大小"
      @menu = [{
        name: "normal",
        text: " normal",
        param: "auto"
      },{
        name: "12",
        text: "12px",
        param: "12px"
      },{
        name: "20",
        text: "20px",
        param: "20px"
      },{
        name: "26",
        text: "26px",
        param: "26px"
      },{
        name: "30",
        text: "30px",
        param: "30px"
      }]
      super()

    _activeStatus: ->
      $rootNodes = @editor.selection.rootNodes()
      $(@menuEl).find("li").attr("style","")
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

    command: (param) ->
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

        # super()

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

    _videoTpl  : "<p><iframe width=\"620\" height=\"500\" frameborder=0 allowFullScreen=\"true\" quality=\"high\" align=\"middle\" allowScriptAccess=\"always\" src=\"---video-src---\"></iframe></p>"
    name       : "video"
    icon       : "video mdi-icon mdi-av-videocam"
    title      : "插入视频"
    htmlTag    : "embed"
    disableTag : "pre, table"
    
    render: ->
        super()
        @editor.formatter._allowedTags.push "embed"
        @editor.formatter._allowedAttributes["embed"] = [ "allowfullscreen", "id", "quality", "width", "height", "align", "src", "type" ]
        @popover = new VideoPopover(button: this)

    getUrl : (url) ->
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

    parseVideoSrc : (src) ->
      if src and src.match(/\.swf\b/)
        videoSrc = src
      else videoSrc = @getUrl(src)  if src

      videoSrc

    loadVideo : (src, target) ->
      videoSrc = @parseVideoSrc(src)
      return  unless videoSrc
      videoNode = $(@_videoTpl.replace("---video-src---", videoSrc))
      target.html videoNode
      @editor.trigger "valuechanged"
      @editor.trigger "selectionchanged"

    command: ->
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

    _tpl: """
        <div class="link-settings">
          <div class="settings-field">
            <label>视频地址</label>
            <input class="video-src" type="text"/>
          </div>
        </div>
    """

    # constructor: (@button) ->
    #     super @button.editor

    render: ->
        @el.addClass('video-popover')
          .append(@_tpl)
        @srcEl = @el.find '.video-src'

        @srcEl.on 'keydown', (e) =>
          if e.which == 13
            e.preventDefault()
            @button.loadVideo @srcEl.val(), @target
            @srcEl.blur()

        @srcEl.on 'blur', =>
          @target.remove()
          @hide()

    show: (args...) ->
        super args...
        @srcEl.val ''
        @srcEl.focus()

class EmojiButton extends Button

    @i18n =
        'zh-CN':
          emoji: '表情'
        'en-US':
          emoji: 'emoji'

    name: 'emoji'

    icon: 'smile-o'

    menu: true

    constructor: (args...) ->
        super args...
        $.merge @editor.formatter._allowedAttributes['img'], ['data-emoji', 'alt']

    renderMenu: ->

        tpl = '<div class="emoji-list">\n</div>'
        html = ""

        for con in charsContent[0].content
            html += "<span>"+con+"</span>"

        $list= $(tpl)
        $list.html(html).appendTo(@menuWrapper)

        $list.on 'mousedown', 'span', (e) =>

            @wrapper.removeClass('menu-on')
            return unless @editor.inputManager.focused

            $moji   = $(e.currentTarget)
            txtNode = document.createTextNode($moji.text())

            @editor.selection.insertNode txtNode

            @editor.trigger 'valuechanged'
            @editor.trigger 'selectionchanged'
            false

Simditor.Toolbar.addButton FontSizeButton 
Simditor.Toolbar.addButton MarginTopButton
Simditor.Toolbar.addButton MarginBottomButton
Simditor.Toolbar.addButton HTMLButton
Simditor.Toolbar.addButton FormatButton
Simditor.Toolbar.addButton VideoButton
Simditor.Toolbar.addButton EmojiButton
