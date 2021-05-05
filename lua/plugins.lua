return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Startup
    use {'glepnir/dashboard-nvim'}

    -- Utilities
    -- Mapping
    use {'svermeulen/vimpeccable'}

    -- LSP
    use {'neovim/nvim-lspconfig'}
    use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}
    use {'glepnir/lspsaga.nvim', requires = {'neovim/nvim-lspconfig'}}

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'nvim-treesitter/nvim-treesitter-refactor'}

    -- Completion
    use {'nvim-lua/completion-nvim'}

    -- Snippets
    use {'norcalli/snippets.nvim'}

    -- File Browser
    use {'tamago324/lir.nvim', requires = {'kyazdani42/nvim-web-devicons', 'nvim-lua/plenary.nvim'}}
    use {'tamago324/lir-bookmark.nvim', requires = {'tamago324/lir.nvim'}}
    use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}

    use {'nvim-lua/telescope.nvim', requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'}}

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('gitsigns').setup()
        end
    }

    -- Autopairs
    use {'windwp/nvim-autopairs'}

    -- Theme
    use 'folke/tokyonight.nvim'
    vim.cmd([[colorscheme tokyonight]])
    -- use {
    --     'glepnir/galaxyline.nvim',
    --     branch = 'main',
    --     -- your statusline
    --     config = function()
    --         require '_galaxyline'
    --     end,
    --     -- some optional icons
    --     requires = {'kyazdani42/nvim-web-devicons', opt = true}
    -- }

    use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}

    use {"folke/which-key.nvim"}

    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}

    -- Global remapping
    ------------------------------
    require('telescope').setup {defaults = {}}

    function _G.dump(...)
        local objects = vim.tbl_map(vim.inspect, {...})
        print(unpack(objects))
    end

end)

