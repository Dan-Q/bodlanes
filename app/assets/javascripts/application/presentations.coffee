$ ->
  if $('#presentation_plugins_enabled').length == 1
    # Set up plugin checkboxes
    $('#presentation_plugins_enabled').hide()
    known_plugins = JSON.parse $('#known-plugins-json').html()
    $('#presentation_plugins_enabled').after('<ul id="plugin-picker"></ul>')
    plugin_picker = $('#plugin-picker')
    for plugin in known_plugins
      plugin_label = "<strong>#{plugin.name}</strong>"
      if plugin.description? then plugin_label += "<small>#{plugin.description}</small>"
      plugin_picker.append("<li><label for=\"plugin-checkbox-#{plugin.name}\"><input type=\"checkbox\" data-value=\"#{plugin.name}\" id=\"plugin-checkbox-#{plugin.name}\" /> #{plugin_label}</label></li>")
    plugin_picker.on 'change click', 'input:checkbox', ->
      plugin_list = ($(p).data('value') for p in plugin_picker.find('input:checkbox:checked')) || []
      $('#presentation_plugins_enabled').val(plugin_list.join(','))

    # Check (only) already enabled checkboxes
    plugin_picker.find('input:checkbox').prop('checked', false)
    for already_enabled_plugin in $('#presentation_plugins_enabled').val().split(',')
      plugin_picker.find("input:checkbox[data-value='#{already_enabled_plugin}']").prop('checked', true)

    # Automatically style "color scheme" plugins
    $('.color-palette-example.unformatted').each ->
      colors = $(this).text().split(/ *, */)
      $(this).html("<div style=\"background: #{color}\">&nbsp;</div>" for color in colors)
      $(this).removeClass 'unformatted'