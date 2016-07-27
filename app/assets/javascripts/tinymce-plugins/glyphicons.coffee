###*
# Glyphicons plugin for TinyMCE
#
# Released under LGPL License.
# Copyright (c) 2016 Dan Q <dan@danq.me>
###

tinymce.PluginManager.add 'glyphicons', (editor) ->
  isArray = tinymce.util.Tools.isArray

  getGlyphicons = ->
    ['glass', 'leaf', 'dog', 'user', 'girl', 'car', 'user-add', 'user-remove', 'film', 'magic', 'envelope', 'camera', 'heart', 'beach-umbrella', 'train', 'print', 'bin', 'music', 'music-alt', 'heart-empty', 'home', 'snowflake', 'fire', 'magnet', 'parents', 'binoculars', 'road', 'search', 'cars', 'notes-2', 'pencil', 'bus', 'wifi-alt', 'luggage', 'old-man', 'woman', 'file', 'coins', 'plane', 'notes', 'stats', 'charts', 'pie-chart', 'group', 'keys', 'calendar', 'router', 'camera-small', 'star-empty', 'star', 'link', 'eye-open', 'eye-close', 'alarm', 'clock', 'stopwatch', 'projector', 'history', 'truck', 'cargo', 'compass', 'keynote', 'paperclip', 'power', 'lightbulb', 'tag', 'tags', 'cleaning', 'ruler', 'gift', 'umbrella', 'book', 'bookmark', 'wifi', 'cup', 'stroller', 'headphones', 'headset', 'warning-sign', 'signal', 'retweet', 'refresh', 'roundabout', 'random', 'heat', 'repeat', 'display', 'log-book', 'address-book', 'building', 'eyedropper', 'adjust', 'tint', 'crop', 'vector-path-square', 'vector-path-circle', 'vector-path-polygon', 'vector-path-line', 'vector-path-curve', 'vector-path-all', 'font', 'italic', 'bold', 'text-underline', 'text-strike', 'text-height', 'text-width', 'text-resize', 'left-indent', 'right-indent', 'align-left', 'align-center', 'align-right', 'justify', 'list', 'text-smaller', 'text-bigger', 'embed', 'embed-close', 'table', 'message-full', 'message-empty', 'message-in', 'message-out', 'message-plus', 'message-minus', 'message-ban', 'message-flag', 'message-lock', 'message-new', 'inbox', 'inbox-plus', 'inbox-minus', 'inbox-lock', 'inbox-in', 'inbox-out', 'cogwheel', 'cogwheels', 'picture', 'adjust-alt', 'database-lock', 'database-plus', 'database-minus', 'database-ban', 'folder-open', 'folder-plus', 'folder-minus', 'folder-lock', 'folder-flag', 'folder-new', 'edit', 'new-window', 'check', 'unchecked', 'more-windows', 'show-big-thumbnails', 'show-thumbnails', 'show-thumbnails-with-lines', 'show-lines', 'playlist', 'imac', 'macbook', 'ipad', 'iphone', 'iphone-transfer', 'iphone-exchange', 'ipod', 'ipod-shuffle', 'ear-plugs', 'record', 'step-backward', 'fast-backward', 'rewind', 'play', 'pause', 'stop', 'forward', 'fast-forward', 'step-forward', 'eject', 'facetime-video', 'download-alt', 'mute', 'volume-down', 'volume-up', 'screenshot', 'move', 'more', 'brightness-reduce', 'brightness-increase', 'plus-sign', 'minus-sign', 'remove-sign', 'ok-sign', 'question-sign', 'info-sign', 'exclamation-sign', 'remove-circle', 'ok-circle', 'ban-circle', 'download', 'upload', 'shopping-cart', 'lock', 'unlock', 'electricity', 'ok', 'remove', 'cart-in', 'cart-out', 'arrow-left', 'arrow-right', 'arrow-down', 'arrow-up', 'resize-small', 'resize-full', 'circle-arrow-left', 'circle-arrow-right', 'circle-arrow-top', 'circle-arrow-down', 'play-button', 'unshare', 'share', 'chevron-right', 'chevron-left', 'bluetooth', 'euro', 'usd', 'gbp', 'retweet-2', 'moon', 'sun', 'cloud', 'direction', 'brush', 'pen', 'zoom-in', 'zoom-out', 'pin', 'albums', 'rotation-lock', 'flash', 'map-marker', 'anchor', 'conversation', 'chat', 'note-empty', 'note', 'asterisk', 'divide', 'snorkel-diving', 'scuba-diving', 'oxygen-bottle', 'fins', 'fishes', 'boat', 'delete', 'sheriffs-star', 'qrcode', 'barcode', 'pool', 'buoy', 'spade', 'bank', 'vcard', 'electrical-plug', 'flag', 'credit-card', 'keyboard-wireless', 'keyboard-wired', 'shield', 'ring', 'cake', 'drink', 'beer', 'fast-food', 'cutlery', 'pizza', 'birthday-cake', 'tablet', 'settings', 'bullets', 'cardio', 't-shirt', 'pants', 'sweater', 'fabric', 'leather', 'scissors', 'bomb', 'skull', 'celebration', 'tea-kettle', 'french-press', 'coffee-cup', 'pot', 'grater', 'kettle', 'hospital', 'hospital-h', 'microphone', 'webcam', 'temple-christianity-church', 'temple-islam', 'temple-hindu', 'temple-buddhist', 'bicycle', 'life-preserver', 'share-alt', 'comments', 'flower', 'baseball', 'rugby', 'ax', 'table-tennis', 'bowling', 'tree-conifer', 'tree-deciduous', 'more-items', 'sort', 'filter', 'gamepad', 'playing-dices', 'calculator', 'tie', 'wallet', 'piano', 'sampler', 'podium', 'soccer-ball', 'blog', 'dashboard', 'certificate', 'bell', 'candle', 'pushpin', 'iphone-shake', 'pin-flag', 'turtle', 'rabbit', 'globe', 'briefcase', 'hdd', 'thumbs-up', 'thumbs-down', 'hand-right', 'hand-left', 'hand-up', 'hand-down', 'fullscreen', 'shopping-bag', 'book-open', 'nameplate', 'nameplate-alt', 'vases', 'bullhorn', 'dumbbell', 'suitcase', 'file-import', 'file-export', 'bug', 'crown', 'smoking', 'cloud-upload', 'cloud-download', 'restart', 'security-camera', 'expand', 'collapse', 'collapse-top', 'globe-af', 'global', 'spray', 'nails', 'claw-hammer', 'classic-hammer', 'hand-saw', 'riflescope', 'electrical-socket-eu', 'electrical-socket-us', 'message-forward', 'coat-hanger', 'dress', 'bathrobe', 'shirt', 'underwear', 'log-in', 'log-out', 'exit', 'new-window-alt', 'video-sd', 'video-hd', 'subtitles', 'sound-stereo', 'sound-dolby', 'sound-5-1', 'sound-6-1', 'sound-7-1', 'copyright-mark', 'registration-mark', 'radar', 'skateboard', 'golf-course', 'sorting', 'sort-by-alphabet', 'sort-by-alphabet-alt', 'sort-by-order', 'sort-by-order-alt', 'sort-by-attributes', 'sort-by-attributes-alt', 'compressed', 'package', 'cloud-plus', 'cloud-minus', 'disk-save', 'disk-open', 'disk-saved', 'disk-remove', 'disk-import', 'disk-export', 'tower', 'send', 'git-branch', 'git-create', 'git-private', 'git-delete', 'git-merge', 'git-pull-request', 'git-compare', 'git-commit', 'construction-cone', 'shoe-steps', 'plus', 'minus', 'redo', 'undo', 'golf', 'hockey', 'pipe', 'wrench', 'folder-closed', 'phone-alt', 'earphone', 'floppy-disk', 'floppy-saved', 'floppy-remove', 'floppy-save', 'floppy-open', 'translate', 'fax', 'factory', 'shop-window', 'shop', 'kiosk', 'kiosk-wheels', 'kiosk-light', 'kiosk-food', 'transfer', 'money', 'header', 'blacksmith', 'saw-blade', 'basketball', 'server', 'server-plus', 'server-minus', 'server-ban', 'server-flag', 'server-lock', 'server-new', 'charging-station', 'gas-station', 'target', 'bed', 'mosquito', 'dining-set', 'plate-of-food', 'hygiene-kit', 'blackboard', 'marriage', 'bucket', 'none-color-swatch', 'bring-forward', 'bring-to-front', 'send-backward', 'send-to-back', 'fit-frame-to-image', 'fit-image-to-frame', 'multiple-displays', 'handshake', 'child', 'baby-formula', 'medicine', 'atv-vehicle', 'motorcycle', 'bed-alt', 'tent', 'glasses', 'sunglasses', 'family', 'education', 'shoes', 'map', 'cd', 'alert', 'piggy-bank', 'star-half', 'cluster', 'flowchart', 'commodities', 'duplicate', 'copy', 'paste', 'bath-bathtub', 'bath-shower', 'shower', 'menu-hamburger', 'option-vertical', 'option-horizontal', 'currency-conversion', 'user-ban', 'user-lock', 'user-flag', 'user-asterisk', 'user-alert', 'user-key', 'user-conversation', 'database', 'database-search', 'list-alt', 'hazard-sign', 'hazard', 'stop-sign', 'lab', 'lab-alt', 'ice-cream', 'ice-lolly', 'ice-lolly-tasted', 'invoice', 'cart-tick', 'hourglass', 'cat', 'lamp', 'scale-classic', 'eye-plus', 'eye-minus', 'quote', 'bitcoin', 'yen', 'ruble', 'erase', 'podcast', 'firework', 'scale', 'king', 'queen', 'pawn', 'bishop', 'knight', 'mic-mute', 'voicemail', 'paragraph-alt', 'person-walking', 'person-wheelchair', 'underground', 'car-hov', 'car-rental', 'transport', 'taxi', 'ice-cream-no', 'uk-rat-u', 'uk-rat-pg', 'uk-rat-12a', 'uk-rat-12', 'uk-rat-15', 'uk-rat-18', 'uk-rat-r18', 'tv', 'sms', 'mms', 'us-rat-g', 'us-rat-pg', 'us-rat-pg-13', 'us-rat-restricted', 'us-rat-no-one-17', 'equalizer', 'speakers', 'remote-control', 'remote-control-tv', 'shredder', 'folder-heart', 'person-running', 'person', 'voice', 'stethoscope', 'paired', 'activity', 'watch', 'scissors-alt', 'car-wheel', 'chevron-up', 'chevron-down', 'superscript', 'subscript', 'text-size', 'text-color', 'text-background', 'modal-window', 'newspaper', 'tractor', 'camping', 'camping-benches', 'forest', 'park', 'field', 'mountains', 'fees-payments', 'small-payments', 'mixed-buildings', 'industrial-zone', 'visitor-tag', 'businessman', 'meditation', 'bath', 'donate', 'sauna', 'bedroom-nightstand', 'bedroom-lamp', 'doctor', 'engineering-networks', 'washing-machine', 'dryer', 'dishwasher', 'luggage-group', 'teenager', 'person-stick', 'person-stick-old', 'traveler', 'veteran', 'group-chat', 'elections', 'law-justice', 'judiciary', 'house-fire', 'firefighters', 'police', 'ambulance', 'light-beacon', 'important-day', 'bike-park', 'object-align-top', 'object-align-bottom', 'object-align-horizontal', 'object-align-left', 'object-align-vertical', 'object-align-right', 'reflect-y', 'reflect-x', 'tick', 'lawnmower', 'call-redirect', 'call-ip', 'call-record', 'call-ringtone', 'call-traffic', 'call-hold', 'call-incoming', 'call-outgoing', 'call-video', 'call-missed', 'theater', 'heartbeat', 'kettlebell', 'fireplace', 'street-lights', 'pedestrian', 'flood', 'open-water', 'for-sale', 'dustbin', 'door', 'camp-fire', 'fleur-de-lis', 'temperature-settings', 'article', 'sunbath', 'balanced-diet', 'ticket', 'parking-ticket', 'parking-meter', 'laptop', 'tree-structure', 'weather-warning', 'temperature-low', 'temperature-high', 'temperature-low-warning', 'temperature-high-warning', 'hurricane', 'storm', 'sorted-waste', 'ear', 'ear-deaf', 'file-plus', 'file-minus', 'file-lock', 'file-cloud', 'file-cloud-download', 'file-cloud-upload', 'paragraph', 'list-numbered', 'donate-heart', 'government', 'maze', 'chronicle', 'user-structure', 'recycle', 'gas', 'waste-pipe', 'water-pipe', 'parking', 'closed', 'mouse', 'mouse-double-click', 'mouse-left-click', 'mouse-right-click', 'mouse-middle-click', 'mouse-scroll', 'resize-vertical', 'resize-horizontal', 'temperature', 'puzzle', 'puzzle-2', 'puzzle-3', 'nearby-square', 'nearby-circle', 'rotate-right', 'rotate-left', 'pictures', 'photo-album', 'cadastral-map', 'fingerprint-scan', 'fingerprint', 'fingerprint-lock', 'fingerprint-ok', 'fingerprint-remove', 'fingerprint-reload', 'pending-notifications', 'synchronization', 'synchronization-ban', 'hash', 'gender-male', 'gender-female', 'gender-virgin-female', 'gender-intersex', 'gender-transgender', 'gender-ori-lesbian', 'gender-ori-gay', 'gender-ori-hetero', 'gender-other', 'gender-unknown', 'scanner', 'multifunction-printer', 'lasso', 'view-360', 'battery-charging', 'battery-full', 'battery-75', 'battery-50', 'battery-25', 'battery-10', 'satellite', 'satellite-dish', 'satellite-dish-alt', 'auction', 'directions', 'race', 'robot', 'ruler-alt', 'cube-empty', 'cube-black', 'move-square', 'drop', 'vr-headset', 'vr-charging', 'vr-low-battery', 'vr-paired', 'vr-settings', 'vr-maintenance', 'filter-remove', 'filter-applied', 'one-day', 'user-vr', 'user-vr-add', 'user-vr-remove', 'dice-1', 'dice-2', 'dice-3', 'dice-4', 'dice-5', 'dice-6']

  glyphiconFilter = (glyphicon) ->
    tinymce.util.Tools.grep glyphicon, (item) ->
      isArray(item) and item.length == 2

  getCharsFromSetting = (settingValue) ->
    if isArray(settingValue)
      return [].concat(glyphiconFilter(settingValue))
    if typeof settingValue == 'function'
      return settingValue()
    []

  extendGlyphicons = (glyphicon) ->
    settings = editor.settings
    if settings.glyphicon
      glyphicon = getCharsFromSetting(settings.glyphicon)
    if settings.glyphicon_append
      return [].concat(glyphicon).concat(getCharsFromSetting(settings.glyphicon_append))
    glyphicon

  getGlyphicon = ->
    extendGlyphicons getGlyphicons()

  insertIcon = (g) ->
    editor.insertContent "<span class=\"glyphicons glyphicons-#{g}\"></span>"

  showDialog = ->
    gridHtml = undefined
    x = undefined
    y = undefined
    win = undefined

    getParentTd = (elm) ->
      while elm
        if elm.nodeName == 'TD'
          return elm
        elm = elm.parentNode

    glyphicon = getGlyphicon()
    gridHtml = """
      <div class="mce-glyphicon" style="display: flex; flex-wrap: wrap; width: 920px;">
        #{("<span data-id=\"#{g}\" class=\"glyphicons x05 glyphicons-#{g}\" style=\"width: 18px; cursor: pointer;\"></span>" for g in glyphicon).join(' ')}
      </div>
    """
    glyphiconPanel = 
      type: 'container'
      html: gridHtml
      onclick: (e) ->
        target = e.target
        if /^(SPAN)$/.test(target.nodeName)
          insertIcon target.attributes['data-id'].value
          if !e.ctrlKey then win.close()

    win = editor.windowManager.open(
      title: 'Glyphicon'
      spacing: 10
      padding: 10
      width: 960
      height: 400
      items: [
        glyphiconPanel
        {
          type: 'container'
          layout: 'flex'
          direction: 'column'
          align: 'center'
          spacing: 5
          minWidth: 960
          minHeight: 400
        }
      ]
      buttons: [ {
        text: 'Close'
        onclick: ->
          win.close()

      } ])

  editor.addCommand 'mceShowGlyphicon', showDialog
  editor.addMenuItem 'glyphicon',
    text: 'Glyphicon'
    cmd: 'mceShowGlyphicon'
    context: 'insert'
  {
    getGlyphicon: getGlyphicon
    insertIcon: insertIcon
  }
