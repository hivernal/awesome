local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")


local widgets = {}


local volume = {
	widget = wibox.widget {
		{
			{
				id     = "icon",
				text   = "",
				valign = "center",
				font   = "JetBrainsMonoMedium Nerd Font 22",
				widget = wibox.widget.textbox
			},
			forced_width = 27,
			layout = wibox.layout.stack
		},
		{
			text = "",
			valign = "center",
			widget = wibox.widget.textbox
		},
		layout = wibox.layout.align.horizontal
	},
	update = function(w, out)
		if string.match(out, "%[(o%D%D?)%]") == "off" then
			w.widget.first.icon.text = "婢"
			w.widget.second.text = "muted"
		else
			out = tonumber(string.match(out, "(%d?%d?%d)%%"))
			if out < 15 then w.widget.first.icon.text = "奄"
			elseif out < 50 then w.widget.first.icon.text = "奔"
			else w.widget.first.icon.text = "墳"
			end
			w.widget.second.text = out .. "%"
		end
	end
}


local battery = {
	widget = wibox.widget {
		{
			{
				id     = "icon",
				text   = "",
				font   = "JetBrainsMonoMedium Nerd Font 15",
				valign = "center",
				widget = wibox.widget.textbox
			},
			forced_width = 30,
			layout = wibox.layout.stack
		},
		{
			text = "",
			valign = "center",
			widget = wibox.widget.textbox
		},
		layout = wibox.layout.align.horizontal,
	},
	update = function(w, out)
		w.widget.second.text = string.gsub(out, "\n", "%%")
		local capacity = tonumber(out)
		if capacity < 21 then
			w.widget.first.icon.text = ""
		elseif capacity < 41 then
			w.widget.first.icon.text = ""
		elseif capacity < 61 then
			w.widget.first.icon.text = ""
		elseif capacity < 81 then
			w.widget.first.icon.text = ""
		else
			w.widget.first.icon.text = ""
		end
	end
}

local wlan = {
	widget = wibox.widget {
		{
			{
				id     = "icon",
				text   = "",
				font   = "JetBrainsMonoMedium Nerd Font 16",
				valign = "center",
				widget = wibox.widget.textbox
			},
			forced_width = 28,
			layout = wibox.layout.stack
		},
		{
			text = "disconnected",
			valign = "center",
			widget = wibox.widget.textbox
		},
		layout = wibox.layout.align.horizontal,
	},
	update = function(w, out)
		if out == "\n" then
			w.widget.second.text = "disconnected"
		elseif out == "" then
			w.widget.second.text = "connecting..."
		else
			w.widget.second.text = string.gsub(out, "\n", " ")
		end
	end
}


local memory = {
	widget = wibox.widget {
		{
			{
				id     = "icon",
				text   = "",
				font   = "JetBrainsMonoMedium Nerd Font 15",
				valign = "center",
				widget = wibox.widget.textbox
			},
			forced_width = 22,
			layout = wibox.layout.stack
		},
		{
			text = "",
			valign = "center",
			widget = wibox.widget.textbox
		},
		layout = wibox.layout.align.horizontal,
	},
	update = function(w, out)
		w.widget.second.text = string.gsub(out, "\n", "")
	end
}


gears.timer {
	timeout   = 1,
	call_now  = true,
	autostart = true,
	callback  = function()
		awful.spawn.easy_async("amixer sget Master", function(out)
			volume:update(out)
		end)
	end
}

gears.timer {
	timeout   = 3,
	call_now  = true,
	autostart = true,
	callback  = function()
		awful.spawn.easy_async_with_shell("free -h | awk '(NR==2){ print $3 }'", function(out)
			memory:update(out)
		end)
	end
}

gears.timer {
	timeout   = 10,
	call_now  = true,
	autostart = true,
	callback  = function()
		awful.spawn.easy_async_with_shell("nmcli | grep connected | cut -b 20-",
			function(out)
				wlan:update(out)
			end)
		awful.spawn.easy_async("cat /sys/class/power_supply/BAT0/capacity",
			function(out)
				battery:update(out)
			end)
	end
}


local time = wibox.widget {
	{
		{
			text   = "  ",
			font   = "JetBrainsMonoMedium Nerd Font 16",
			valign = "center",
			widget = wibox.widget.textbox
		},
		forced_width = 50,
		layout = wibox.layout.stack
	},
	{
		format = "%H:%M",
		timezone = "Asia/Krasnoyarsk",
		refresh = 60,
		valign = "center",
		widget = wibox.widget.textclock
	},
	layout = wibox.layout.align.horizontal
}


local keyboardlayout = {
	widget = wibox.widget {
		{
			{
				text   = "",
				font   = "JetBrainsMonoMedium Nerd Font 18",
				valign = "center",
				widget = wibox.widget.textbox
			},
			forced_width = 25,
			layout = wibox.layout.stack
		},
		{
			text = "",
			valign = "center",
			widget = wibox.widget.textbox
		},
		layout = wibox.layout.align.horizontal
	},
	update = function(w)
		local text = awesome.xkb_get_layout_group()
		if text == 0 then
			text = "us"
		else
			text = "ru"
		end
		w.widget.second.text = text
	end
}

awesome.connect_signal("xkb::group_changed", function()
	keyboardlayout:update()
end)
awesome.emit_signal("xkb::group_changed")


widgets = {
	time = time,
	keyboardlayout = keyboardlayout,
	volume = volume,
	memory = memory,
	battery = battery,
	wlan = wlan,
}


return widgets
