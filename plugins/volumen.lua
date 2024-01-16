local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local naughty = require('naughty')



local volumetool = {}


--GET SINK
local command = gears.filesystem.get_configuration_dir() .. 'scripts/sink-selector.sh'
--local command = './scripts/sink-selector.sh'

volumetool.SINK_INDEX = 0

awful.spawn.easy_async_with_shell(command, function(out)
    volumetool.SINK_INDEX = out

    --DEBUG

end)



volumetool.widget = wibox.widget.textbox()

--Arguments: Command, refresh interval, callback function. On the arguments, stdout is the output of the command.
--At the end there is the base widget
awful.widget.watch("pamixer --get-volume", 1, function(widget, stdout, stderr)
    volumetool.level = stdout
    widget:set_text("Volumen: " .. stdout)
end, volumetool.widget)

volumetool.widget:connect_signal('button::press',function(_, _, _, button)
    if button == 1 then
        awful.spawn('pavucontrol')
    end
end)

return volumetool


