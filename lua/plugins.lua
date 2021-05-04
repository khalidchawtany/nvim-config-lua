return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Utilities
  -- Mapping
  use { 'svermeulen/vimpeccable' }

  -- LSP
  use {'neovim/nvim-lspconfig'}

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-refactor' }


  -- Completion
  use { 'nvim-lua/completion-nvim' }


  -- File Browser
  use { 'tamago324/lir.nvim', requires = {'kyazdani42/nvim-web-devicons', 'nvim-lua/plenary.nvim'} }
  use { 'tamago324/lir-bookmark.nvim', requires = {'tamago324/lir.nvim'} }

  use { 'nvim-lua/telescope.nvim', requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' } }

  -- Git
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }


  -- Autopairs
  use { 'windwp/nvim-autopairs' }


  -- Theme
  use {
    'glepnir/galaxyline.nvim',
      branch = 'main',
      -- your statusline
      config = function() require'_galaxyline' end,
      -- some optional icons
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

end)
