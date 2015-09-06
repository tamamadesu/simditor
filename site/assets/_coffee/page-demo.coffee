
$ ->
  Simditor.locale = 'zh-CN'

  toolbar= ['mark','title', 'bold', 'italic', 'color', '|', 'ol', 'ul', 'blockquote', '|', 'link', 'image', 'hr', '|', 'alignment']
  mobileToolbar=["bold","color","ul","ol"]
  toolbar = mobileToolbar if mobilecheck()
  editor = new Simditor
    textarea: $('#txt-content')
    placeholder: '这里输入文字...'
    toolbar: toolbar
    pasteImage: true
    defaultImage: 'assets/images/image.png'
    upload: if location.search == '?upload' then {url: '/upload'} else false

  $preview = $('#preview')
  if $preview.length > 0
    editor.on 'valuechanged', (e) ->
      $preview.html editor.getValue()
