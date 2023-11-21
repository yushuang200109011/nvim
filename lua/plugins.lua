local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- hightlight
  use {
    'nvim-treesitter/nvim-treesitter',
     run = function()
       local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
       ts_update()
     end,
  }
  -- line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  -- file tree --
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {"kyazdani42/nvim-web-devicons"}
  }
  -- bufferline --
  use {'akinsho/bufferline.nvim', tag = "v4.*", requires = 'nvim-tree/nvim-web-devicons'}
  -- movement --
  use "ggandor/leap.nvim"
  -- surround --
  use{
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  }
  -- tabs --
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- terminal --
  use {"akinsho/toggleterm.nvim", tag = '*'}
  -- marks visualization --
  use 'chentoast/marks.nvim'
  -- nvim-cmp
  use 'neovim/nvim-lspconfig'
  -- use { 'hrsh7th/nvim-cmp', config = [[require('nvim-cmp_config')]] }
  use 'hrsh7th/nvim-cmp'
  use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' } -- buffer auto-completion
  use { 'hrsh7th/cmp-path', after = 'nvim-cmp' } -- path auto-completion
  use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' } -- cmdline auto-completion
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- lsp --
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- theme --
  use 'navarasu/onedark.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
