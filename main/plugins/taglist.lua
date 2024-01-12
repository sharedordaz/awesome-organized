local awful = require('awful')
local VARS = require('user-variables')
function create_taglist(s)
-- Create a taglist widget
    local mytaglist = awful.widget.taglist {
        screen  = s,
        filter  =  function(t) 
            if (VARS.show_tags == 'noempty') then
             return awful.widget.taglist.filter.noempty(t)
             elseif (VARS.show_tags == 'selected') then
             return awful.widget.taglist.filter.selected(t)
            else
             return awful.widget.taglist.filter.all(t)
            end
        end,
        buttons = {
            awful.button({ }, 1, function(t) t:view_only() end),
            awful.button({ VARS.modkey }, 1, function(t)
                                            if client.focus then
                                                client.focus:move_to_tag(t)
                                            end
                                        end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button({ VARS.modkey }, 3, function(t)
                                            if client.focus then
                                                client.focus:toggle_tag(t)
                                            end
                                        end),
            awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
            awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
        }
    }
    return mytaglist

end

return create_taglist
