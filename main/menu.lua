awful = require('awful')
beautiful = require('beautiful')


menubar = require('menubar')
hotkeys_popup = require('awful.hotkeys_popup')

local VARS = require('user-variables')

local terminal = VARS.terminal

local menu = {}

-- {{{ Menu
-- Create a launcher widget and a main menu
menu.myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function() awesome.quit() end },
}

menu.mymainmenu = awful.menu({ items = { { "awesome", menu.myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })
menu.mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = menu.mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

return menu
