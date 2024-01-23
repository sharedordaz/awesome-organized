local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')
local VARS = require('user-variables')

local menu = require('main.menu')
local widgets = require('main.plugins.top-bar-widgets')
local create_task_list = require('main.plugins.tasklist')
local create_layoutbox = require('main.plugins.layoutbox')
local create_taglist = require('main.plugins.taglist')

local plugins = require('plugins')

local volume_widget = require('awesome-wm-widgets.pactl-widget.volume')


screen.connect_signal("request::desktop_decoration", function(s)
    -- Each screen has its own tag table.
    awful.tag(VARS.taglist, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = widgets.promptbox
    --The layoutbox
    s.mylayoutbox = create_layoutbox(s)
    -- Create a tasklist widget
    s.mytasklist = create_task_list(s)
    --Tag List widget
    s.mytaglist = create_taglist(s)

    -- Create the wibox
    s.mywibox = awful.wibar {
        position = VARS.top_var_position,
        height = 30,
        opacity = 1,
        screen   = s,
        widget   = {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                menu.mylauncher,
                plugins.volumen,
                --volume_widget(),
                s.mytaglist,
                s.mypromptbox,
            },
            s.mytasklist, -- Middle widget
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                widgets.mykeyboardlayout,
                widgets.backapps,
                widgets.mytextclock,
                s.mylayoutbox,
            },
        }
    }
end)

