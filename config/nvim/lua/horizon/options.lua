vim.opt.number = true             -- enable line count
vim.opt.expandtab = true          -- enable space instead of tab
vim.opt.shiftwidth = 2            -- tab size when using shift-left/right (or start of a line when smart tab is on)
vim.opt.tabstop = 2               -- tab size when in any other part of the line
vim.opt.softtabstop = 0           -- custom stops where tab/bs will stop until the full tab being inserted
vim.opt.smarttab = true           -- when off uses shiftwidth only in the shift-left shift-right
vim.opt.autoindent = true         -- copy current line indent to the new line
vim.opt.mouse = "a"               -- enable mouse in all vim modes(normal, insert, visual, etc...)
vim.opt.clipboard = "unnamedplus" -- force vim to interact with system's clipboard instead of using it's own
vim.opt.colorcolumn = "100"       -- enable ruler
vim.opt.signcolumn = "yes"        -- always show sign column, so git gutter dont glitch
vim.opt.termguicolors = true      -- enable 24-bit color in terminal user interface
vim.opt.encoding = "utf-8"        -- set encoding to always utf-8
vim.opt.hidden = true             -- buffer is not unloaded when it is abandoned
vim.opt.showmode = false          -- not put a message on last line in inser/replace/visual modes
vim.opt.modifiable = true         -- enable buffer modifications
vim.opt.autoindent = true         -- enable auto indent
vim.opt.smartindent = true        -- enable smart indent
vim.opt.hlsearch = false         -- disable search highlighting
vim.opt.list = false             -- disable character list
vim.opt.numberwidth = 4           -- change line number width
vim.opt.textwidth = 100           -- change text width to match the colorcolumn
vim.opt.splitbelow = true         -- force all horizontal splits to go below current window
vim.opt.splitright = true         -- force all vertical splits to go to the right of current window
vim.opt.backup = false            -- creates a backup file
vim.opt.swapfile = false          -- creates a swapfile
vim.opt.updatetime = 300          -- faster completion (4000ms default)
vim.opt.cursorline = true         -- highlight the current line
vim.opt.undofile = true           -- enable persistent undo
vim.opt.ignorecase = true         -- ignore case in search patterns
vim.opt.wrap = false              -- display lines as one long line
vim.opt.timeoutlen = 1000         -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.cmdheight = 1             -- more space in the neovim command line for displaying messages
vim.opt.pumheight = 10            -- pop up menu height
vim.opt.writebackup = false       -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.showtabline = 2           -- always show tabs
vim.opt.showmode = false          -- we don't need to see things like -- INSERT -- anymore
vim.opt.scrolloff = 8             -- is one of my fav
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.conceallevel = 0          -- so that `` is visible in markdown files
vim.opt.showcmd = false           -- disable command in the last line, in visual this means disable the size of selected area

--vim.opt.re = 0                    -- 
vim.opt.wildignore = "*/tmp/*,*.so,*.swp,*.zip" -- ignore these files when expanding wildcards
vim.opt.listchars = "eol:⏎,tab:-.,trail:·,extends:>,precedes:<" -- set default characters for list

vim.cmd [[
filetype plugin indent on  " enable filetype detection, plugin load for different filetypes and indentation
syntax enable              " enable syntax highlighting
]]

vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.smartcase = true                        -- smart case
vim.opt.laststatus = 3
vim.opt.ruler = false
vim.opt.sidescrolloff = 8
vim.opt.fillchars.eob=" "
vim.opt.shortmess:append "c"
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
