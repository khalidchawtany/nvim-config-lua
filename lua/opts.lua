local set = vim.opt
local setg = vim.g
local home = os.getenv("HOME")

vim.g.mapleader = " "
vim.g.loaclleader = "\\"

-- disable default plugin
local disabled_built_ins = {
    "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers", "gzip", "zip", "zipPlugin", "tar", "tarPlugin", "getscript", "getscriptPlugin",
    "vimball", "vimballPlugin", "2html_plugin", "logipat", "rrhelper", "spellfile_plugin"
}

for _, plugin in pairs(disabled_built_ins) do vim.g["loaded_" .. plugin] = 1 end

-- Fuzzy finder: ignore stuff that can't be opened, and generated files
setg.fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"
set.wildignore = {"*.o", "*~", "*.pyc", "*pycache*"} -- Ignore compiled files
set.wildignorecase = true
set.wildmode = 'full' -- Complete the longest common string,
set.wildoptions = 'pum' -- show wildmenu as normal autocompleting menu
set.pumblend = 0 -- make pum NOT transparent
set.pumheight = 15
set.wildmenu = true
set.completeopt = 'menuone,noinsert,noselect'
set.inccommand = 'nosplit'
set.splitkeep = "topline" -- topline, screen, cursor

set.showmode = true
set.cmdheight = 0 -- Height of the command bar
set.laststatus = 3  -- make the status bar global
set.incsearch = true
set.showmatch = true

set.matchtime = 2 -- time in decisecons to jump back from matching bracket

set.showfulltag = true
set.number = true
set.relativenumber = true
set.ignorecase = true
set.smartcase = true
set.hidden = true
set.equalalways = false
set.splitright = true
set.splitbelow = true
set.updatetime = 250
set.hlsearch = true

set.autoindent = true
set.smartindent = true
set.cindent = true
set.wrap = true

-- Always use spaces instead of tab characters
set.expandtab = true
set.smarttab = true
set.shiftround = true
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4

-- Make it so that long lines wrap smartly
set.breakindent = true
set.showbreak = '↳ '
set.wrapscan = true
set.linebreak = true
set.whichwrap = 'b,s,h,l,<,>,[,]'

-- Foldinf
-- set.foldmethod = 'manual'
-- set.foldcolumn = '1'
set.foldlevel = 1
vim.wo.foldlevel = 1
set.modelines = 1
set.foldlevelstart = 2

set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

set.belloff = 'all'

set.shell = '/usr/local/bin/zsh'
set.termguicolors = true
set.textwidth = 80

-- Always have the clipboard be the same as my regular clipboard
set.clipboard = 'unnamedplus'

-- Keep diffme function state
vim.cmd('let $diff_me=0')

set.diffopt:append { 'algorithm:patience' }

-- set.grepprg = 'ag\\ --nogroup\\ --nocolor'
set.grepprg = "rg --smart-case --vimgrep --block-buffered"
set.formatoptions = 'jcroql' -- -=t
set.nrformats = "bin,hex,alpha"
set.backspace = 'indent,eol,start' --- Allow backspace in insert mode

set.magic = true

set.lazyredraw = false
set.ttyfast = true
set.tf = true
-- How should I decide to take abackup
set.backupcopy = 'auto'
--- Centralize backups, swapfiles and undo history
set.backupdir = home .. '/.local/share/nvim/cache/backups'

set.directory = home .. '/.local/share/nvim/cache/swaps'
set.viewdir = home .. '/.local/share/nvim/cache/views'

set.undofile = true
-- if exists("&undodir")
set.undodir = home .. '/.local/share/nvim/cache/undo'
-- endif
set.undolevels = 1000
set.undoreload = 10000

set.history = 1000

set.backupskip = '/tmp/*,/private/tmp/*' -- don't back up these
set.autoread = true -- read files on change
set.fileformats:append{'mac'}
-- set.binary = true -- forces noexpandtab
set.eol = false
-- set.t_Co = 16
set.tabpagemax = 50
set.exrc = true
set.secure = true

-- Respect modeline in files
set.modeline = true
set.modelines = 4

set.printoptions = 'header:0,duplex:long,paper:letter'

set.listchars = 'tab:» ,eol:↲,nbsp:␣,extends:…,precedes:<,extends:>,trail:·,lead:…'
--,space:…
set.list = false

set.fillchars = 'stlnc:-,foldsep:┊,foldopen:,foldclose:,vert:│'

set.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
 -- 

-- vim.opt.fillchars = {
--   horiz     = '━',
--   horizup   = '┻',
--   horizdown = '┳',
--   vert      = '┃',
--   vertleft  = '┫',
--   vertright = '┣',
--   verthoriz = '╋',
-- }

-- Add ignorance of whitespace to diff
vim.opt.diffopt:append('iwhite')
vim.opt.diffopt:append('linematch:60')

vim.cmd('syntax on')
set.cursorline = false

set.timeout = true
set.timeoutlen = 500

set.ttimeout = true
set.ttimeoutlen = 0

set.title = true -- Show the filename in the window titlebar

set.virtualedit = "all"
set.mouse = ''
set.showtabline = 1 -- hide tabline

-- Disable error bells
set.errorbells = false
set.visualbell = true
-- set.t_vb = ''
set.startofline = false -- Dont reset cursor to start of line when moving around

set.ruler = true -- Show the cursor position
-- set.shortmess = 'lnxTo0FatIc' -- Dont show the intro message when starting Vim and Prevent completion message flickers

set.scrolloff = 2
set.sidescrolloff = 5

set.cpo = vim.o.cpo .. 'n' -- Draw color for lines that has number only
set.display:append{'lastline'}

-- set.mousehide = true -- Hide mouse while typing

set.synmaxcol = 500 -- max syntax highlight chars
set.foldopen = "block,hor,insert,jump,mark,percent,quickfix,search,tag,undo"
