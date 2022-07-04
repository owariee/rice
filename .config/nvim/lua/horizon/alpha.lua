local alpha = require("alpha")

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
  dashboard.button("f", " " .. " find file", ":telescope find_files <cr>"),
  dashboard.button("e", " " .. " new file", ":ene <bar> startinsert <cr>"),
  dashboard.button("p", " " .. " find project", ":lua require('telescope').extensions.projects.projects()<cr>"),
  dashboard.button("r", " " .. " recent files", ":telescope oldfiles <cr>"),
  dashboard.button("t", " " .. " find text", ":telescope live_grep <cr>"),
  dashboard.button("c", " " .. " config", ":e ~/.config/nvim/init.lua <cr>"),
  dashboard.button("q", " " .. " quit", ":qa<cr>"),
}
local function footer()
  return "chrisatmachine.com"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "type"
dashboard.section.header.opts.hl = "include"
dashboard.section.buttons.opts.hl = "keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
