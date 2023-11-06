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
  use{
    "kyazdani42/nvim-tree.lua",
    requires = {"kyazdani42/nvim-web-devicons"}
  }
  -- movement --
  use "ggandor/leap.nvim"
  -- upspeed start time --
  -- use 'nathom/filetype.nvim'
  -- theme
  use 'navarasu/onedark.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)