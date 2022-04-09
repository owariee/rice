call plug#begin()
Plug 'https://github.com/morhetz/gruvbox'
call plug#end()

colorscheme gruvbox
set number          " enable line count
set expandtab       " enable space instead of tab
set shiftwidth=2    " tab size when using shift-left or shift-right (or start of a line when smart tab is on)
set tabstop=2       " tab size when in any other part of the line
set softtabstop=0   " custom stops where tab/bs will stop until the full tab being inserted
set smarttab        " when off uses shiftwidth only in the shift-left shift-right
set autoindent      " copy current line indent to the new line

