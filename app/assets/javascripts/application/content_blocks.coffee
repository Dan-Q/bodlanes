$ ->
  if $('.timing-events').length > 0
    TIMING_EVENT_ROW = """
      <li class="timing-event">
        <select class="timing-event-type" data-json-key="type">#
          <option value="">Select one...</option>
          <option value="after">After ... milliseconds</option>
        </select>
        <span data-if=".timing-event-type" data-eq="after">
          <input type="number" data-json-key="after-ms" />ms
          <select data-json-key="after-action">
            <option value="go">Go to...</option>
          </select>
          <select data-json-key="after-action-go-block" class="content-block-select">
            <option></option>
          </select>
          <select data-json-key="after-action-go-area" class="content-area-select">
            <option value="">Default</option>
          </select>
        </span>
      </li>
    """
    LINKABLE_CONTENT_AREAS = JSON.parse($('#linkable-content-areas-json').html())
    LINKABLE_CONTENT_BLOCKS = JSON.parse($('#linkable-content-blocks-json').html())
  
    load_drop_downs = ->
      $('.content-block-select:not(.loaded)').each ->
        $(this).append("<option value=\"#{block.id}\">#{block.name}</option>") for block in LINKABLE_CONTENT_BLOCKS
        $(this).addClass 'loaded'
      $('.content-area-select:not(.loaded)').each ->
        $(this).append("<option value=\"#{area.id}\">#{area.name}</option>") for area in LINKABLE_CONTENT_AREAS
        $(this).addClass 'loaded'

    # Add interactive widget with which to edit timing events
    $('.timing-events').each ->
      hidden_field = $(this).find('input:hidden')
      hidden_field.after('<ul class="timing-events-editor"></ul>')
      editor = $(this).find('.timing-events-editor')
      
      # Load from JSON
      json_text = hidden_field.val()
      json_text = "[]" if json_text == ""
      for t in JSON.parse(json_text)
        editor.append TIMING_EVENT_ROW
        load_drop_downs()
        new_row = editor.find('.timing-event:last')
        for f in new_row.find('[data-json-key]')
          f = $(f)
          f.val t[f.data('json-key')]

      # Blank row to enter new data
      editor.append TIMING_EVENT_ROW      # On change, save to JSON and if required add another row
      $('.timing-events-editor').on 'change keyup', '[data-json-key]', ->
        result = []
        # Add fresh blank row if needed
        if editor.find('li:last .timing-event-type').val() != ''
          editor.append TIMING_EVENT_ROW
        load_drop_downs()
        # Iterate through timing events
        for li in editor.find('li')
          li = $(li)
          # show/hide fields
          for section in li.find('[data-if]')
            section = $(section)
            section.toggle(section.closest('.timing-event').find(section.data('if')).val() == section.data('eq'))
          # prep to save to JSON
          row = {}
          for f in li.find('[data-json-key]:visible')
            f = $(f)
            row[f.data('json-key')] = f.val() unless f.val() == ""
          result.push(row) if row['type']
        # TODO: remove excess blank rows
        # Write out stringified JSON
        hidden_field.val(JSON.stringify(result))
      .find('[data-json-key]:first').trigger 'change'


