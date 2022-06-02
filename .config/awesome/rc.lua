local gears         = require("gears")
local awful         = require("awful")
local beautiful     = require("beautiful")
local lain          = require("lain")
require("awful.autofocus")

-- Set default terminal
awful.util.terminal = "st"
awful.util.tagnames = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
awful.layout.layouts = { awful.layout.suit.tile.left, lain.layout.centerwork, awful.layout.suit.spiral.dwindle }

-- Theme
beautiful.init(string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME")))

-- Wallpaper
-- beautiful.wallpaper = "/mnt/data/Pictures/Wallpapers/1613423599887.jpg"

-- Screens
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)

-- Keybindings
require("keys")

-- Gaps
beautiful.useless_gap = 5

-- Border
client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- Border radius
local border_radius = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, 5)
end
client.connect_signal("manage", function(c) c.shape = border_radius end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = vi_focus})
end)

-- Startup programs
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

run_once({ "picom",
           "xfce4-clipman",
           "xrandr --output DP-2 --mode 1920x1080 --rate 144",
           "xinput --set-prop 13 'libinput Accel Profile Enabled' 0, 1",
           "mpd",
           "xwallpaper --stretch /mnt/data/Pictures/Wallpapers/1613423599887.jpg",
           "unclutter -root",
           "redshift -l -22:-47"
           })

tag.connect_signal(
"property::selected",
  function (t)
    local selected = tostring(t.selected) == "false"
    if selected then
     local focus_timer = timer({ timeout = 0.2 })
     focus_timer:connect_signal("timeout", function()
    local c = awful.mouse.client_under_pointer()
    if not (c == nil) then
      client.focus = c
      c:raise()
    end
    focus_timer:stop()
  end)
  focus_timer:start()
 end
end)

local last_focus
client.connect_signal("unfocus", function(c) last_focus = c end)
client.connect_signal("focus", function(c) last_focus = nil end)
client.connect_signal("unmanage", function(c)
    if last_focus == c and c.transient_for then
        client.focus = c.transient_for
        c.transient_for:raise()
    end
end)
