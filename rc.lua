-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.

-- Standard awesome library
--local gears = require("gears")
--local awful = require("awful")
-- Widget and layout library
--local wibox = require("wibox")
-- Theme handling library
--local beautiful = require("beautiful")
-- Notification library
--local naughty = require("naughty")
-- Declarative object management
--local ruled = require("ruled")
--local menubar = require("menubar")
--local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:

pcall(require, "luarocks.loader")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

--USER VARIABLES
VARS = require("user-variables")

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


--[[
--DEBUG
naughty.notify({
text = "true",
timeout = 50,
position = "top_left"
}
)
]]--



-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)
