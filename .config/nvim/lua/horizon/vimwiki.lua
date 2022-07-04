vim.cmd [[ 
highlight VimwikiHeader1 guifg=#f7768e 
highlight VimwikiHeader2 guifg=#9ece6a
highlight VimwikiHeader3 guifg=#7aa2f7
highlight VimwikiHeader4 guifg=#bb9af7
highlight VimwikiHeader5 guifg=#7dcfff
highlight VimwikiHeader6 guifg=#e0af68
]]

vim.g.vimwiki_listsyms = '✗○◐●✓'
vim.g.vimwiki_list = {
  {
    path = '/mnt/backup/vimwiki',
    automatic_nested_syntaxes = 1,
  },
}
vim.g.vimwiki_table_mappings = 0
vim.g.vimwiki_table_auto_fmt = 0

