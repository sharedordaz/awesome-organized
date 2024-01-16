
local awful = require("awful")
local wibox = require('wibox')

local VARS = require('user-variables')

-- Crear un cuadro flotante con contenido
function create_floating_box(screen)

    volume = {}

    awful.spawn.with_shell('pamixer --get-volume', function(stdout)
        volume.volume_level = "Hello"
        end
        )
    local myfloatingbox = awful.popup {
        widget = {
            {
                {
                    text = volume.volume_level,
                    widget = wibox.widget.textbox,
                },
                margins = 8,
                widget = wibox.container.margin,
            },
            bg = beautiful.bg_normal,
            fg = beautiful.fg_normal,
            widget = wibox.container.background,
        },
        border_color = beautiful.border_focus,
        border_width = 1,
        placement = awful.placement.centered,
        ontop = true,
        screen = screen,
    }

    -- Puedes agregar más configuraciones según tus necesidades
    return myfloatingbox
end

-- Configurar el cuadro flotante para cada pantalla
awful.screen.connect_for_each_screen(function(s)
    s.myfloatingbox = create_floating_box(s)
end)



-- Llamar a este código cuando desees mostrar el cuadro flotante
awful.key({ VARS.modkey, "Control" }, "p", function () myfloatingbox.visible = not myfloatingbox.visible end,
          {description = "mostrar/ocultar cuadro flotante", group = "cliente"})


