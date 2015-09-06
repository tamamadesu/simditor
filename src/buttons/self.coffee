



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


Simditor.Toolbar.addButton TestButton