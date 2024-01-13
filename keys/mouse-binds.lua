local awful = require('awful')

local menu = require('main.menu')
-- {{{ Mouse bindings
awful.mouse.append_global_mousebindings({
    awful.button({ }, 3, function () menu.mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext),
})
-- }}}


