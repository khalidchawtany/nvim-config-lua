return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- { Dashboard
    use {
        'glepnir/dashboard-nvim',
        setup = function()
            vim.cmd [[ let g:dashboard_default_executive ='telescope'  ]]
            -- vim.g.dashboard_custom_section = {
            --     buffer_list = {
            --         description = {'? Recently lase session                 SPC b b'},
            --         command = 'Some Command or function(your funciton name)'
            --     }}
            vim.g.dashboard_custom_shortcut = {
                last_session = 'SPC s l',
                find_history = 'SPC f h',
                find_file = 'SPC f f',
                new_file = 'SPC c n',
                change_colorscheme = 'SPC t c',
                find_word = 'SPC f a',
                book_marks = 'SPC f b'
            }
        end
    }
    -- }

    -- { Tutorials and Easymotion
    use {'tjdevries/train.nvim'}

    -- { Hop
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup {keys = 'etovxqpdygfblzhckisuran'}
            -- vim.api.nvim_set_keymap('n', '$', "<cmd>lua require'hop'.hint_words()<cr>", {})
            vim.cmd [[
            nnoremap <leader>sw <cmd>HopWord<cr>

            nnoremap <leader>s<leader> <cmd>HopPattern<cr>
            nnoremap <leader>ss <cmd>HopChar1<cr>
            nnoremap <leader>sf <cmd>HopChar2<cr>

            nnoremap <leader>sj <cmd>HopLine<cr>
            ]]
        end
    }
    -- }

    use {
        'Lokaltog/vim-easymotion',
        keys = {'<Plug>(easymotion-', 's'},
        config = function()
            require('_easymotion')
        end
    }
    use {'aykamko/vim-easymotion-segments', {keys = {'<Plug>(easymotion-'}}}

    use {'rhysd/clever-f.vim', keys = {'<Plug>(clever-f-'}, fn = {'clever_f#reset'}}
    -- }

    -- HTTP
    use {
        'NTBBloodbath/rest.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        keys = {'<Plug>RestNvim'},
        config = function()
            vim.cmd [[nmap <leader>ht <Plug>RestNvim]]
        end
    }

    -- Utilities

    use {'tyru/capture.vim', {cmd = {'Capture'}}}

    use {'svermeulen/vimpeccable'}

    use {
        'khalidchawtany/vim-submode',
        config = function()
            require('_submode')
        end
    }
    use "kevinhwang91/nvim-bqf"

    use {'kopischke/vim-stay'}

    use {
        'tpope/vim-sleuth',
        setup = function()
            vim.g.sleuth_automatic = 1
        end
    }

    use {'gioele/vim-autoswap'}

    use {
        'lyokha/vim-xkbswitch',
        config = function()
            if vim.fn.has('mac') then
                -- using https://github.com/vovkasm/input-source-switcher
                vim.g.XkbSwitchLib = '/Users/juju/Development/Applications/input-source-switcher/build/libInputSourceSwitcher.dylib'
            elseif vim.fn.has('win') then
                vim.g.XkbSwitchLib = 'C:\\Development\\libxkbswitch64.dll'
                vim.g.XkbSwitchIMappingsTrData = 'C:\\Development\\charmap.txt'
            end
            vim.g.XkbSwitchEnabled = 1
        end
    }

    -- LSP
    use {'neovim/nvim-lspconfig'}
    use {'kabouzeid/nvim-lspinstall'}
    use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}
    use {'glepnir/lspsaga.nvim', requires = {'neovim/nvim-lspconfig'}}

    use {
        'simrat39/symbols-outline.nvim',
        cmd = {'SymbolsOutline', 'SymbolsOutlineOpen'},
        config = function()
            require('_symbols-outline')
        end
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('_treesitter')
        end
    }
    use {'nvim-treesitter/nvim-treesitter-refactor'}
    use {'nvim-treesitter/nvim-treesitter-textobjects'}

    -- { Completion
    use {'nvim-lua/completion-nvim', disable = true}

    use {
        'hrsh7th/nvim-compe',
        config = function()
            require'compe'.setup {
                enabled = true,
                autocomplete = true,
                debug = false,
                min_length = 1,
                preselect = 'enable',
                throttle_time = 80,
                source_timeout = 200,
                incomplete_delay = 400,
                max_abbr_width = 100,
                max_kind_width = 100,
                max_menu_width = 100,
                documentation = true,

                source = {path = true, buffer = true, calc = true, nvim_lsp = true, nvim_lua = true, vsnip = false, ultisnips = true}
            }
            vim.cmd [[ highlight link CompeDocumentation NormalFloat ]]

        end
    }
    -- }

    -- { miniyank
    use {
        'bfredl/nvim-miniyank',
        setup = function()

            vim.g.miniyank_filename = "/Users/" .. vim.fn.expand('$USER') .. "/.local/share/nvim/cache/miniyank.mpack"

            vim.g.miniyank_maxitems = 1000

            vim.cmd [[
              map p <Plug>(miniyank-autoput)
              map P <Plug>(miniyank-autoPut)
              map [p <Plug>(miniyank-cycle)

              map ]p <Plug>(miniyank-startput)
              map ]P <Plug>(miniyank-startPut)

              map <Leader>mc <Plug>(miniyank-tochar)
              map <Leader>ml <Plug>(miniyank-toline)
              map <Leader>mb <Plug>(miniyank-toblock)
              ]]

        end
    }
    -- }

    -- { UnconditionalPaste
    use {
        'vim-scripts/UnconditionalPaste',
        keys = {'<Plug>UnconditionalPaste'},
        setup = function()
            require('_unconditional-paste')
        end
    }
    -- }

    -- Snippets
    use {
        'norcalli/snippets.nvim',
        config = function()
            require('_snippets-nvim')
        end
    }
    use {'hrsh7th/vim-vsnip'}
    use {'hrsh7th/vim-vsnip-integ'}

    use {
        'drmingdrmer/xptemplate',
        -- event = {'VimEnter'},
        config = function()
            vim.cmd [[set runtimepath+=/Users/juju/.config/nvim/xpt-personal]]
            vim.g.xptemplate_key = '<c-\\>'
            vim.g.xptemplate_nav_next = '<C-j>'
            vim.g.xptemplate_nav_prev = '<C-k>'
        end
    }

    use {
        'SirVer/ultisnips',
        -- keys = {'<c-cr>'},
        -- cmd = {'UltiSnipsEdit'},
        config = function()
            -- vim.cmd [[call UltiSnips#FileTypeChanged()]]

            -- vim.cmd [[au VimEnter * au! UltiSnipsFileType]]

            vim.g.UltiSnipsEnableSnipMate = 0
            vim.g.UltiSnipsExpandTrigger = "<c-cr>"
            vim.g.UltiSnipsJumpForwardTrigger = "<c-cr>"
            vim.g.UltiSnipsJumpBackwardTrigger = "<M-cr>"

            vim.g.ultisnips_java_brace_style = "nl"
            vim.g.Ultisnips_java_brace_style = "nl"
            vim.g.UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
            -- vim.g.UltiSnipsSnippetDirectories = [ "/Volumes/Home/.config/nvim/plugged/vim-snippets/UltiSnips"]
        end

    }
    use {'honza/vim-snippets'}
    -- au filetype php set iskeyword+=$

    use {
        'junegunn/vim-easy-align',
        cmd = {'EasyAlign'},
        keys = {'<Plug>(EasyAlign)'},
        setup = function()
            require('_easyalign')
        end
    }

    -- File Browser  And Navigation
    use {
        'tamago324/lir.nvim',
        requires = {'kyazdani42/nvim-web-devicons', 'nvim-lua/plenary.nvim'},
        config = function()
            require('_lir')
        end
    }
    use {'tamago324/lir-bookmark.nvim', requires = {'tamago324/lir.nvim'}}

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require('_nvim-tree')
        end
    }

    use {
        'nvim-lua/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim', 'nvim-telescope/telescope-fzy-native.nvim'},
        config = function()
            require('_telescope')
        end
    }

    use {'nvim-telescope/telescope-project.nvim', requires = {'nvim-lua/telescope.nvim'}}

    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    -- use {'junegunn/fzf', dir = '~/.fzf', run = '/Users/juju/.local/share/nvim/site/pack/packer/start/fzf/install --all'}
    use {'junegunn/fzf'}
    use {
        'junegunn/fzf.vim',
        config = function()
            vim.cmd [[source ~/.config/nvim/lua/_fzf.vim]]
        end
    }

    use {'pbogut/fzf-mru.vim'}

    use {
        'yuki-ycino/fzf-preview.vim', {
            cmd = {
                'FzfPreviewProjectFiles', 'FzfPreviewGitFiles', 'FzfPreviewDirectoryFiles', 'FzfPreviewGitStatus', 'FzfPreviewBuffers',
                'FzfPreviewProjectOldFiles', 'FzfPreviewProjectMruFiles', 'FzfPreviewProjectGrep', 'FzfPreviewOldFiles', 'FzfPreviewMruFiles',
                'FzfPreviewFromResources'
            }
        }
    }

    use {
        'el-iot/buffer-tree-explorer',
        cmd = {'Tree'},
        setup = function()
            vim.g.buffer_tree_explorer_compress = 1
            vim.cmd [[ nnoremap <c-p>o <cmd>Tree<cr> ]]
        end
    }
    -- augroup BufferTreeAuGroup
    -- au!
    -- au BufWinEnter BufferTree :silent unmap <buffer> j<cr>
    -- au BufWinEnter BufferTree :silent unmap <buffer> k<cr>
    -- augroup END

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('gitsigns').setup()
        end
    }

    use {
        'tpope/vim-fugitive',
        config = function()
            require('_fugitive')
        end
    }

    use {'junegunn/gv.vim', {cmd = {'GV', 'GV!', 'GV?'}}}
    vim.cmd [[ nnoremap  <leader>gl :GV<cr>]]

    use {'gregsexton/gitv', {cmd = {'Gitv'}}}
    vim.cmd [[nnoremap <leader>gv :Gitv<cr>]]

    use {'tpope/vim-unimpaired'}

    use {
        'tpope/vim-abolish',
        cmd = {'S', 'Subvert', 'Abolish'},
        keys = {'<Plug>(abolish_coerce_word)', '<Plug>(abolish-coerce)', 'crs', 'crm', 'crc', 'cru', 'cr-', 'cr.', 'cr<space>'}
    }

    use {'machakann/vim-sandwich'}

    -- InlineEdit
    use {'AndrewRadev/inline_edit.vim', {cmd = {'InlineEdit'}}}
    vim.cmd [[xnoremap <leader>ei <cmd>InlineEdit<cr>]]

    -- multiple cursor
    use {
        'terryma/vim-multiple-cursors',
        config = function()
            vim.g.multi_cursor_use_default_mapping = 0
            vim.g.multi_cursor_next_key = '<C-n>'
            vim.g.multi_cursor_prev_key = '<C-p>'
            vim.g.multi_cursor_skip_key = '<C-x>'
            vim.g.multi_cursor_quit_key = '<Esc>'
        end
    }

    use {'gabesoft/vim-ags', {cmd = {'Ags'}}}

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
                line_mapping = "<leader>cc",
                -- Visual/Operator mapping left hand side
                operator_mapping = "<leader>c"
            })
        end
    }

    -- Autopairs
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('_nvim-autopair')
        end
    }

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

    use {
        'navarasu/onedark.nvim',
        config = function()
            vim.g.onedark_style = 'cool' -- deep, cool, warm, Default, dark, darker
            -- vim.cmd [[colorscheme onedark]]

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

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require('_lualine')
        end
    }

    use {
        'crispgm/nvim-tabline',
        config = function()
            require('_tabline')
        end
    }

    use {
        disable = true,
        opt = true,
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

    use {
        "folke/which-key.nvim",
        config = function()
            require('_which-key')
        end
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        branch = 'lua',
        setup = function()
            vim.g.indent_blankline_use_treesitter = true
            vim.g.indent_blankline_show_first_indent_level = false
            vim.g.indent_blankline_char = '│'

            vim.g.indent_blankline_show_current_context = true
            -- vim.cmd [[ let g:indent_blankline_show_current_context=v:true ]]
            vim.g.indent_blankline_context_highlight_list = {'Identifier'}
        end
    }

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
