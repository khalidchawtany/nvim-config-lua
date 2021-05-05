local set = vim.o
local setg = vim.g
local api = vim.api
local fn = vim.fn
local home = os.getenv("HOME")

vim.g.mapleader = " "
vim.g.loaclleader = "\\"

--- Fuzzy finder: ignore stuff that can't be opened, and generated files
setg.fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"
set.wildignore = vim.o.wildignore .. ',' .. '*.o,*~,*.pyc,*pycache*' -- Ignore compiled files
set.wildignorecase = true
set.wildmode = 'full' -- Complete the longest common string,
set.wildoptions = 'pum' -- show wildmenu as normal autocompleting menu
set.pumblend = 20
set.pumheight = 15
set.wildmenu = true
set.completeopt = 'menuone,noinsert,noselect'
set.inccommand = 'nosplit'

set.showmode = true
set.cmdheight = 1 -- Height of the command bar
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
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2

-- Make it so that long lines wrap smartly
set.breakindent = true
set.showbreak = '↳ '
set.wrapscan = true
set.linebreak = true
set.whichwrap = 'b,s,h,l,<,>,[,]'

-- Foldinf
set.foldmethod = 'manual'
set.foldcolumn = '1'
set.foldlevel = 0
set.modelines = 1
set.foldlevelstart = 2

set.belloff = 'all'

set.shell = '/usr/local/bin/zsh'
set.termguicolors = true
set.textwidth = 80

-- Always have the clipboard be the same as my regular clipboard
set.clipboard = vim.o.clipboard .. 'unnamedplus'

-- Keep diffme function state
vim.cmd('let $diff_me=0')

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
set.fileformats = set.fileformats .. ',mac'
set.binary = true
set.eol = false
-- set.t_Co = 16
set.tabpagemax = 50
set.exrc = true
set.secure = true

-- Respect modeline in files
set.modeline = true
set.modelines = 4

set.printoptions = 'header:0,duplex:long,paper:letter'

set.listchars = 'tab:» ,eol:↲,nbsp:␣,extends:…,precedes:<,extends:>,trail:·'
set.list = false

set.fillchars = 'stlnc:-'

-- Add ignorance of whitespace to diff
-- set.diffopt=vim.o.diffopt .. ',iwhite'
vim.cmd('syntax on')
set.cursorline = false

set.timeout = true
set.timeoutlen = 750

set.ttimeout = true
set.ttimeoutlen = 0

set.title = true -- Show the filename in the window titlebar

set.virtualedit = "all"
set.mouse = ''
set.showtabline = 2 -- hide tabline

-- Disable error bells
set.errorbells = false
set.visualbell = true
set.t_vb = ''
set.startofline = false -- Dont reset cursor to start of line when moving around

set.ruler = true -- Show the cursor position
set.shortmess = 'atIc' -- Dont show the intro message when starting Vim and Prevent completion message flickers

set.scrolloff = 2
set.sidescrolloff = 5

set.cpo = vim.o.cpo .. 'n' -- Draw color for lines that has number only
set.display = set.display .. ',lastline'

-- set.mousehide = true -- Hide mouse while typing

set.synmaxcol = 500 -- max syntax highlight chars
set.foldopen = "block,hor,insert,jump,mark,percent,quickfix,search,tag,undo"

-----------NOT MINE-------
set.conceallevel = 2
-- set.fileformat = 'unix'
set.jumpoptions = "stack"
set.diffopt = "hiddenoff,iwhiteall,algorithm:patience"
set.cscopequickfix = "s-,c-,d-,i-,t-,e-"
set.path = '.,,,**'
set.formatlistpat = "^\\s*\\[({]\\?\\([0-9]\\+\\|[a-zA-Z]\\+\\)[\\]:.)}]\\s\\+\\|^\\s*[-Ð+o*¥]\\s\\+"
-- set.fillchars = "stlnc:È,vert:?,fold:á"
-- set.guicursor = "n:blinkwait60-blinkon175-blinkoff175,i-ci-ve:ver25"
