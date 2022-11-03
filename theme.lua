local theme = {}

local black, white, gray = "#282c34", "#fcfcfc", "#5c6667"

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

-- Default variables
theme.font = "JetBrainsMonoMedium NerdFont 13"
theme.wallpaper = "/home/nikita/pictures/astronavt.jpg"

-- arcchart\
-- theme.arcchart\_border\_color = nil
-- theme.arcchart\_color = nil
-- theme.arcchart\_border\_width = nil
-- theme.arcchart\_paddings = nil
-- theme.arcchart\_thickness = nil

-- awesome\
-- theme.awesome_icon = themes_path .. "zenburn/awesome-icon.png"

-- bg\
theme.bg_normal = black
theme.bg_focus = gray
-- theme.bg_systray = black
-- theme.bg\_urgent = nil
-- theme.bg_minimize = "#00000000"
-- theme.bg\_systray = nil

-- border\
-- theme.border\_marked = nil
theme.border_width = 3
theme.border_normal = black
theme.border_focus = white

-- calendar\
-- theme.calendar\_style = nil
-- theme.calendar\_font = nil
-- theme.calendar\_spacing = nil
-- theme.calendar\_week\_numbers = nil
-- theme.calendar\_start\_sunday = nil
-- theme.calendar\_long\_weekdays = nil

-- checkbox\
-- theme.checkbox\_border\_width = nil
-- theme.checkbox\_bg = nil
-- theme.checkbox\_border\_color = nil
-- theme.checkbox\_check\_border\_color = nil
-- theme.checkbox\_check\_border\_width = nil
-- theme.checkbox\_check\_color = nil
-- theme.checkbox\_shape = nil
-- theme.checkbox\_check\_shape = nil
-- theme.checkbox\_paddings = nil
-- theme.checkbox\_color = nil

-- column\
-- theme.column\_count = nil

-- cursor\
-- theme.cursor\_mouse\_resize = nil
-- theme.cursor\_mouse\_move = nil

-- enable\
-- theme.enable\_spawn\_cursor = nil

-- fg\
theme.fg_normal = white
theme.fg_focus = white
-- theme.fg\_urgent = nil
-- theme.fg\_minimize = nil

-- fullscreen\
theme.fullscreen_hide_border = true

-- gap\
theme.gap_single_client = false

-- graph\
-- theme.graph\_bg = nil
-- theme.graph\_fg = nil
-- theme.graph\_border\_color = nil

-- hotkeys\
-- theme.hotkeys\_bg = nil
-- theme.hotkeys\_fg = nil
-- theme.hotkeys\_border\_width = nil
-- theme.hotkeys\_border\_color = nil
-- theme.hotkeys\_shape = nil
-- theme.hotkeys\_modifiers\_fg = nil
-- theme.hotkeys\_label\_bg = nil
-- theme.hotkeys\_label\_fg = nil
-- theme.hotkeys\_font = nil
-- theme.hotkeys\_description\_font = nil
-- theme.hotkeys\_group\_margin = nil

-- icon\
theme.icon_theme = "Tela"

-- layout\
-- theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
-- theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
-- theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
-- theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
-- theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
-- theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
-- theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
-- theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
-- theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
-- theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
-- theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
-- theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
-- theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
-- theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- layoutlist\
-- theme.layoutlist\_fg\_normal = nil
-- theme.layoutlist\_bg\_normal = nil
-- theme.layoutlist\_fg\_selected = nil
-- theme.layoutlist\_bg\_selected = nil
-- theme.layoutlist_disable_icon = true
-- theme.layoutlist\_disable\_name = nil
-- theme.layoutlist\_font = nil
-- theme.layoutlist\_align = nil
-- theme.layoutlist\_font\_selected = nil
-- theme.layoutlist\_spacing = nil
-- theme.layoutlist\_shape = nil
-- theme.layoutlist\_shape\_border\_width = nil
-- theme.layoutlist\_shape\_border\_color = nil
-- theme.layoutlist\_shape\_selected = nil
-- theme.layoutlist\_shape\_border\_width\_selected = nil
-- theme.layoutlist\_shape\_border\_color\_selected = nil

-- master\
theme.master_width_factor = 0.55
-- theme.master\_fill\_policy = nil
-- theme.master\_count = nil

-- maximized\
-- theme.maximized_honor_padding = 20
theme.maximized_hide_border = true

-- menu\
-- theme.menu\_submenu\_icon = nil
-- theme.menu\_font = nil
-- theme.menu\_height = nil
-- theme.menu\_width = nil
-- theme.menu\_border\_color = nil
-- theme.menu\_border\_width = nil
-- theme.menu\_fg\_focus = nil
-- theme.menu\_bg\_focus = nil
-- theme.menu\_fg\_normal = nil
-- theme.menu\_bg\_normal = nil
-- theme.menu\_submenu = nil

-- menubar\
-- theme.menubar\_fg\_normal = nil
-- theme.menubar\_bg\_normal = nil
-- theme.menubar_border_width = nil
-- theme.menubar\_border\_color = nil
-- theme.menubar\_fg\_normal = nil
-- theme.menubar\_bg\_normal = nil

-- notification\
-- theme.notification\_font = nil
-- theme.notification\_bg = nil
-- theme.notification\_fg = nil
-- theme.notification\_border\_width = nil
-- theme.notification\_border\_color = nil
-- theme.notification\_shape = nil
-- theme.notification\_opacity = nil
-- theme.notification\_margin = nil
-- theme.notification\_width = nil
-- theme.notification\_height = nil
-- theme.notification\_max\_width = nil
-- theme.notification\_max\_height = nil
-- theme.notification\_icon\_size = nil

-- piechart\
-- theme.piechart\_border\_color = nil
-- theme.piechart\_border\_width = nil
-- theme.piechart\_colors = nil

-- progressbar\
-- theme.progressbar\_bg = nil
-- theme.progressbar\_fg = nil
-- theme.progressbar\_shape = nil
-- theme.progressbar\_border\_color = nil
-- theme.progressbar\_border\_width = nil
-- theme.progressbar\_bar\_shape = nil
-- theme.progressbar\_bar\_border\_width = nil
-- theme.progressbar\_bar\_border\_color = nil
-- theme.progressbar\_margins = nil
-- theme.progressbar\_paddings = nil

-- prompt\
-- theme.prompt\_fg\_cursor = nil
-- theme.prompt\_bg\_cursor = nil
-- theme.prompt\_font = nil
-- theme.prompt\_fg = nil
-- theme.prompt\_bg = nil

-- radialprogressbar\
-- theme.radialprogressbar\_border\_color = nil
-- theme.radialprogressbar\_color = nil
-- theme.radialprogressbar\_border\_width = nil
-- theme.radialprogressbar\_paddings = nil

-- separator\
-- theme.separator\_thickness = nil
-- theme.separator\_border\_color = nil
-- theme.separator\_border\_width = nil
-- theme.separator\_span\_ratio = nil
-- theme.separator\_color = nil
-- theme.separator\_shape = nil

-- slider\
-- theme.slider\_bar\_border\_width = nil
-- theme.slider\_bar\_border\_color = nil
-- theme.slider\_handle\_border\_color = nil
-- theme.slider\_handle\_border\_width = nil
-- theme.slider\_handle\_width = nil
-- theme.slider\_handle\_color = nil
-- theme.slider\_handle\_shape = nil
-- theme.slider\_bar\_shape = nil
-- theme.slider\_bar\_height = nil
-- theme.slider\_bar\_margins = nil
-- theme.slider\_handle\_margins = nil
-- theme.slider\_bar\_color = nil

-- snap\
-- theme.snap\_bg = nil
-- theme.snap\_border\_width = nil
-- theme.snap\_shape = nil

-- snapper\
-- theme.snapper\_gap = nil

-- systray\
-- theme.systray\_icon\_spacing = nil

-- taglist\
-- theme.taglist\_fg\_focus = nil
-- theme.taglist\_bg\_focus = nil
-- theme.taglist\_fg\_urgent = nil
-- theme.taglist\_bg\_occupied = nil
-- theme.taglist\_bg\_urgent = nil
-- theme.taglist\_fg\_occupied = nil
-- theme.taglist_bg_empty = nil
theme.taglist_fg_empty = gray
-- theme.taglist\_bg\_volatile = nil
-- theme.taglist\_fg\_volatile = nil
-- theme.taglist\_squares\_sel = nil
-- theme.taglist\_squares\_unsel = nil
-- theme.taglist\_squares\_sel\_empty = nil
-- theme.taglist\_squares\_unsel\_empty = nil
-- theme.taglist_squares_resize = 10
-- theme.taglist\_disable\_icon = nil
-- theme.taglist\_font = nil
-- theme.taglist_spacing = 20
-- theme.taglist\_shape = nil
-- theme.taglist\_shape\_border\_width = nil
-- theme.taglist\_shape\_border\_color = nil
-- theme.taglist\_shape\_empty = nil
-- theme.taglist\_shape\_border\_width\_empty = nil
-- theme.taglist\_shape\_border\_color\_empty = nil
-- theme.taglist\_shape\_focus = nil
-- theme.taglist\_shape\_border\_width\_focus = nil
-- theme.taglist\_shape\_border\_color\_focus = nil
-- theme.taglist\_shape\_urgent = nil
-- theme.taglist\_shape\_border\_width\_urgent = nil
-- theme.taglist\_shape\_border\_color\_urgent = nil
-- theme.taglist\_shape\_volatile = nil
-- theme.taglist\_shape\_border\_width\_volatile = nil
-- theme.taglist\_shape\_border\_color\_volatile = nil

-- tasklist\
-- theme.tasklist\_fg\_normal = nil
-- theme.tasklist_bg_normal = black
-- theme.tasklist\_fg\_focus = nil
theme.tasklist_bg_focus = black
-- theme.tasklist\_fg\_urgent = nil
-- theme.tasklist\_bg\_urgent = nil
-- theme.tasklist\_fg\_minimize = nil
-- theme.tasklist\_bg\_minimize = nil
-- theme.tasklist\_bg\_image\_normal = nil
-- theme.tasklist\_bg\_image\_focus = nil
-- theme.tasklist\_bg\_image\_urgent = nil
-- theme.tasklist\_bg\_image\_minimize = nil
theme.tasklist_disable_icon = true
-- theme.tasklist\_disable\_task\_name = nil
theme.tasklist_plain_task_name = true
-- theme.tasklist\_font = nil
-- theme.tasklist\_align = nil
-- theme.tasklist\_font\_focus = nil
-- theme.tasklist\_font\_minimized = nil
-- theme.tasklist\_font\_urgent = nil
-- theme.tasklist\_spacing = nil
-- theme.tasklist\_shape = nil
-- theme.tasklist\_shape\_border\_width = nil
-- theme.tasklist\_shape\_border\_color = nil
-- theme.tasklist\_shape\_focus = nil
-- theme.tasklist\_shape\_border\_width\_focus = nil
-- theme.tasklist\_shape\_border\_color\_focus = nil
-- theme.tasklist\_shape\_minimized = nil
-- theme.tasklist\_shape\_border\_width\_minimized = nil
-- theme.tasklist\_shape\_border\_color\_minimized = nil
-- theme.tasklist\_shape\_urgent = nil
-- theme.tasklist\_shape\_border\_width\_urgent = nil
-- theme.tasklist\_shape\_border\_color\_urgent = nil

-- titlebar\
-- theme.titlebar\_fg\_normal = nil
-- theme.titlebar\_bg\_normal = nil
-- theme.titlebar\_bgimage\_normal = nil
-- theme.titlebar\_fg = nil
-- theme.titlebar\_bg = nil
-- theme.titlebar\_bgimage = nil
-- theme.titlebar\_fg\_focus = nil
-- theme.titlebar\_bg\_focus = nil
-- theme.titlebar\_bgimage\_focus = nil
-- theme.titlebar\_floating\_button\_normal = nil
-- theme.titlebar\_maximized\_button\_normal = nil
-- theme.titlebar\_minimize\_button\_normal = nil
-- theme.titlebar\_minimize\_button\_normal\_hover = nil
-- theme.titlebar\_minimize\_button\_normal\_press = nil
-- theme.titlebar\_close\_button\_normal = nil
-- theme.titlebar\_close\_button\_normal\_hover = nil
-- theme.titlebar\_close\_button\_normal\_press = nil
-- theme.titlebar\_ontop\_button\_normal = nil
-- theme.titlebar\_sticky\_button\_normal = nil
-- theme.titlebar\_floating\_button\_focus = nil
-- theme.titlebar\_maximized\_button\_focus = nil
-- theme.titlebar\_minimize\_button\_focus = nil
-- theme.titlebar\_minimize\_button\_focus\_hover = nil
-- theme.titlebar\_minimize\_button\_focus\_press = nil
-- theme.titlebar\_close\_button\_focus = nil
-- theme.titlebar\_close\_button\_focus\_hover = nil
-- theme.titlebar\_close\_button\_focus\_press = nil
-- theme.titlebar\_ontop\_button\_focus = nil
-- theme.titlebar\_sticky\_button\_focus = nil
-- theme.titlebar\_floating\_button\_normal\_active = nil
-- theme.titlebar\_floating\_button\_normal\_active\_hover = nil
-- theme.titlebar\_floating\_button\_normal\_active\_press = nil
-- theme.titlebar\_maximized\_button\_normal\_active = nil
-- theme.titlebar\_maximized\_button\_normal\_active\_hover = nil
-- theme.titlebar\_maximized\_button\_normal\_active\_press = nil
-- theme.titlebar\_ontop\_button\_normal\_active = nil
-- theme.titlebar\_ontop\_button\_normal\_active\_hover = nil
-- theme.titlebar\_ontop\_button\_normal\_active\_press = nil
-- theme.titlebar\_sticky\_button\_normal\_active = nil
-- theme.titlebar\_sticky\_button\_normal\_active\_hover = nil
-- theme.titlebar\_sticky\_button\_normal\_active\_press = nil
-- theme.titlebar\_floating\_button\_focus\_active = nil
-- theme.titlebar\_floating\_button\_focus\_active\_hover = nil
-- theme.titlebar\_floating\_button\_focus\_active\_press = nil
-- theme.titlebar\_maximized\_button\_focus\_active = nil
-- theme.titlebar\_maximized\_button\_focus\_active\_hover = nil
-- theme.titlebar\_maximized\_button\_focus\_active\_press = nil
-- theme.titlebar\_ontop\_button\_focus\_active = nil
-- theme.titlebar\_ontop\_button\_focus\_active\_hover = nil
-- theme.titlebar\_ontop\_button\_focus\_active\_press = nil
-- theme.titlebar\_sticky\_button\_focus\_active = nil
-- theme.titlebar\_sticky\_button\_focus\_active\_hover = nil
-- theme.titlebar\_sticky\_button\_focus\_active\_press = nil
-- theme.titlebar\_floating\_button\_normal\_inactive = nil
-- theme.titlebar\_floating\_button\_normal\_inactive\_hover = nil
-- theme.titlebar\_floating\_button\_normal\_inactive\_press = nil
-- theme.titlebar\_maximized\_button\_normal\_inactive = nil
-- theme.titlebar\_maximized\_button\_normal\_inactive\_hover = nil
-- theme.titlebar\_maximized\_button\_normal\_inactive\_press = nil
-- theme.titlebar\_ontop\_button\_normal\_inactive = nil
-- theme.titlebar\_ontop\_button\_normal\_inactive\_hover = nil
-- theme.titlebar\_ontop\_button\_normal\_inactive\_press = nil
-- theme.titlebar\_sticky\_button\_normal\_inactive = nil
-- theme.titlebar\_sticky\_button\_normal\_inactive\_hover = nil
-- theme.titlebar\_sticky\_button\_normal\_inactive\_press = nil
-- theme.titlebar\_floating\_button\_focus\_inactive = nil
-- theme.titlebar\_floating\_button\_focus\_inactive\_hover = nil
-- theme.titlebar\_floating\_button\_focus\_inactive\_press = nil
-- theme.titlebar\_maximized\_button\_focus\_inactive = nil
-- theme.titlebar\_maximized\_button\_focus\_inactive\_hover = nil
-- theme.titlebar\_maximized\_button\_focus\_inactive\_press = nil
-- theme.titlebar\_ontop\_button\_focus\_inactive = nil
-- theme.titlebar\_ontop\_button\_focus\_inactive\_hover = nil
-- theme.titlebar\_ontop\_button\_focus\_inactive\_press = nil
-- theme.titlebar\_sticky\_button\_focus\_inactive = nil
-- theme.titlebar\_sticky\_button\_focus\_inactive\_hover = nil
-- theme.titlebar\_sticky\_button\_focus\_inactive\_press = nil

-- tooltip\
-- theme.tooltip\_border\_color = nil
-- theme.tooltip\_bg = nil
-- theme.tooltip\_fg = nil
-- theme.tooltip\_font = nil
-- theme.tooltip\_border\_width = nil
-- theme.tooltip\_opacity = nil
-- theme.tooltip\_shape = nil
-- theme.tooltip\_align = nil

-- useless\
theme.useless_gap = 5

-- wibar\
-- theme.wibar\_stretch = nil
-- theme.wibar\_border\_width = nil
-- theme.wibar\_border\_color = nil
-- theme.wibar\_ontop = nil
-- theme.wibar\_cursor = nil
-- theme.wibar\_opacity = nil
-- theme.wibar\_type = nil
-- theme.wibar\_width = nil
-- theme.wibar\_height = nil
-- theme.wibar\_bg = nil
-- theme.wibar\_bgimage = nil
-- theme.wibar\_fg = nil
-- theme.wibar\_shape = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
