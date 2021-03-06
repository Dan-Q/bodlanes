# Makes ACE Code Editor work
$ ->
  $('.code-editor:not(.code-editor-enabled)').each ->
    $(this).addClass('code-editor-enabled')
    name = $(this).attr('name')
    id = $(this).attr('id')
    $(this).after "<input type=\"hidden\" name=\"#{name}\" id=\"#{id}-hidden\">"
    hidden_field = $("##{id}-hidden")
    editor = ace.edit id
    session = editor.getSession()
    session.setMode("ace/mode/#{$(this).data('code-lang')}")
    session.setUseSoftTabs(true)
    session.setTabSize(2)
    editor.setShowPrintMargin(false)
    session.on 'change', (e)->
      hidden_field.val(editor.getValue())
    hidden_field.val(editor.getValue())