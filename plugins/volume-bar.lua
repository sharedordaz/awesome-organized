
local awful = require("awful")
local wibox = require('wibox')

local VARS = require('user-variables')

local volume_popup = wibox.widget.textbox()

-- Crear un cuadro flotante con contenido
awful.widget.watch('pamixer --get-volume', 1, function(widget, stdout)
    local level = tonumber(stdout)
    local icon = ''
    if level == 0 then
        icon = ""
    elseif level <= 33 then
        icon = ""
    elseif level <= 66 then
        icon = "󰕾"
    else
        icon = ""
    end
    widget:set_text(icon .. "  " .. level)



end, volume_popup)
