local awful = require("awful")

local vars = {

    terminal = "kitty",
    editor = "nvim",
    modkey = "Mod4",
   
    layouts = {
        awful.layout.suit.floating,
        awful.layout.suit.tile,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.spiral,
        awful.layout.suit.spiral.dwindle,
        --awful.layout.suit.max,
        --awful.layout.suit.max.fullscreen,
        --awful.layout.suit.magnifier,
        awful.layout.suit.corner.nw,
    },

    taglist = {"1","2","3","4","5","6","7"},
    show_tags = 'noempty', --noempty, selected or all.
    --taglist = tag_selector(),

    --TOPVAR
    top_var_position = "top", -- left, right, top or bottom
    top_var_height = 30,
    --Rules
    titlebars_enabled = true,


    --THEMES VARIABLES
    background_image = "~/Pictures/Wallpapers/fakewindowsxP.jpg",
    font = "Arimo 10",
    windows_padding = 10,
    screen_padding = 7,
}

return vars
