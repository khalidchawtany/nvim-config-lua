vim.opt.shadafile = "NONE"
package.path = package.path .. ";/Users/juju/.config/nvim/lua"
local fun = require("functions")

require("packer").startup(
  function(use)
    -- setup use() to replace packer_use()
    fun.setPackerUse(use)
    use = fun.use

    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use "glepnir/dashboard-nvim"
    -- use 'goolord/alpha-nvim'
    --
    use "luukvbaal/stabilize.nvim"

    -- { Tutorials and Easymotion
    use "tjdevries/train.nvim"
    use "ggandor/lightspeed.nvim"
    use "phaazon/hop.nvim"
    use "Lokaltog/vim-easymotion"
    use {"aykamko/vim-easymotion-segments", after = "vim-easymotion"}
    use {"rhysd/clever-f.vim", keys = {"<Plug>(clever-f-"}, fn = {"clever_f#reset"}}
    -- }

    use "steelsojka/headwind.nvim"

    use "vhyrro/neorg"
    use "kristijanhusak/orgmode.nvim"

    use "kazhala/close-buffers.nvim"

    -- HTTP
    use {"NTBBloodbath/rest.nvim", requires = {"nvim-lua/plenary.nvim"}, keys = {"<Plug>RestNvim"}}

    -- Utilities
    -- use 'kevinhwang91/nvim-hlslens'
    use "nathom/filetype.nvim"
    use "voldikss/vim-floaterm"
    use "kopischke/vim-stay"
    use "gioele/vim-autoswap"
    use "lyokha/vim-xkbswitch"
    use {"tyru/capture.vim", cmd = {"Capture"}}
    use {
      "tpope/vim-sleuth",
      config = function()
        vim.g.sleuth_automatic = 1
      end
    }

    use "janko-m/vim-test"

    -- mappings and submodes
    -- use 'svermeulen/vimpeccable'
    use "khalidchawtany/vim-submode"

    -- debuggers
    use "mfussenegger/nvim-dap"
    use "nvim-telescope/telescope-dap.nvim"
    use "theHamsta/nvim-dap-virtual-text"
    use "rcarriga/nvim-dap-ui"

    use "mrjones2014/dash.nvim"

    use "kevinhwang91/nvim-bqf"
    use "winston0410/mark-radar.nvim"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "kabouzeid/nvim-lspinstall"
    -- use 'alexaandru/nvim-lspupdate'
    -- use 'williamboman/nvim-lsp-installer'
    use "ray-x/navigator.lua"
    use {"glepnir/lspsaga.nvim", requires = {"neovim/nvim-lspconfig"}}
    use "ojroques/nvim-lspfuzzy"
    use "weilbith/nvim-code-action-menu"

    use "simrat39/symbols-outline.nvim"

    use "mfussenegger/nvim-ts-hint-textobject"
    use "RRethy/nvim-treesitter-textsubjects"
    use "Smirnov-O/ts-unit.nvim"

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

    -- Completion
    use "hrsh7th/nvim-cmp"
    -- use "ms-jpq/coq_nvim"
    -- use {"ms-jpq/coq.artifacts", branch = "artifacts"}

    -- Clipboard
    use "bfredl/nvim-miniyank"
    use "vim-scripts/UnconditionalPaste"

    -- Snippets
    use "hrsh7th/vim-vsnip"
    use "hrsh7th/vim-vsnip-integ"
    use "norcalli/snippets.nvim"

    use "drmingdrmer/xptemplate"
    use "SirVer/ultisnips"
    use "honza/vim-snippets"
    -- au filetype php set iskeyword+=$
    use "AllenDang/nvim-expand-expr"

    use "mizlan/iswap.nvim"
    use "junegunn/vim-easy-align"

    -- File Browser  And Navigation
    use "tamago324/lir.nvim"
    use "tamago324/lir-bookmark.nvim"

    use "kyazdani42/nvim-tree.lua"

    -- use "mcchrish/nnn.vim"
    use "luukvbaal/nnn.nvim"

    use "chentau/marks.nvim"

    use "camspiers/snap"
    -- use {'camspiers/snap', rocks = {'fzy'}}

    use "nvim-lua/telescope.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use {"nvim-telescope/telescope-project.nvim", after = "telescope.nvim"}
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

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

    -- augroup BufferTreeAuGroup
    -- au!
    -- au BufWinEnter BufferTree :silent unmap <buffer> j<cr>
    -- au BufWinEnter BufferTree :silent unmap <buffer> k<cr>
    -- augroup END

    -- Git
    use "lewis6991/gitsigns.nvim"

    use "tpope/vim-fugitive"

    use "junegunn/gv.vim"

    use "gregsexton/gitv"

    use "sindrets/diffview.nvim"

    use "tpope/vim-unimpaired"

    use "tpope/vim-abolish"

    use "machakann/vim-sandwich"

    use "AndrewRadev/splitjoin.vim"

    -- InlineEdit
    use {"AndrewRadev/inline_edit.vim", cmd = {"InlineEdit"}}
    vim.cmd [[xnoremap <leader>ei <cmd>InlineEdit<cr>]]

    -- multiple cursor
    use "mg979/vim-visual-multi"

    use {"gabesoft/vim-ags", cmd = {"Ags"}}

    -- Comments
    use "terrortylor/nvim-comment"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Autopairs
    use "windwp/nvim-autopairs"

    use "mhartington/formatter.nvim"

    -- Theme
    use {
      "folke/tokyonight.nvim",
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
      "navarasu/onedark.nvim",
      config = function()
        vim.g.onedark_style = "cool" -- deep, cool, warm, Default, dark, darker
        -- vim.cmd [[colorscheme onedark]]
      end
    }

    use "drewtempelmeyer/palenight.vim"

    use "windwp/windline.nvim"
    -- use "hoob3rt/lualine.nvim"
    -- use "kdheepak/tabline.nvim"
    use "romgrk/barbar.nvim"
    use "folke/which-key.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "p00f/nvim-ts-rainbow"
    use "folke/zen-mode.nvim"
    use "kdav5758/TrueZen.nvim"
    use "norcalli/nvim-colorizer.lua"

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
