call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'ghifarit53/tokyonight-vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'lervag/vimtex'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'
Plug 'soywod/himalaya', {'rtp': 'vim'}

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'

" Plug 'hrsh7th/nvim-compe'                               " Already has config
" Plug 'glepnir/lspsaga.nvim'                             " Already has config
" Plug 'ray-x/lsp_signature.nvim'                         " Already has config
" Plug 'Xuyuanp/nerdtree-git-plugin'                           Bug where folder names in nerd tree gets spaced
" Plug 'jackguo380/vim-lsp-cxx-highlight'
" Plug 'ctrlpvim/ctrlp.vim'                               " Already has config
" Plug 'Yggdroot/indentLine'                              " Already has config
" Plug 'sheerun/vim-polyglot'                             " No need to configure
call plug#end()

" Himalaya
let g:himalaya_mailbox_picker = 'telescope'
let g:himalaya_telescope_preview_enabled = 1

" Vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk_engines = {'_' : '-xelatex',}
let g:vimtex_mappings_enabled = 0

" Vim Wiki
let g:vimwiki_listsyms = '✗○◐●✓'
let wiki = {}
let wiki.path = '/mnt/backup/vimwiki'
let wiki.automatic_nested_syntaxes = 1
let g:vimwiki_list = [wiki]
let g:vimwiki_table_mappings=0
let g:vimwiki_table_auto_fmt=0

" NerdTree Syntax Highlighting
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

" NerdTree Git Plugin
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusConcealBrackets = 1

" NerdCommenter
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" Lightline
let g:lightline = { 'colorscheme': 'ayu_dark', }
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }

" Ident Line
let g:indentLine_enabled = 1

" LSP Config
" luafile ~/.config/nvim/lspconfig.lua

" Compe
" luafile ~/.config/nvim/compe.lua

" LSP Saga
" luafile ~/.config/nvim/saga.lua
" luafile ~/.config/nvim/lsp/init.lua
luafile ~/.config/nvim/plugins.lua

" Tokyo Night
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

" My vim settings
let mapleader = ","        " set leader key to comma

filetype plugin indent on  " enable filetype detection, plugin load for different filetypes and indentation
syntax enable              " enable syntax highlighting

set number                 " enable line count
set expandtab              " enable space instead of tab
set shiftwidth=2           " tab size when using shift-left/right (or start of a line when smart tab is on)
set tabstop=2              " tab size when in any other part of the line
set softtabstop=0          " custom stops where tab/bs will stop until the full tab being inserted
set smarttab               " when off uses shiftwidth only in the shift-left shift-right
set autoindent             " copy current line indent to the new line
set mouse=a                " enable mouse in all vim modes(normal, insert, visual, etc...)
set clipboard+=unnamedplus " force vim to interact with system's clipboard instead of using it's own
set colorcolumn=100        " enable ruler
set signcolumn=yes         " always show sign column, so git gutter dont glitch
set termguicolors          " enable 24-bit color in terminal user interface
set encoding=utf-8         " set encoding to always utf-8
set hidden                 " buffer is not unloaded when it is abandoned
set noshowmode             " not put a message on last line in inser/replace/visual modes
set modifiable             " enable buffer modifications
set autoindent             " enable auto indent
set smartindent            " enable smart indent
set nohlsearch             " disable search highlighting
set nolist                 " disable character list
set numberwidth=4          " change line number width
set textwidth=100          " change text width to match the colorcolumn
" set re=0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                " ignore these files when expanding wildcards
set listchars=eol:⏎,tab:-.,trail:·,extends:>,precedes:< " set default characters for list

autocmd FileType tex nnoremap <F5> <cmd>VimtexCompile<CR>
autocmd FileType python nnoremap <F5> <cmd>!python3 <C-R>%<CR>
" autocmd BufWritePost init.vim source ~/.config/nvim/init.vim
" autocmd BufWritePost sxhkdrc exec "!restart-sxhkd" || redraw
" autocmd BufWritePost config exec "!killall polybar; polybar example > /dev/null 2>&1 &" | redraw
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

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" vnoremap <Leader>/ :call Comment('--')<CR>
" nnoremap <Leader>/ :call Comment('--')<CR>
" nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" nnoremap <silent> <Leader>< :exe "vertical resize " . (winheight(0) * 6/2)<CR>
" nnoremap <silent> <Leader>> :exe "vertical resize " . (winheight(0) * 2/3)<CR>
" nnoremap <C-o> :CtrlP ~/.config/<CR>
nnoremap <Leader>r <cmd>source ~/.config/nvim/init.vim<CR>
nnoremap <Leader>f <cmd>Telescope find_files<cr>
nnoremap <Leader>n <cmd>NERDTreeToggle<CR>
nnoremap <Leader>m <cmd>Himalaya<CR>
vnoremap <silent> <C-_> :call nerdcommenter#Comment('x', 'Toggle')<CR>
nnoremap <silent> <C-_> :call nerdcommenter#Comment('n', 'Toggle')<CR>

" 
" function Comment(char)
"   exec 's/^/'.a:char.' /e'
"   exec 's/^'.a:char.' '.a:char.' //e'
"   exec 's/^'.a:char.' $//e'
"   nohl
" endfunction

colorscheme tokyonight " or gruvbox

highlight Normal guibg=none
highlight NonText guibg=none
highlight EndOfBuffer guibg=none
highlight SignColumn guibg=none
highlight GitGutterAdd guibg=none
highlight GitGutterChange guibg=none
highlight GitGutterDelete guibg=none
highlight GitGutterChangeDelete guibg=none
highlight VimwikiHeader1 guifg=#f7768e
highlight VimwikiHeader2 guifg=#9ece6a
highlight VimwikiHeader3 guifg=#7aa2f7
highlight VimwikiHeader4 guifg=#bb9af7
highlight VimwikiHeader5 guifg=#7dcfff
highlight VimwikiHeader6 guifg=#e0af68
"highlight StatusLine ctermbg=0 cterm=NONE
