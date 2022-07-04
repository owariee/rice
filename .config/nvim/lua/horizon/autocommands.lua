local opts = { silent = true }

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
})

-- Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd [[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
  end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- Vimtex Compile F5
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "tex" },
  callback = function()
    vim.keymap.set("n", "<F5>", "<cmd>VimtexCompile<cr>", opts)
  end
})

-- Python Run F5
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "python" },
  callback = function()
    vim.keymap.set("n", "<F5>", "<cmd>!python3 <C-R>%<cr>", opts)
  end
})

-- Reload init.vim after save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "init.lua" },
  callback = function()
    vim.cmd "source ~/.config/nvim/init.vim"
  end
})

-- Reload sxhkdrc
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "sxhkdrc" },
  callback = function()
    vim.cmd "!restart-sxhkd<CR>"
  end
})

-- Reload polybar
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "config" },
  callback = function()
    vim.cmd "exec \"!killall polybar; polybar example > /dev/null 2>&1 &\" | redraw"
  end
})

