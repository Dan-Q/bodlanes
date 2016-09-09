# Makes ACE Code Editor work
$ ->
  $('.code-editor').each ->
    editor = ace.edit $(this).attr('id')
    session = editor.getSession()
    session.setMode("ace/mode/#{$(this).data('code-lang')}")
    session.setUseSoftTabs(true)
    session.setTabSize(2)
    editor.setShowPrintMargin(false)