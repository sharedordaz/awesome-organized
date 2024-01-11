local awful = require('awful')
local wibox = require('wibox')

local widgets = {
-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout(),

backapps = wibox.widget.systray(),


-- Create a textclock widget
mytextclock = wibox.widget.textclock(),


promptbox = awful.widget.prompt{
    bg = "#000000",
    with_shell = false
}

}

return widgets


