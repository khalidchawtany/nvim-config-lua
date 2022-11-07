vim.opt.shadafile = "NONE"
vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")
package.path = package.path .. ";/Users/juju/.config/nvim/lua"
local fun = require("functions")

local packer = require("packer")
packer.init(
  {
    -- compile_path = util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua"
  }
)

packer.startup(
  function(use)
    use {
      "lewis6991/impatient.nvim"
      -- rocks = "mpack"
    }

    -- setup use() to replace packer_use()
    fun.setPackerUse(use)
    use = fun.use

    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use "goolord/alpha-nvim"
    -- use "startup-nvim/startup.nvim"

    use "folke/noice.nvim"
    use "VonHeikemen/fine-cmdline.nvim"
    use "MunifTanjim/nui.nvim"

    -- use "luukvbaal/stabilize.nvim"

    use "ntpeters/vim-better-whitespace"

    use "steelsojka/headwind.nvim"

    use "vhyrro/neorg"
    use "kristijanhusak/orgmode.nvim"
    use "phaazon/mind.nvim"
    use "dbinagi/nomodoro"

    use "kazhala/close-buffers.nvim"

    -- twig
    use "gbprod/tree-sitter-twig"

    -- HTTP
    use {"NTBBloodbath/rest.nvim", requires = {"nvim-lua/plenary.nvim"}, keys = {"<Plug>RestNvim"}}

    -- Utilities
    -- use "kevinhwang91/nvim-hlslens" -- adds an index as virtual text for search results
    -- this is builtin now
    -- use "nathom/filetype.nvim"
    use "numToStr/FTerm.nvim"
    use "kopischke/vim-stay"
    use "gioele/vim-autoswap"
    use "lyokha/vim-xkbswitch"
    use {"tyru/capture.vim", cmd = {"Capture"}}

    -- use "github/copilot.vim"
    -- use {"hrsh7th/cmp-copilot"}
    -- use "zbirenbaum/copilot.lua"
    -- use "zbirenbaum/copilot-cmp"

    use "tpope/vim-dispatch"
    use "janko-m/vim-test"

    -- mappings and submodes
    -- use 'svermeulen/vimpeccable'
    use "khalidchawtany/vim-submode"

    -- debuggers
    use "mfussenegger/nvim-dap"
    use "nvim-telescope/telescope-dap.nvim"
    use "theHamsta/nvim-dap-virtual-text"
    use "rcarriga/nvim-dap-ui"

    use "andrewferrier/debugprint.nvim"

    use "folke/todo-comments.nvim"

    use "mrjones2014/dash.nvim"

    use "kevinhwang91/nvim-bqf"
    use "winston0410/mark-radar.nvim"

    -- LSP
    -- use "williamboman/nvim-lsp-installer"
    use {
      "neovim/nvim-lspconfig"
      -- after = {"nvim-cmp"},
      -- event = {"BufRead", "BufNewFile", "InsertEnter"}
    }
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"

    use "https://git.sr.ht/~whynothugo/lsp_lines.nvim"

    use "ray-x/navigator.lua"
    use {"glepnir/lspsaga.nvim", requires = {"neovim/nvim-lspconfig"}}
    use "ojroques/nvim-lspfuzzy"
    use "weilbith/nvim-code-action-menu"

    use "mbbill/undotree"

    use "kana/vim-textobj-user"
    use "rhysd/vim-textobj-anyblock"
    use "machakann/vim-textobj-delimited"
    use "thinca/vim-textobj-between"
    use "saihoooooooo/vim-textobj-space"
    use "kana/vim-textobj-entire"
    use "kana/vim-textobj-indent"
    use "kana/vim-textobj-line"
    use "junegunn/vim-after-object"

    use "rmagatti/goto-preview"

    -- Treesitter
    use "nvim-treesitter/nvim-treesitter"
    use "nvim-treesitter/nvim-treesitter-refactor"
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "mfussenegger/nvim-ts-hint-textobject"
    use "RRethy/nvim-treesitter-textsubjects"

    -- Completion
    use "hrsh7th/nvim-cmp"
    -- use "octaltree/cmp-look"
    use {"hrsh7th/cmp-buffer", after = "nvim-cmp"}
    use {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"}
    use {"hrsh7th/cmp-path", after = "nvim-cmp"}
    use {"quangnguyen30192/cmp-nvim-ultisnips", after = "nvim-cmp"}
    -- use "ms-jpq/coq_nvim"
    -- use {"ms-jpq/coq.artifacts", branch = "artifacts"}

    use "mfussenegger/nvim-treehopper"

    use "mattn/emmet-vim"

    -- Clipboard
    -- use "bfredl/nvim-miniyank"
    -- use "AckslD/nvim-neoclip.lua"
    use "vim-scripts/UnconditionalPaste"
    use "svermeulen/vim-yoink"

    -- Snippets
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"
    -- use "norcalli/snippets.nvim"

    use "drmingdrmer/xptemplate"
    use "SirVer/ultisnips"
    use "honza/vim-snippets"
    -- au filetype php set iskeyword+=$
    use "AllenDang/nvim-expand-expr"

    use "mizlan/iswap.nvim"
    use "junegunn/vim-easy-align"

    -- use "kyazdani42/nvim-tree.lua"
    use "nvim-neo-tree/neo-tree.nvim"
    use "elihunter173/dirbuf.nvim"

    -- generic sidebar
    use "sidebar-nvim/sidebar.nvim"

    -- use "mcchrish/nnn.vim"
    use "luukvbaal/nnn.nvim"

    -- use "chentau/marks.nvim"

    use "camspiers/snap"
    -- use {'camspiers/snap', rocks = {'fzy'}}

    use "nvim-lua/telescope.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use {"nvim-telescope/telescope-project.nvim", after = "telescope.nvim"}
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
    use "natecraddock/telescope-zf-native.nvim"
    use {"nvim-telescope/telescope-file-browser.nvim", after = "telescope.nvim"}
    use "LinArcX/telescope-command-palette.nvim"
    use "LukasPietzschmann/telescope-tabs"
    use "princejoogie/dir-telescope.nvim"

    -- use "nvim-telescope/telescope-z.nvim"

    -- <c-s><c-w> select windows
    use "gbrlsnchs/winpick.nvim"

    -- TODO: remove
    use "charludo/projectmgr.nvim"

    -- Blade
    use {"xsbeats/vim-blade", ft = "blade"}

    -- YAML
    use "cuducos/yaml.nvim"

    -- npm, yarn, pnpm
    use "vuki656/package-info.nvim"

    -- crates RUST
    use "saecki/crates.nvim"

    -- use {'junegunn/fzf', dir = '~/.fzf', run = '/Users/juju/.local/share/nvim/site/pack/packer/start/fzf/install --all'}
    use "junegunn/fzf"
    use {
      "junegunn/fzf.vim",
      config = function()
        vim.cmd [[source ~/.config/nvim/lua/_fzf.vim]]
      end
    }
    use "pbogut/fzf-mru.vim"

    use "vijaymarupudi/nvim-fzf"
    use "ibhagwan/fzf-lua"

    use "el-iot/buffer-tree-explorer"

    use {"justinmk/vim-gtfo", keys = {"gof", "got", "goF", "goT"}}
    vim.cmd [[
    let g:gtfo#terminals = { 'mac' : 'iterm' }
    nnoremap <silent> gof :<c-u>call gtfo#open#file("%:p")<cr>
    nnoremap <silent> got :<c-u>call gtfo#open#term("%:p:h", "")<cr>
    nnoremap <silent> goF :<c-u>call gtfo#open#file(getcwd())<cr>
    nnoremap <silent> goT :<c-u>call gtfo#open#term(getcwd(), "")<cr>
    ]]

    use "vim-ctrlspace/vim-ctrlspace"
    use "samuelsimoes/vim-drawer"
    -- use "tpope/vim-projectionist"
    -- <c-f><c-f>
    use {"otavioschwanck/telescope-alternate"} -- alternative to vim-projectionist

    -- augroup BufferTreeAuGroup
    -- au!
    -- au BufWinEnter BufferTree :silent unmap <buffer> j<cr>
    -- au BufWinEnter BufferTree :silent unmap <buffer> k<cr>
    -- augroup END

    -- Git
    use "lewis6991/gitsigns.nvim"

    use "ThePrimeagen/git-worktree.nvim"

    use "ThePrimeagen/harpoon"

    use "cbochs/portal.nvim" -- show jump-list in floating window

    use "tpope/vim-fugitive"
    use "pwntester/octo.nvim"
    use "TimUntersberger/neogit"

    use "kdheepak/lazygit.nvim"

    use "junegunn/gv.vim"

    use "gregsexton/gitv"

    use "sindrets/diffview.nvim"

    use "tpope/vim-unimpaired"

    use "tpope/vim-abolish"

    -- use "machakann/vim-sandwich"

    use "kylechui/nvim-surround"

    use "echasnovski/mini.nvim"

    use "jedrzejboczar/possession.nvim"
    -- use "rmagatti/auto-session"
    -- use "rmagatti/session-lens" -- telescope for auto-session

    use "AndrewRadev/splitjoin.vim"

    -- auto type  -> when typing - in php
    use "glepnir/mcc.nvim"

    -- InlineEdit
    use {"AndrewRadev/inline_edit.vim", cmd = {"InlineEdit"}}
    vim.cmd [[xnoremap <leader>ei <cmd>InlineEdit<cr>]]

    -- multiple cursor
    use "mg979/vim-visual-multi"

    use "otavioschwanck/cool-substitute.nvim"

    -- make commands previewable
    use "smjonas/live-command.nvim"

    use {"gabesoft/vim-ags", cmd = {"Ags"}}
    -- make quickfix window editable
    use "gabrielpoca/replacer.nvim"

    -- Comments
    use "numToStr/Comment.nvim"
    --
    use "glepnir/coman.nvim" -- comments and annotation
    use "danymat/neogen" -- Documentation and annotation

    -- Autopairs
    use "windwp/nvim-autopairs"

    use "mhartington/formatter.nvim"
    use "jose-elias-alvarez/null-ls.nvim"
    use "jayp0521/mason-null-ls.nvim"

    -- nice folds
    use "kevinhwang91/nvim-ufo"

    -- use "petertriho/nvim-scrollbar"
    use "lewis6991/satellite.nvim" -- decorated scrollbar with signs and more
    use "SmiteshP/nvim-gps" -- allow to get context and put in winbar to the left or virtual text

    -- show context of the cursor usging virtual_text
    use "haringsrob/nvim_context_vt"

    use "simrat39/symbols-outline.nvim"
    use "gorbit99/codewindow.nvim"

    -- Theme
    use {
      "folke/tokyonight.nvim",
      config = function()
        vim.g.tokyonight_style = "knight" -- storm, knight, day
        vim.g.tokyonight_italic_functions = true
        vim.g.tokyonight_sidebars = {"qf", "vista_kind", "terminal", "packer"}
        vim.g.tokyonight_hide_inactive_statusline = false
        ---vim.g.tokyonight_colors = {hint = "orange", error = "#ff0000"}
        vim.cmd([[colorscheme tokyonight]])
      end
    }

    use "Yazeed1s/oh-lucy.nvim"

    use {
      "catppuccin/nvim",
      config = function()
        require("catppuccin").setup {
          flavour = "mocha",
          color_overrides = {
            mocha = {}
          },
          integrations = {
            neotree = true
          },
          highlight_overrides = {
            mocha = function(mocha)
              return {}
            end
          }
        }
      end
    }

    use "tiagovla/scope.nvim" -- this is to scope buffers to tabs only
    use "windwp/windline.nvim"
    -- use "hoob3rt/lualine.nvim"
    -- use "kdheepak/tabline.nvim"
    use "ldelossa/buffertag" -- put a tag on each windo with the file name

    use "folke/which-key.nvim"

    -- use "anuvyklack/hydra.nvim"

    -- Put part of your code in a floating window for reference
    use "hoschi/yode-nvim"
    -- Zen Mode plugins
    use "folke/zen-mode.nvim"
    use "kdav5758/TrueZen.nvim"

    -- dims inactive portions of your code
    use "folke/twilight.nvim"

    use "lukas-reineke/indent-blankline.nvim"

    -- make parenthese pairs distinguishable
    use "p00f/nvim-ts-rainbow"

    -- all of these are colorizers
    use "NvChad/nvim-colorizer.lua"
    use "uga-rosa/ccc.nvim" -- colizer and color picker

    use "pechorin/any-jump.vim"

    -- { Tutorials and Easymotion
    -- use "tjdevries/train.nvim"
    -- use "ggandor/lightspeed.nvim"
    use "phaazon/hop.nvim"
    use "ggandor/leap.nvim"
    use "ggandor/leap-ast.nvim"
    use "ggandor/leap-spooky.nvim"
    use "rlane/pounce.nvim"
    -- use "Lokaltog/vim-easymotion"
    -- use {"aykamko/vim-easymotion-segments", after = "vim-easymotion"}
    -- use {"rhysd/clever-f.vim", keys = {"<Plug>(clever-f-"}, fn = {"clever_f#reset"}}
    use "ggandor/flit.nvim"
    use "ripxorip/aerojump.nvim"
    -- }

    -- Global remapping
    ------------------------------

    -- require('telescope').setup {defaults = {}}
    table.remove(package.loaders, 2) -- unregister my custom loader.
  end
)

vim.opt.shadafile = ""
-- dump(package.loaders[2]())

--  use {
--   'myusername/example',        -- The plugin location string
--   -- The following keys are all optional
--   disable = boolean,           -- Mark a plugin as inactive
--   as = string,                 -- Specifies an alias under which to install the plugin
--   installer = function,        -- Specifies custom installer. See "custom installers" below.
--   updater = function,          -- Specifies custom updater. See "custom installers" below.
--   after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
--   rtp = string,                -- Specifies a use flex layout for telescopesubdirectory of the plugin to add to runtimepath.
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
--
--
