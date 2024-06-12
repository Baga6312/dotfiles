local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use "wbthomason/packer.nvim" 
  use "nvim-lua/popup.nvim" 
  use "nvim-lua/plenary.nvim" 
  use {'iamcco/markdown-preview.nvim', run = 'cd app && npm i ', cmd = 'MarkdownPreview'}
  use "thedenisnikulin/vim-cyberpunk" 

  -- completion plugins 
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip" 

  use {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
    }
  end,
  requires = {'nvim-tree/nvim-web-devicons'}
} ; 




  --focus 

  use "nvim-focus/focus.nvim"


  --nvimtree 
  use "nvim-tree/nvim-tree.lua" ; 
  use 'kyazdani42/nvim-web-devicons' ; 

  -- autopairs 
  use "windwp/nvim-autopairs" ; 


  use {'ojroques/nvim-hardline'} ; 

  -- LSP 
  use { "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim" , 
        "williamboman/mason.nvim" ,
  } ; 

  -- bufferline 
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'} ; 
 




  -- telescope 
  use "nvim-telescope/telescope.nvim" ; 

  -- treesitter 
    use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }; 

  -- toggle term 
  use "akinsho/toggleterm.nvim" ; 


  use "L3MON4D3/LuaSnip" ; -- snippet engine
  use "rafamadriz/friendly-snippets" ; 
  if(PACKER_BOOTSTRAP)
  then
    require("packer").sync()
  end

end)
