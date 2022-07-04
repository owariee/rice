local colorscheme = "darkplus"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

vim.g.tokyonight_style = 'night' -- available: night, storm
vim.g.tokyonight_enable_italic = 1

vim.cmd[[colorscheme tokyonight]] -- or gruvbox

vim.cmd [[ 
highlight Normal guibg=none
highlight NonText guibg=none
highlight EndOfBuffer guibg=none
highlight SignColumn guibg=none
highlight GitSignsAdd guibg=none guifg=#9ECE6A
highlight GitSignsChange guibg=none guifg=#7AA2F7
highlight GitSignsDelete guibg=none guifg=#F7768E
"highlight StatusLine ctermbg=0 cterm=NONE
]]
