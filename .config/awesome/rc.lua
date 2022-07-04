local gears     = require("gears")
local awful     = require("awful")
local beautiful = require("beautiful")
local lain      = require("lain")
local sharedtags = require("sharedtags")
require("awful.autofocus")

-- Set default terminal
awful.util.terminal = "kitty"

awful.util.tagnames = { "web", "msg", "fs", "dev", "ter", "mus", "vid", "mail", "game" }

awful.layout.layouts = {
  awful.layout.suit.tile.left,
  lain.layout.centerwork,
  awful.layout.suit.spiral.dwindle
}

-- Theme
beautiful.init(string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME")))

-- Wallpaper
-- beautiful.wallpaper = "/mnt/data/Pictures/Wallpapers/1613423599887.jpg"

-- Screens
awful.screen.connect_for_each_screen(function(s)
   beautiful.at_screen_connect(s) 
end)

local tags = sharedtags({
    { name = "main", layout = awful.layout.layouts[2] },
    { name = "www", layout = awful.layout.layouts[10] },
    { name = "game", layout = awful.layout.layouts[1] },
    { name = "misc", layout = awful.layout.layouts[2] },
    { name = "chat", screen = 2, layout = awful.layout.layouts[2] },
    { layout = awful.layout.layouts[2] },
    { screen = 2, layout = awful.layout.layouts[2] }
})

-- Keybindings
require("keys")

for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = tags[i]
                        if tag then
                           sharedtags.viewonly(tag, screen)
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = tags[i]
                      if tag then
                         sharedtags.viewtoggle(tag, screen)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

-- Gaps
beautiful.useless_gap = 5

-- -- Border
-- client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
-- client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- 
-- -- Border radius
-- local border_radius = function(cr, w, h)
--   gears.shape.rounded_rect(cr, w, h, 5)
-- end
-- client.connect_signal("manage", function(c) c.shape = border_radius end)
-- 
-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:emit_signal("request::activate", "mouse_enter", { raise = vi_focus })
end)

-- -- Startup programs
-- local function run_once(cmd_arr)
--   for _, cmd in ipairs(cmd_arr) do
--     awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
--   end
-- end

-- run_once({ "picom",
--   "xfce4-clipman",
--   "xrandr --output DP-2 --mode 1920x1080 --rate 144",
--   "xinput --set-prop 13 'libinput Accel Profile Enabled' 0, 1",
--   "mpd",
--   "xwallpaper --stretch /mnt/data/Pictures/Wallpapers/1613423599887.jpg",
--   "unclutter -root",
--   "redshift -l -22:-47"
-- })

awful.rules.rules = {
    -- Set Firefox to always map on tag number 2.
    { rule = { class = "Firefox" },
      properties = { tag = tags[2] } }, -- or tags["www"] to map it to the name instead
}

tag.connect_signal(
  "property::selected",
  function(t)
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
