-- bootstrap packer 
local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  packer_bootstrap = vim.fn.system {
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- reload after save
vim.cmd [[autocmd! BufWritePost plugins.lua source <afile> | PackerSync]]

-- load packer
local packer = require("packer")
local packer_util = require("packer.util")

packer.init({
  display = {
    open_fn = function()
      return packer_util.float({ border = 'rounded' })
    end
  },
})

-- setup plugins
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"

  use "lervag/vimtex"
  use "vimwiki/vimwiki"
  use "dhruvasagar/vim-table-mode"
  -- use {"soywod/himalaya", rtp = 'vim' }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use "kana/vim-fakeclip"

  -- Colorschemes
  use "folke/tokyonight.nvim"
  use "lunarvim/darkplus.nvim"
  use "morhetz/gruvbox"
  use "ghifarit53/tokyonight-vim"
  use 'shaunsingh/moonlight.nvim'
  use { "chrsm/paramount-ng.nvim", requires = { "rktjmp/lush.nvim" } }
  use { 'bkegley/gloombuddy', requires = { 'tjdevries/colorbuddy.vim' } }
  use 'tiagovla/tokyodark.nvim'
  use 'frenzyexists/aquarium-vim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'projekt0n/github-nvim-theme'
  use 'yashguptaz/calvera-dark.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'shaunsingh/nord.nvim'
  use 'yonlu/omni.vim'
  use 'marko-cerovac/material.nvim'
  use "rafamadriz/neon"
  use 'navarasu/onedark.nvim'
  use 'glepnir/zephyr-nvim'
  use 'olimorris/onedarkpro.nvim'
  use 'NTBBloodbath/doom-one.nvim'

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "RRethy/vim-illuminate"

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use "nvim-treesitter/nvim-treesitter"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- DAP
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "ravenxrz/DAPInstall.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    packer.sync()
  end
end)
