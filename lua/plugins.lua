package.path = package.path .. ';/Users/juju/.config/nvim/lua'
local fun = require('functions')

return require('packer').startup(function(use)
    -- setup use() to replace packer_use()
    fun.setPackerUse(use)
    use = fun.use

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {'glepnir/dashboard-nvim'}

    -- { Tutorials and Easymotion
    use 'tjdevries/train.nvim'
    use 'ggandor/lightspeed.nvim'
    use 'phaazon/hop.nvim'
    use {'Lokaltog/vim-easymotion'}
    use {'aykamko/vim-easymotion-segments', requires = {'Lokaltog/vim-easymotion'}}
    use {'rhysd/clever-f.vim', keys = {'<Plug>(clever-f-'}, fn = {'clever_f#reset'}}
    -- }

    use {"steelsojka/headwind.nvim"}

    -- HTTP
    use {'NTBBloodbath/rest.nvim', requires = {'nvim-lua/plenary.nvim'}, keys = {'<Plug>RestNvim'}}

    -- Utilities
    use 'kevinhwang91/nvim-hlslens'
    use 'kopischke/vim-stay'
    use 'gioele/vim-autoswap'
    use 'lyokha/vim-xkbswitch'
    use {'tyru/capture.vim', cmd = {'Capture'}}
    use {
        'tpope/vim-sleuth',
        config = function()
            vim.g.sleuth_automatic = 1
        end
    }

    -- mappings and submodes
    use 'svermeulen/vimpeccable'
    use 'khalidchawtany/vim-submode'

    -- debuggers
    use 'mfussenegger/nvim-dap'
    use 'nvim-telescope/telescope-dap.nvim'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'rcarriga/nvim-dap-ui'

    use 'kevinhwang91/nvim-bqf'
    use 'winston0410/mark-radar.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use {'ray-x/navigator.lua'}
    use {'glepnir/lspsaga.nvim', requires = {'neovim/nvim-lspconfig'}}

    use 'simrat39/symbols-outline.nvim'
    use 'rmagatti/goto-preview'

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- Completion
    use 'hrsh7th/nvim-compe'

    -- Clipboard
    use 'bfredl/nvim-miniyank'
    use 'vim-scripts/UnconditionalPaste'

    -- Snippets
    use 'norcalli/snippets.nvim'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'

    use 'drmingdrmer/xptemplate'
    use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    -- au filetype php set iskeyword+=$

    use 'mizlan/iswap.nvim'
    use 'junegunn/vim-easy-align'

    -- File Browser  And Navigation
    use 'tamago324/lir.nvim'
    use {'tamago324/lir-bookmark.nvim', requires = {'tamago324/lir.nvim'}}

    use 'kyazdani42/nvim-tree.lua'

    use 'mcchrish/nnn.vim'

    -- use 'camspiers/snap'
    use {'camspiers/snap', rocks = {'fzy'}}

    use 'nvim-lua/telescope.nvim'
    use {'nvim-telescope/telescope-project.nvim', requires = {'nvim-lua/telescope.nvim'}}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    -- use {'junegunn/fzf', dir = '~/.fzf', run = '/Users/juju/.local/share/nvim/site/pack/packer/start/fzf/install --all'}
    use 'junegunn/fzf'
    use {
        'junegunn/fzf.vim',
        config = function()
            vim.cmd [[source ~/.config/nvim/lua/_fzf.vim]]
        end
    }
    use 'pbogut/fzf-mru.vim'

    use 'el-iot/buffer-tree-explorer'

    use {'justinmk/vim-gtfo', keys = {'gof', 'got', 'goF', 'goT'}}
    vim.cmd [[
        let g:gtfo#terminals = { 'mac' : 'iterm' }
        nnoremap <silent> gof :<c-u>call gtfo#open#file("%:p")<cr>
        nnoremap <silent> got :<c-u>call gtfo#open#term("%:p:h", "")<cr>
        nnoremap <silent> goF :<c-u>call gtfo#open#file(getcwd())<cr>
        nnoremap <silent> goT :<c-u>call gtfo#open#term(getcwd(), "")<cr>
    ]]

    -- augroup BufferTreeAuGroup
    -- au!
    -- au BufWinEnter BufferTree :silent unmap <buffer> j<cr>
    -- au BufWinEnter BufferTree :silent unmap <buffer> k<cr>
    -- augroup END

    -- Git
    use 'lewis6991/gitsigns.nvim'

    use 'tpope/vim-fugitive'

    use 'junegunn/gv.vim'

    use 'gregsexton/gitv'

    use 'tpope/vim-unimpaired'

    use 'tpope/vim-abolish'

    use 'machakann/vim-sandwich'

    -- InlineEdit
    use {'AndrewRadev/inline_edit.vim', cmd = {'InlineEdit'}}
    vim.cmd [[xnoremap <leader>ei <cmd>InlineEdit<cr>]]

    -- multiple cursor
    use {
        'mg979/vim-visual-multi',
        branch = 'master',
        config = function()
            -- vim.g.multi_cursor_use_default_mapping = 0
            -- vim.g.multi_cursor_next_key = '<C-n>'
            -- vim.g.multi_cursor_prev_key = '<C-p>'
            -- vim.g.multi_cursor_skip_key = '<C-x>'
            -- vim.g.multi_cursor_quit_key = '<Esc>'
        end
    }

    use {'gabesoft/vim-ags', cmd = {'Ags'}}

    -- Comments
    use 'terrortylor/nvim-comment'

    -- Autopairs
    use 'windwp/nvim-autopairs'

    -- Theme
    use {
        'folke/tokyonight.nvim',
        init = function()
            vim.g.tokyonight_style = "knight" -- storm, knight, day
            vim.g.tokyonight_italic_functions = true
            vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}
            vim.g.tokyonight_hide_inactive_statusline = false
            ---vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}
        end,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end
    }

    use {
        'navarasu/onedark.nvim',
        config = function()
            vim.g.onedark_style = 'cool' -- deep, cool, warm, Default, dark, darker
            -- vim.cmd [[colorscheme onedark]]

        end
    }

    use 'drewtempelmeyer/palenight.vim'

    use 'hoob3rt/lualine.nvim'

    use 'crispgm/nvim-tabline'

    use {
        'romgrk/barbar.nvim',
        disable = true,
        opt = true,
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

    use "folke/which-key.nvim"

    use 'lukas-reineke/indent-blankline.nvim'

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
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
            vim.cmd [[
                command! ZenModeToggle :lua require("zen-mode").toggle({ window = { width = .70 }})<cr>
                nnoremap <leader>zn <cmd>ZenModeToggle<cr>
            ]]
        end
    }

    use {
        'kdav5758/TrueZen.nvim',
        config = function()
            local true_zen = require("true-zen")

            vim.cmd [[nnoremap <leader>zz <cmd>TZAtaraxis<cr>]]

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
                    left_padding = 30,
                    right_padding = 0,
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
