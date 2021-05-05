return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Startup
    use {
        'glepnir/dashboard-nvim',
        config = function()
            vim.cmd([[ let g:dashboard_default_executive ='telescope'  ]])
        end
    }

    -- Tutorials and Easymotion
    use {'tjdevries/train.nvim'}
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup {keys = 'etovxqpdygfblzhckisuran'}
            -- vim.api.nvim_set_keymap('n', '$', "<cmd>lua require'hop'.hint_words()<cr>", {})
        end
    }

    -- Utilities
    -- Mapping
    use {'svermeulen/vimpeccable'}

    -- LSP
    use {'neovim/nvim-lspconfig'}
    use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}
    use {'glepnir/lspsaga.nvim', requires = {'neovim/nvim-lspconfig'}}

    use {
        'simrat39/symbols-outline.nvim',
        config = function()
            require('_symbols-outline')
        end
    }

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
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = "storm"
            vim.g.tokyonight_italic_functions = true
            vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}
            vim.g.tokyonight_hide_inactive_statusline = true
            ---vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}

            vim.cmd([[colorscheme tokyonight]])
        end
    }

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

    use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons'}}

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

