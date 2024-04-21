local awful = require("awful")
local wibox = require("wibox")
local my_wibar = {}

function my_wibar.personalized_wibar(current_screen) 
    local wbar = awful.wibar({
        position="bottom",
        screen = current_screen,
        opacity = 0,
        bg = "#000000",
        fg = "#4E4812"
    })

    wbar:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            -- mylauncher,
            current_screen.mytaglist,
            current_screen.mypromptbox,
        },
        current_screen.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            wibox.widget.systray(),
            mytextclock,
            current_screen.mylayoutbox,
        },
    }
    return wbar
end

return my_wibar
