local awful = require("awful")
local wibox = require("wibox")

local holamundo = {}

holamundo.widget = wibox.widget.textbox("")

awful.widget.watch("date +'%H:%M:%S'", 1, function(widget, stdout)
    widget:set_text("Hora: " .. stdout)
end, holamundo.widget)

return holamundo
