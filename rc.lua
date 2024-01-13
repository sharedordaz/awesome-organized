--AWESOME CUSTOM CONFIG


--DEPENDENCIES:
--PICOM
--PACTL (pulse-audio)
--ttf-arimo-nerd (font)

local awful = require("awful")
--local naughty = require('naughty')
--local gears = require('gears')

pcall(require, "luarocks.loader")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

--USER VARIABLES
VARS = require("user-variables")

--[[
--DEBUG
    naughty.notify({
    text = command,
    timeout = 50,
    position = "top_right"
    }
    )
    ]]--

awful.util.spawn("picom")







--MAIN: Main vanilla awesomewm modules
require('main.error-handler')
require ('main.theme-init')
require ('main.layouts')
require ('main.top-bar')
require ('main.rules')
require ('main.notifications')

--Main plugins: Main not so important modules
require ('main.plugins.wallpaper')
require ('main.plugins.titlebar')

--KEYS: Bindings
require ('keys.mouse-binds')
require ('keys.keybindings')
require ('keys.tagbindings')
require ('keys.window-mouse')


--PLUGINS: External plugins

-- add the widget to your wibox


-- add key bindings







-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)
