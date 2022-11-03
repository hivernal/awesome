pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

local wibox = require("wibox")

local beautiful = require("beautiful")

local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

require("awful.hotkeys_popup.keys")

-- Error Handling
if awesome.startup_errors then
  naughty.notify({ preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors })
end

do
  local in_error = false
  awesome.connect_signal("debug::error", function(err)
    -- Make sure we don't go into an endless error loop
    if in_error then return end
    in_error = true

    naughty.notify({ preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(err) })
    in_error = false
  end)
end

-- Variable definitions
beautiful.init("/home/nikita/.config/awesome/theme.lua")
local modkey = "Mod4"
local terminal = "kitty"
local editor = os.getenv("EDITOR") or "nano"
local editor_cmd = terminal .. " -e " .. editor

-- Layout list
awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.max,
  -- awful.layout.suit.magnifier,
}

-- Menubar
menubar.utils.terminal = terminal
menubar.geometry.height = 35

-- Buttons for taglist on wibar
local taglist_buttons = gears.table.join(
-- Open tag
  awful.button({}, 1, function(t) t:view_only() end),
  -- Move client to tag
  awful.button({ modkey }, 1, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),
  -- Toggle tag
  awful.button({}, 3, awful.tag.viewtoggle),
  -- Toggle client on tag
  awful.button({ modkey }, 3, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),
  -- Scroll tags
  awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

-- Buttons for tasklist on wibar
--[[ local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal(
				"request::activate",
				"tasklist",
				{ raise = true }
			)
		end
	end),
awful.button({}, 3, function()
	awful.menu.client_list({ theme = { width = 250 } })
end),
awful.button({}, 4, function()
	awful.client.focus.byidx(1)
end),
awful.button({}, 5, function()
	awful.client.focus.byidx(-1)
end)) ]]

-- Wallpaper
--[[ local function set_wallpaper(s)
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end ]]

-- Module with custom widgets
local widgets = require("widgets")

-- Setup screens
-- screen.connect_signal("property::geometry", set_wallpaper)
awful.screen.connect_for_each_screen(function(s)
  -- set_wallpaper(s)
  awful.tag({ " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 " },
    s, awful.layout.layouts[1])

  -- create a layoutbox widget and buttons
  -- s.layoutbox = awful.widget.layoutbox(s)
  --[[ s.layoutbox:buttons(gears.table.join(
  	awful.button({}, 1, function() awful.layout.inc(1) end),
  	awful.button({}, 3, function() awful.layout.inc(-1) end),
  	awful.button({}, 4, function() awful.layout.inc(1) end),
  	awful.button({}, 5, function() awful.layout.inc(-1) end))) ]]

  -- Create a taglist widget
  s.taglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons
  }

  -- Create a tasklist widget
  s.tasklist = awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.focused,
    -- buttons = tasklist_buttons
  }

  -- Create the wibox
  s.wibox = awful.wibar({ position = "top", height = 35, screen = s })

  -- Add widgets to the wibox
  s.wibox:setup {
    {
      -- Left widgets
      s.taglist,
      s.tasklist,
      forced_width = 885,
      layout = wibox.layout.fixed.horizontal
    },
    widgets.time, -- Central widget
    {
      -- Right widgets
      -- s.layoutbox,
      widgets.layout.widget,
      widgets.keyboardlayout.widget,
      widgets.volume.widget,
      widgets.memory,
      widgets.battery,
      widgets.wlan,
      spacing = 30,
      layout  = wibox.layout.fixed.horizontal
    },
    layout = wibox.layout.align.horizontal
  }
end)

-- Mouse bindings for client
local clientbuttons = gears.table.join(
  awful.button({}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
  end),
  awful.button({ modkey }, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.move(c)
  end),
  awful.button({ modkey }, 3, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.resize(c)
  end)
)

-- Keybindings for wm
local globalkeys = gears.table.join(
  awful.key({ modkey }, "s", hotkeys_popup.show_help,
    { description = "show help", group = "awesome" }),
  awful.key({ modkey }, "Left", awful.tag.viewprev,
    { description = "view previous", group = "tag" }),
  awful.key({ modkey }, "Right", awful.tag.viewnext,
    { description = "view next", group = "tag" }),
  awful.key({ modkey }, "Escape", awful.tag.history.restore,
    { description = "go back", group = "tag" }),

  awful.key({ modkey }, "j", function()
    awful.client.focus.byidx(1)
  end,
    { description = "focus next by index", group = "client" }),
  awful.key({ modkey, }, "k", function()
    awful.client.focus.byidx(-1)
  end,
    { description = "focus previous by index", group = "client" }),
  awful.key({ modkey, "Shift" }, "j", function()
    awful.client.swap.byidx(1)
  end,
    { description = "swap with next client by index", group = "client" }),
  awful.key({ modkey, "Shift" }, "k", function()
    awful.client.swap.byidx(-1)
  end,
    { description = "swap with previous client by index", group = "client" }),
  awful.key({ modkey, }, "l", function()
    awful.tag.incmwfact(0.05)
  end,
    { description = "increase master width factor", group = "layout" }),
  awful.key({ modkey, }, "h", function()
    awful.tag.incmwfact(-0.05)
  end,
    { description = "decrease master width factor", group = "layout" }),

  awful.key({ modkey, "Shift" }, "Return", function()
    awful.spawn(terminal)
  end,
    { description = "open a terminal", group = "rauncher" }),
  awful.key({ modkey, "Shift" }, "r", awesome.restart,
    { description = "reload awesome", group = "awesome" }),
  awful.key({ modkey, "Shift" }, "e", awesome.quit,
    { description = "quit awesome", group = "awesome" }),
  awful.key({ modkey, "Shift" }, "q", function()
    awful.spawn("shutdown -h now")
  end,
    { description = "quit awesome", group = "awesome" }),
  awful.key({ modkey }, "b", function()
    for s in screen do
      s.wibox.visible = not s.wibox.visible
    end
  end,
    { description = "Show/hide wibox (bar)", group = "awesome" }),
  awful.key({ modkey }, "p", menubar.show,
    { description = "show the dmenu", group = "launcher" }),
  --[[ awful.key({ modkey }, "r", function() 
    awful.screen.focused().mypromptbox:run()
  end,
  	{ description = "run prompt", group = "launcher" }), ]]

  awful.key({}, "XF86MonBrightnessUp", function()
    awful.spawn("xbacklight -inc 5")
  end,
    { description = "toggle mute", group = "volume" }),
  awful.key({}, "XF86MonBrightnessDown", function()
    awful.spawn("xbacklight -dec 5")
  end,
    { description = "toggle mute", group = "volume" }),

  awful.key({}, "XF86AudioMute", function()
    awful.spawn.easy_async("amixer sset Master toggle", function(out)
      widgets.volume:update(out)
    end)
  end,
    { description = "toggle mute", group = "volume" }),
  awful.key({}, "XF86AudioRaiseVolume", function()
    awful.spawn.easy_async("amixer sset Master 5%+", function(out)
      widgets.volume:update(out)
    end)
  end,
    { description = "up volume", group = "volume" }),
  awful.key({}, "XF86AudioLowerVolume", function()
    awful.spawn.easy_async("amixer sset Master 5%-", function(out)
      widgets.volume:update(out)
    end)
  end,
    { description = "lower volume", group = "volume" }),

  awful.key({}, "Print", function()
    awful.spawn("flameshot gui")
  end,
    { description = "printscreen", group = "print" }),

  awful.key({ modkey, "Shift" }, "h", function()
    awful.tag.incnmaster(1, nil, true)
  end,
    { description = "increase the number of master clients", group = "layout" }),
  awful.key({ modkey, "Shift" }, "l", function()
    awful.tag.incnmaster(-1, nil, true)
  end,
    { description = "decrease the number of master clients", group = "layout" }),
  awful.key({ modkey, }, "Tab", function()
    awful.layout.inc(1)
  end,
    { description = "select next", group = "layout" }),
  awful.key({ modkey, "Shift" }, "Tab", function()
    awful.layout.inc(-1)
  end,
    { description = "select previous", group = "layout" })
)

for i = 1, 9 do
  globalkeys = gears.table.join(globalkeys,
    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        tag:view_only()
      end
    end,
      { description = "view tag #" .. i, group = "tag" }),
    -- Toggle tag display.
    awful.key({ modkey, "Control" }, "#" .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end,
      { description = "toggle tag #" .. i, group = "tag" }),
    -- Move client to tag.
    awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
      { description = "move focused client to tag #" .. i, group = "tag" }),
    -- Toggle tag on focused client.
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end,
      { description = "toggle focused client on tag #" .. i, group = "tag" })
  )
end

-- Keybindings for client
local clientkeys = gears.table.join(
  awful.key({ modkey, }, "m", function(c)
    c.maximized = not c.maximized
    c:raise()
  end,
    { description = "(un)maximize", group = "client" }),
  awful.key({ modkey, }, "f", function(c)
    c.fullscreen = not c.fullscreen
    c:raise()
  end,
    { description = "toggle fullscreen", group = "client" }),
  awful.key({ modkey, }, "q", function(c) c:kill() end,
    { description = "close", group = "client" }),
  awful.key({ modkey, }, "t", awful.client.floating.toggle,
    { description = "toggle floating", group = "client" }),
  awful.key({ modkey, }, "Return", function(c)
    c:swap(awful.client.getmaster())
  end,
    { description = "move to master", group = "client" })
)

-- setup Mouse bindings
root.buttons(gears.table.join(
-- awful.button({}, 3, function() mymainmenu:toggle() end),
  awful.button({}, 4, awful.tag.viewnext),
  awful.button({}, 5, awful.tag.viewprev)
))

-- Setup keybindings for wm
root.keys(globalkeys)

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    -- except = { floating = true },
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.centered
    }
  },
  -- Make some apps floating
  {
    rule_any = {
      class = {
        "Blueman-manager",
        "Nm-connection-editor",
        "Org.gnome.Nautilus",
        "Pavucontrol",
        "Thunar"
      }
    },
    properties = { floating = true }
  },
}


-- Signals
--[[ client.connect_signal("request::titlebars", function(c)
  -- buttons for the titlebar
  local buttons = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    ) ]]

  --[[ awful.titlebar(c):setup {
    { -- Left
      awful.titlebar.widget.iconwidget(c),
      buttons = buttons,
      layout  = wibox.layout.fixed.horizontal
    },
    { -- Middle
      { -- Title
        align  = "center",
        widget = awful.titlebar.widget.titlewidget(c)
      },
      buttons = buttons,
      layout  = wibox.layout.flex.horizontal
    },
    { -- Right
      awful.titlebar.widget.floatingbutton(c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.stickybutton(c),
      awful.titlebar.widget.ontopbutton(c),
      awful.titlebar.widget.closebutton(c),
      layout = wibox.layout.fixed.horizontal()
    },
    layout = wibox.layout.align.horizontal
  }
end) ]]

--[[ client.connect_signal("manage", function(c)
	if awesome.startup
			and not c.size_hints.user_position
			and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end) ]]

client.connect_signal("mouse::enter", function(c)
  c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

local function update_borders(s)
  widgets.layout:update(#s.clients, awful.layout.getname())
  local max = awful.layout.getname() == "max"
  local only_one = #s.tiled_clients < 2
  for _, c in ipairs(s.clients) do
    if max or only_one or c.floating == true then
      c.border_width = 0
    else
      c.border_width = beautiful.border_width
    end
  end
end

local function update_borders_by_client(c)
  update_borders(c.screen)
end

local function update_borders_by_tag(t)
  update_borders(t.screen)
end

client.connect_signal("focus", function(c)
  c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
  c.border_color = beautiful.border_normal
end)

client.connect_signal("unmanage", update_borders_by_client)
client.connect_signal("manage", update_borders_by_client)
client.connect_signal("tagged", update_borders_by_client)
tag.connect_signal("property::layout", update_borders_by_tag)
tag.connect_signal("property::selected", update_borders_by_tag)

-- Autostart applications
awful.spawn.with_shell("feh --bg-max /home/nikita/pictures/neboskreb.jpg")
awful.spawn.with_shell("picom")
awful.spawn.with_shell("lxpolkit")
