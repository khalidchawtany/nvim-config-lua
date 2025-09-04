local home = os.getenv("HOME")

-- vim.o.statuscolumn='%=%l%s%{foldlevel(v:lnum) > 0 ? (foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "⎥ "  : "⎥ " ) : "⎥  ") : "⎥  " }'

-- vim.o.statuscolumn='%s%=%{v:wrap ? "" : v:lnum} %#FoldColumn#%@v:lua.StatusColumn.handler.fold@%{v:lua.StatusColumn.display.fold()}%#StatusColumnBorder#▐%#StatusColumnBuffer#'

vim.cmd([[
set signcolumn=yes:1
set indentkeys+=!0<Tab>
]])



vim.cmd("hi! link CurSearch Search")

vim.api.nvim_set_hl(
    0,
    "Cur",
    { bg = "yellow", fg = "#FF30F1", blend = 0, standout = false, reverse = true, nocombine = false }
)
vim.go.guicursor =
"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait900-blinkoff250-blinkon250-Cur/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- let &stc="\ %=%{v:wrap?'':v:relnum}\ ⎥%s%C\ \ \ "

-- disable default plugin
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

vim.g.editorconfig = false

-- Fuzzy finder: ignore stuff that can't be opened, and generated files
vim.g.fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"
vim.opt.wildignore = { "*.o", "*~", "*.pyc", "*pycache*" } -- Ignore compiled files
vim.opt.wildignorecase = true
vim.opt.wildmode = "full"                                  -- Complete the longest common string,
vim.opt.wildoptions = "pum"                                -- show wildmenu as normal autocompleting menu
vim.opt.pumblend = 0                                       -- make pum NOT transparent
vim.opt.pumheight = 15
vim.opt.wildmenu = true
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.inccommand = "nosplit"
vim.opt.splitkeep = "topline" -- topline, screen, cursor

vim.opt.showmode = true
vim.opt.cmdheight = 0  -- Height of the command bar
vim.opt.laststatus = 3 -- make the status bar global
vim.opt.incsearch = true
vim.opt.showmatch = true

vim.opt.matchtime = 2 -- time in decisecons to jump back from matching bracket

vim.opt.showfulltag = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hidden = true
vim.opt.equalalways = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.updatetime = 250
vim.opt.hlsearch = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.wrap = false

-- Always use spaces instead of tab characters
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftround = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Make it so that long lines wrap smartly
vim.opt.breakindent = true
vim.opt.showbreak = "↳ "
vim.opt.wrapscan = true
vim.opt.linebreak = true
vim.opt.whichwrap = "b,s,h,l,<,>,[,]"

-- Foldinfo
-- vim.opt.modelines = 1
-- vim.opt.foldcolumn = '1'
vim.wo.foldlevel = 99
vim.opt.foldlevelstart = 99 -- start with all folds open
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- causes random folding to be closed on some edits
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
vim.wo.foldmethod = "expr" -- 'manual'
vim.o.foldtext =
[[substitute(getline(v:foldstart),'\\\\t',repeat('\\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]

-- vim.api.nvim_create_autocmd("LspNotify", {
-- 	callback = function(args)
-- 		-- client.supports_method('textDocument/foldingRange')
-- 		local bufnr = vim.api.nvim_get_current_buf() -- get buffer number
-- 		for _, client in pairs(vim.lsp.get_clients()) do -- loop over each client to check notifications
-- 			if args.data.client_id == client.id then
-- 				if client.supports_method("textDocument/foldingRange", bufnr) then
-- 					dd("client_id=" .. args.data.client_id, "client.id=" .. client.id, "client.name=" .. client.name)
-- 					vim.lsp.foldclose("methods", vim.fn.bufwinid(args.buf))
-- 					-- if args.data.method == "textDocument/didOpen" then
-- 					-- 	vim.lsp.foldclose("imports", vim.fn.bufwinid(args.buf))
-- 					-- end
-- 				end
-- 			end
-- 		end
-- 	end,
-- })


vim.opt.belloff = "all"

vim.opt.shell = "/opt/homebrew/bin/zsh"
vim.opt.termguicolors = true
vim.opt.textwidth = 80

-- Always have the clipboard be the same as my regular clipboard
vim.opt.clipboard = "unnamedplus"

-- Keep diffme function state
vim.cmd("let $diff_me=0")


vim.opt.messagesopt = "hit-enter,history:1000,wait:2000"
-- vim.opt.grepprg = 'ag\\ --nogroup\\ --nocolor'
vim.opt.grepprg = "rg --smart-case --vimgrep --block-buffered"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.formatoptions = "jcroql"       -- -=t
vim.opt.nrformats = "bin,hex,alpha"
vim.opt.backspace = "indent,eol,start" --- Allow backspace in insert mode

vim.opt.magic = true

vim.opt.lazyredraw = false
vim.opt.ttyfast = true
vim.opt.tf = true
-- How should I decide to take abackup
vim.opt.backupcopy = "auto"
--- Centralize backups, swapfiles and undo history
vim.opt.backupdir = home .. "/.local/share/nvim/cache/backups"

vim.opt.swapfile = true
vim.opt.directory = home .. "/.local/share/nvim/cache/swaps"
vim.opt.viewdir = home .. "/.local/share/nvim/cache/views"
vim.opt.viewoptions = "cursor,curdir" -- 'folds,cursor,curdir'

vim.opt.undofile = true
-- if exists("&undodir")
vim.opt.undodir = home .. "/.local/share/nvim/cache/undo"
-- endif
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

vim.opt.history = 1000

vim.opt.backupskip = "/tmp/*,/private/tmp/*" -- don't back up these
vim.opt.autoread = true                      -- read files on change
vim.opt.fileformats:append({ "mac" })
-- vim.opt.binary = true -- forces noexpandtab
vim.opt.eol = false
-- vim.opt.t_Co = 16
vim.opt.tabpagemax = 50
vim.opt.exrc = true
vim.opt.secure = true

-- Respect modeline in files
vim.opt.modeline = true
vim.opt.modelines = 4

-- vim.opt.printoptions = 'header:0,duplex:long,paper:letter'

vim.opt.listchars = "tab:» ,eol:↲,nbsp:␣,extends:…,precedes:<,extends:>,trail:·,lead:…"
--,space:…
vim.opt.list = false


-- vim.opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
vim.opt.sessionoptions = "blank,buffers,curdir,help,tabpages,winsize,winpos,terminal"
--

-- vim.cmd[[hi DiffviewDiffAdd guibg=orange]]
vim.opt.diffopt="internal,filler,closeoff,linematch:40"

-- Add ignorance of whitespace to diff
-- vim.opt.diffopt:append({ "algorithm:patience" })
-- vim.opt.diffopt = {
--     'internal',            -- default
--     'filler',              -- default
--     'closeoff',            -- default
--     'inline:word',         -- default is inline:simple
--     'linematch:200',       -- default is linematch:40
--     'algorithm:patience',
--     -- 'context:12',
--     -- 'algorithm:histogram',
--     'indent-heuristic',
--     'iwhite',
-- }

vim.opt.fillchars = {
    diff = '╱',
    fold = ' ',
    stlnc = '-',
    foldsep = '┊',
    foldopen = '',
    foldclose = '',
    vert = '│',
    --   horiz     = '━',
    --   horizup   = '┻',
    --   horizdown = '┳',
    --   vert      = '┃',
    --   vertleft  = '┫',
    --   vertright = '┣',
    --   verthoriz = '╋',
}

vim.cmd("syntax on")
vim.opt.cursorline = false

vim.opt.timeout = true
vim.opt.timeoutlen = 500

vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 0

vim.opt.title = true -- Show the filename in the window titlebar

vim.opt.virtualedit = "all"
vim.opt.mouse = ""
vim.opt.showtabline = 1 -- hide tabline

-- Disable error bells
vim.opt.errorbells = false
vim.opt.visualbell = true
-- vim.opt.t_vb = ''
vim.opt.startofline = false -- Dont reset cursor to start of line when moving around

vim.opt.ruler = true        -- Show the cursor position
-- vim.opt.shortmess = 'lnxTo0FatIc' -- Dont show the intro message when starting Vim and Prevent completion message flickers
vim.opt.shortmess = vim.o.shortmess ..
    "I" -- Dont show the intro message when starting Vim and Prevent completion message flickers
-- vim.opt.shortmess = vim.o.shortmess .. "T" -- Truncate other messages in the middle if they are too long
-- vim.opt.shortmess = vim.o.shortmess .. "W" -- don't give "written" or "[w]" when writing a file

vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 5

-- vim.opt.cpo = vim.o.cpo .. 'n' -- Draw color for lines that has number only
vim.opt.display:append({ "lastline" })

-- vim.opt.mousehide = true -- Hide mouse while typing

vim.opt.synmaxcol = 500 -- max syntax highlight chars
vim.opt.foldopen = "block,hor,insert,jump,mark,percent,quickfix,search,tag,undo"

-- this is to prevent ext_ui bugs
-- vim.cmd[[cmap w<cr> <leader>w]]
--
-- require('vim._extui').enable({
--     enable = true, -- Whether to enable or disable the UI.
--     msg = {        -- Options related to the message module.
--         ---@type 'cmd'|'msg' Where to place regular messages, either in the
--         ---cmdline or in a separate ephemeral message window.
--         target = 'msg',
--         timeout = 2000, -- Time a message is visible in the message window.
--     },
-- })
