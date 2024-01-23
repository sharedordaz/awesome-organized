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

volumetool.notification_popup = awful.popup({
    widget = {
        {
            id = 'notification_text',
            widget = wibox.widget.textbox,
            align = 'center',
            font = 'Arimo 20',
            type = "dock"
        },
       
        layout = wibox.layout.fixed.vertical,
    },
    bg = "#282c34",
    fg = "#abb2bf",
    ontop = true,
    visible = false,
    shape = gears.shape.rounded_rect,
    border_color = "#3B4252",
    border_width = 2,
    forced_width = 400,
    forced_height = 400,
    offset = { y = 5 },
    placement = awful.placement.centered,
    opacity = 0.5,
    type = 'dock'
})

volumetool.level = 0

--Arguments: Command, refresh interval, callback function. On the arguments, stdout is the output of the command.
--At the end there is the base widget
awful.widget.watch("pamixer --get-volume", 0.1, function(widget, stdout)
    local new_level = tonumber(stdout)

    local icon = ''
    local bars = ' '
    if new_level == 0 then
        icon = ""
        bars = " "
    
    elseif new_level <= 33 then
        icon = ""
    elseif new_level <= 66 then
        icon = "󰕾"
    else
        icon = ""
    end
    if new_level > 110 then
        bars = "██████████"
    elseif new_level >= 100 then
        bars = '██████████'
    elseif new_level >= 90 then
        bars = "█████████"
    elseif new_level >= 80 then
        bars = "████████"
    elseif new_level >= 70 then
        bars = "███████"
    elseif new_level >= 60 then
        bars = "██████"
    elseif new_level >= 50 then
        bars = "█████"
    elseif new_level >= 40 then
        bars = "████"
    elseif new_level >= 30 then
        bars = "███"
    elseif new_level >= 20 then
        bars = "██"
    elseif new_level >= 10 then
        bars = "█"
    end

    if volumetool.level ~= new_level then
        local message = "  Volume   " .."\n\n[  ".. bars .. "  ]"
        volumetool.notification_popup.widget:get_children_by_id('notification_text')[1]:set_text(message)

         volumetool.notification_popup.visible = true


         gears.timer.start_new(5, function()
            volumetool.notification_popup.visible = false
            return false  -- Stop the timer after one execution
        end)

     end

    volumetool.level = new_level
    widget:set_text(icon .. "  " .. new_level)


end, volumetool.widget)

volumetool.widget:connect_signal('button::press',function(_, _, _, button)
    if button == 1 then
        awful.spawn('pavucontrol')
    end
end)



return volumetool


