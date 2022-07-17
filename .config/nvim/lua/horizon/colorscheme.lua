vim.g.tokyonight_style = 'storm' -- available: night, storm
vim.g.tokyonight_enable_italic = 1

local colorscheme = "darkplus" -- darkplus, tokyonight, gruvbox, gloombuddy, moonlight

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

vim.cmd [[ 
" highlight Normal guibg=none
" highlight NonText guibg=none
" highlight EndOfBuffer guibg=none
" highlight SignColumn guibg=none
" highlight GitSignsAdd guibg=none guifg=#9ECE6A
" highlight GitSignsChange guibg=none guifg=#7AA2F7
" highlight GitSignsDelete guibg=none guifg=#F7768E
" highlight StatusLine ctermbg=0 cterm=NONE
]]
