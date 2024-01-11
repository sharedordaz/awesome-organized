local beautiful = require('beautiful')
local gears = require('gears')
local VARS = require('user-variables')
-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/custom/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = VARS.terminal
editor = os.getenv("EDITOR") or VARS.editor
editor_cmd = terminal .. " -e " .. VARS.editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = VARS.modkey
-- }}}
