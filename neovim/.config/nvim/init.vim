call plug#begin('~/.cache/nvim/plugged')
" Requires neovim 0.5.0 with LSP support enabled
Plug 'neovim/nvim-lspconfig'                            " Already has config
Plug 'hrsh7th/nvim-compe'                               " Already has config
Plug 'glepnir/lspsaga.nvim'                             " Already has config
Plug 'ray-x/lsp_signature.nvim'                         " Already has config
Plug 'jackguo380/vim-lsp-cxx-highlight'

"Plug 'Yggdroot/indentLine'                              " Already has config
Plug 'itchyny/lightline.vim'                            " Already has config
Plug 'preservim/nerdtree'                               " Already has config
Plug 'Xuyuanp/nerdtree-git-plugin'                      " Already has config
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'          " Already has config
Plug 'ryanoasis/vim-devicons'                           " Already has config
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'                          " Already has config
Plug 'dhruvasagar/vim-table-mode'
Plug 'ghifarit53/tokyonight-vim'                        " Already has config
Plug 'ctrlpvim/ctrlp.vim'                               " Already has config
Plug 'sheerun/vim-polyglot'                             " No need to configure
Plug 'soywod/himalaya', {'rtp': 'vim'}                  " Already has config
Plug 'vimwiki/vimwiki'
call plug#end()

" Ident Line
let g:indentLine_enabled = 1

" LSP Config
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.cxx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.h lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.hpp lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.hxx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre CMakeLists.txt lua vim.lsp.buf.formatting_sync(nil, 100)
luafile ~/.config/nvim/lspconfig.lua

" Compe
luafile ~/.config/nvim/compe.lua

" LSP Saga
luafile ~/.config/nvim/saga.lua

" Lightline
set noshowmode
let g:lightline = { 'colorscheme': 'ayu_dark', }
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }

" Tokyo Night
set termguicolors
let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" NerdTree
set modifiable
nnoremap <C-K> :NERDTreeToggle<CR>

" NerdTree Syntax Highlighting
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

" NerdTree Git Plugin
let g:NERDTreeGitStatusUseNerdFonts = 1

" NerdCommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
nnoremap <C-o> :CtrlP ~/.config/<CR>

" Vim Wiki
hi VimwikiHeader1 guifg=#f7768e
hi VimwikiHeader2 guifg=#9ece6a
hi VimwikiHeader3 guifg=#7aa2f7
hi VimwikiHeader4 guifg=#bb9af7
hi VimwikiHeader5 guifg=#7dcfff
hi VimwikiHeader6 guifg=#e0af68
let g:vimwiki_listsyms = '✗○◐●✓'
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.automatic_nested_syntaxes = 1
let g:vimwiki_list = [wiki]

" Devicons
set encoding=utf-8

" Himalaya
set hidden

" Vim
set relativenumber 
set clipboard+=unnamedplus
set expandtab
set tabstop=2
set shiftwidth=0
set nosmarttab
set mouse=a
set re=0
"set listchars=eol:⏎,tab:-.,trail:·,extends:>,precedes:<
set list
set numberwidth=6
set colorcolumn=120

"highlight Normal guibg=none
"highlight NonText guibg=none
"highlight EndOfBuffer guibg=none
"highlight GitGutterAdd guibg=none 

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

nnoremap <silent> <Leader>< :exe "vertical resize " . (winheight(0) * 6/2)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winheight(0) * 2/3)<CR>

"hi StatusLine ctermbg=0 cterm=NONE

" autocmd BufWritePost sxhkdrc exec "!restart-sxhkd" || redraw
" autocmd FileType python nnoremap <F5> :!python3 <C-R>%<CR>

" autocmd BufWritePost config exec "!killall polybar; polybar example > /dev/null 2>&1 &" | redraw
