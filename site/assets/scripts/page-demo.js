(function() {
  $(function() {
    var $preview, editor, mobileToolbar, toolbar;
    Simditor.locale = 'zh-CN';
    toolbar = ['mark', 'title', 'bold', 'italic', 'color', '|', 'ol', 'ul', 'blockquote', '|', 'link', 'image', 'hr', '|', 'alignment'];
    mobileToolbar = ["bold", "color", "ul", "ol"];
    if (mobilecheck()) {
      toolbar = mobileToolbar;
    }
    editor = new Simditor({
      textarea: $('#txt-content'),
      placeholder: '这里输入文字...',
      toolbar: toolbar,
      pasteImage: true,
      defaultImage: 'assets/images/image.png',
      upload: location.search === '?upload' ? {
        url: '/upload'
      } : false
    });
    $preview = $('#preview');
    if ($preview.length > 0) {
      return editor.on('valuechanged', function(e) {
        return $preview.html(editor.getValue());
      });
    }
  });

}).call(this);
