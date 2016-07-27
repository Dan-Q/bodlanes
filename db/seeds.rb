# Screen types
full_hd_monitor   = ScreenType.find_or_create_by(name: 'Full HD (Horizontal)', width: 1920, height: 1080, default_zoom: 0.9)
full_hd_monitor_v = ScreenType.find_or_create_by(name: 'Full HD (Vertical)', width: 1080, height: 1920, default_zoom: 0.4)
samsung_tablet    = ScreenType.find_or_create_by(name: 'Samsung Tablet', width: 1280, height: 800, default_zoom: 0.9)
ttl_kiosk         = ScreenType.find_or_create_by(name: 'TTL Kiosk', width: 1600, height: 1200, default_zoom: 0.7)
heritage_window   = ScreenType.find_or_create_by(name: 'Heritage Window', width: 3200, height: 1080, default_zoom: 0.4)

# Full HD: Full Screen
full_hd_fs        = full_hd_monitor.templates.find_or_create_by(name: 'Full Screen', code: 'full-hd-fs')
full_hd_fs.content_areas.find_or_create_by(name: 'Main Area', width: 1920, height: 1080, content_type: 'wysiwyg')

# Full HD (Vertical): Full Screen
full_hd_v_fs      = full_hd_monitor_v.templates.find_or_create_by(name: 'Full Screen', code: 'full-hd-vertical-fs')
full_hd_v_fs.content_areas.find_or_create_by(name: 'Main Area', width: 1080, height: 1920, content_type: 'wysiwyg')

# Heritage Window: Full Screen
heritage_fs       = heritage_window.templates.find_or_create_by(name: 'Full Screen', code: 'heritage-fs')
heritage_fs.content_areas.find_or_create_by(name: 'Main Area', width: 3200, height: 1080, content_type: 'wysiwyg')

# Heritage Window: 3|2
heritage_32       = heritage_window.templates.find_or_create_by(name: '3|2', code: 'heritage-32')
heritage_32.content_areas.find_or_create_by(name: 'Left Area (3x3)', width: 1920, height: 1080, content_type: 'wysiwyg')
heritage_32.content_areas.find_or_create_by(name: 'Right Area (2x3)', width: 1280, height: 1080, content_type: 'wysiwyg')

# Heritage Window: 1|4
heritage_14       = heritage_window.templates.find_or_create_by(name: '1|4', code: 'heritage-14')
heritage_14.content_areas.find_or_create_by(name: 'Left Area (1x3)', width: 640, height: 1080, content_type: 'wysiwyg')
heritage_14.content_areas.find_or_create_by(name: 'Right Area (4x3)', width: 2560, height: 1080, content_type: 'wysiwyg')

# Samsung Tablet: Full Screen
ss_tablet_fs      = samsung_tablet.templates.find_or_create_by(name: 'Full Screen', code: 'samsung-fullscreen')
ss_tablet_fs.content_areas.find_or_create_by(name: 'Main Area', width: 1280, height: 800, content_type: 'wysiwyg')

# Samsung Tablet: Bottom Menu
ss_tablet_bm      = samsung_tablet.templates.find_or_create_by(name: 'Bottom Menu', code: 'samsung-bottom-menu')
ss_tablet_bm.content_areas.find_or_create_by(name: 'Main Area', width: 1280, height: 700, content_type: 'wysiwyg')
ss_tablet_bm.content_areas.find_or_create_by(name: 'Menu Area', width: 1280, height: 100, content_type: 'wysiwyg')

