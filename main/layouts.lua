awful = require('awful')
VARS = require('user-variables')

-- {{{ Tag layout
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts(VARS.layouts)
end)
-- }}}
