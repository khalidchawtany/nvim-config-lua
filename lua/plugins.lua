return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Startup
    use {
        'glepnir/dashboard-nvim',
        config = function()
            vim.cmd [[ let g:dashboard_default_executive ='telescope'  ]]
        end
    }

    use {'kopischke/vim-stay'}

    -- Tutorials and Easymotion
    use {'tjdevries/train.nvim'}
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup {keys = 'etovxqpdygfblzhckisuran'}
            -- vim.api.nvim_set_keymap('n', '$', "<cmd>lua require'hop'.hint_words()<cr>", {})
            vim.cmd [[
            nnoremap sw <cmd>HopWord<cr>

            nnoremap s/ <cmd>HopPattern<cr>
            nnoremap ss <cmd>HopChar1<cr>
            nnoremap sf <cmd>HopChar2<cr>

            nnoremap sj <cmd>HopLine<cr>
            ]]
        end
    }

    -- Utilities
    -- Mapping
    use {'svermeulen/vimpeccable'}

    -- LSP
    use {'neovim/nvim-lspconfig'}
    use {'kabouzeid/nvim-lspinstall'}
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

    -- Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    vim.cmd [[
        vmap <Enter> <Plug>(EasyAlign)

        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        vnoremap g<Enter> :EasyAlign */[(,)]\\+/<left><left><left><left>

        nmap g<cr> <Plug>(EasyAlign)
      ]]

    use {
        'junegunn/vim-easy-align',
        cmd = {'EasyAlign'},
        keys = {'<Plug>(EasyAlign)'},
        config = function()
            vim.g.easy_align_ignore_comment = 0 -- align comments
        end
    }

    use {'machakann/vim-sandwich'}

    -- File Browser
    use {'tamago324/lir.nvim', requires = {'kyazdani42/nvim-web-devicons', 'nvim-lua/plenary.nvim'}}
    use {'tamago324/lir-bookmark.nvim', requires = {'tamago324/lir.nvim'}}
    use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}

    use {'nvim-lua/telescope.nvim', requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim', 'nvim-telescope/telescope-fzy-native.nvim'}}
    use {'nvim-telescope/telescope-project.nvim', requires = {'nvim-lua/telescope.nvim'}}

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('gitsigns').setup()
        end
    }

    use {'tpope/vim-fugitive'}

    use {'tpope/vim-unimpaired'}

    use {
        'tpope/vim-abolish',
        cmd = {'S', 'Subvert', 'Abolish'},
        keys = {'<Plug>(abolish_coerce_word)', '<Plug>(abolish-coerce)', 'crs', 'crm', 'crc', 'cru', 'cr-', 'cr.', 'cr<space>'}
    }

    -- Comments
    use {
        'terrortylor/nvim-comment',
        config = function()
            require('nvim_comment').setup({
                -- Linters prefer comment and line to have a space in between markers
                marker_padding = true,
                -- should comment out empty or whitespace only lines
                comment_empty = true,
                -- Should key mappings be created
                create_mappings = true,
                -- Normal mode mapping left hand side
                line_mapping = "gcc",
                -- Visual/Operator mapping left hand side
                operator_mapping = "gc"
            })
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

    use {'drewtempelmeyer/palenight.vim'}

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

    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()

            vim.cmd [[
        nnoremap <silent>    <M-,> :BufferPrevious<CR>
        nnoremap <silent>    <M-.> :BufferNext<CR>

        nnoremap <silent>    <M-<> :BufferMovePrevious<CR>
        nnoremap <silent>    <M->> :BufferMoveNext<CR>

        nnoremap <silent>    <M-1> :BufferGoto 1<CR>
        nnoremap <silent>    <M-2> :BufferGoto 2<CR>
        nnoremap <silent>    <M-3> :BufferGoto 3<CR>
        nnoremap <silent>    <M-4> :BufferGoto 4<CR>
        nnoremap <silent>    <M-5> :BufferGoto 5<CR>
        nnoremap <silent>    <M-6> :BufferGoto 6<CR>
        nnoremap <silent>    <M-7> :BufferGoto 7<CR>
        nnoremap <silent>    <M-8> :BufferGoto 8<CR>
        nnoremap <silent>    <M-9> :BufferLast<CR>

        nnoremap <silent>    <M-c> :BufferClose<CR>

        " Wipeout buffer
        "                          :BufferWipeout<CR>
        " Close commands
        "                          :BufferCloseAllButCurrent<CR>
        "                          :BufferCloseBuffersLeft<CR>
        "                          :BufferCloseBuffersRight<CR>

        " Magic buffer-picking mode
        nnoremap <silent> <C-s>    :BufferPick<CR>

        " Sort automatically by...
        nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
        nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>

        " Other:
        " :BarbarEnable - enables barbar (enabled by default)
        " :BarbarDisable - very bad command, should never be used
        ]]
        end
    }

    use {"folke/which-key.nvim"}

    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    use {
        'p00f/nvim-ts-rainbow',
        config = function()
            require'nvim-treesitter.configs'.setup {
                rainbow = {
                    enable = true,
                    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
                    max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
                }
            }
        end
    }

    use {
        'kdav5758/TrueZen.nvim',
        config = function()
            local true_zen = require("true-zen")

            -- setup for TrueZen.nvim
            true_zen.setup({
                true_false_commands = false,
                cursor_by_mode = false,
                bottom = {
                    hidden_laststatus = 0,
                    hidden_ruler = false,
                    hidden_showmode = false,
                    hidden_showcmd = false,
                    hidden_cmdheight = 1,

                    shown_laststatus = 2,
                    shown_ruler = true,
                    shown_showmode = false,
                    shown_showcmd = false,
                    shown_cmdheight = 1
                },
                top = {hidden_showtabline = 0, shown_showtabline = 2},
                left = {
                    hidden_number = false,
                    hidden_relativenumber = false,
                    hidden_signcolumn = "no",

                    shown_number = true,
                    shown_relativenumber = false,
                    shown_signcolumn = "no"
                },
                ataraxis = {
                    ideal_writing_area_width = 0,
                    just_do_it_for_me = false,
                    left_padding = 40,
                    right_padding = 40,
                    top_padding = 0,
                    bottom_padding = 0,
                    custome_bg = "",
                    disable_bg_configuration = false,
                    disable_fillchars_configuration = false,
                    force_when_plus_one_window = false,
                    force_hide_statusline = true,

                    hidden_number = false,
                    hidden_relativenumber = false,
                    hidden_signcolumn = "no",

                    shown_number = true,
                    shown_relativenumber = false,
                    shown_signcolumn = "yes"
                },
                focus = {margin_of_error = 5, focus_method = "experimental"},
                events = {
                    before_minimalist_mode_shown = false,
                    before_minimalist_mode_hidden = false,
                    after_minimalist_mode_shown = false,
                    after_minimalist_mode_hidden = false
                },
                integrations = {
                    integration_galaxyline = false,
                    integration_vim_airline = false,
                    integration_vim_powerline = false,
                    integration_tmux = false,
                    integration_express_line = false,
                    integration_gitgutter = false,
                    integration_vim_signify = false,
                    integration_limelight = false,
                    integration_tzfocus_tzataraxis = false,
                    integration_gitsigns = false
                }
            })
        end
    }

    -- Global remapping
    ------------------------------
    require('telescope').setup {defaults = {}}

    function _G.dump(...)
        local objects = vim.tbl_map(vim.inspect, {...})
        print(unpack(objects))
    end

end)

--  use {
--   'myusername/example',        -- The plugin location string
--   -- The following keys are all optional
--   disable = boolean,           -- Mark a plugin as inactive
--   as = string,                 -- Specifies an alias under which to install the plugin
--   installer = function,        -- Specifies custom installer. See "custom installers" below.
--   updater = function,          -- Specifies custom updater. See "custom installers" below.
--   after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
--   rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
--   opt = boolean,               -- Manually marks a plugin as optional.
--   branch = string,             -- Specifies a git branch to use
--   tag = string,                -- Specifies a git tag to use
--   commit = string,             -- Specifies a git commit to use
--   lock = boolean,              -- Skip this plugin in updates/syncs
--   run = string or function,    -- Post-update/install hook. See "update/install hooks".
--   requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
--   rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
--   config = string or function, -- Specifies code to run after this plugin is loaded.
--   -- The setup key implies opt = true
--   setup = string or function,  -- Specifies code to run before this plugin is loaded.
--   -- The following keys all imply lazy-loading and imply opt = true
--   cmd = string or list,        -- Specifies commands which load this plugin.
--   ft = string or list,         -- Specifies filetypes which load this plugin.
--   keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
--   event = string or list,      -- Specifies autocommand events which load this plugin.
--   fn = string or list          -- Specifies functions which load this plugin.
--   cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
--   module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
--                                -- with one of these module names, the plugin will be loaded.
-- }
