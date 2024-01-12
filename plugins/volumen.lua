local awful = require('awful')
local wibox = require('wibox')

local volumetool = {}

volumetool.widget = wibox.widget.textbox()



SINK_INDEX = 54
--Arguments: Command, refresh interval, callback function. On the arguments, stdout is the output of the command.
--At the end there is the base widget
awful.widget.watch("pamixer --get-volume", 1, function(widget, stdout, stderr)
    widget:set_text("Volumen: " .. stdout)
end, volumetool.widget)

volumetool.widget:connect_signal('button::press',function(_, _, _, button)
    if button == 1 then
        awful.spawn('pavucontrol')
    end
end)

return volumetool


