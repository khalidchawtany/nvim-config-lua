-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

 -- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
--vim._update_package_paths()


return require('packer').startup(function()
  -- Packer can manage itself


  use 'wbthomason/packer.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    config = function() require'_galaxyline' end,
    -- some optional icons
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
}


  use {
    'tamago324/lir.nvim',
    requires = {'kyazdani42/nvim-web-devicons', 'nvim-lua/plenary.nvim'}
  }

  use {
    'tamago324/lir-bookmark.nvim',
    requires = {'tamago324/lir.nvim'}
  }


  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }
  use { 'windwp/nvim-autopairs' }

end)
