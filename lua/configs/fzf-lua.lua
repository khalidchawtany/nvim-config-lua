local M = {
  module = "fzf-lua",
  cmd = {"FzfLua"}
}

M.init = function()
  vim.cmd [[
  nnoremap <silent><D-p><D-p>  :lua require('fzf-lua').files({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-l>  :lua require('fzf-lua').lines({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p>l      :lua require('fzf-lua').blines({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-o>  :lua require('fzf-lua').buffers({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-u>  :lua require('fzf-lua').oldfiles({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-'>  :lua require('fzf-lua').marks({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-[>  :lua require('fzf-lua').tabs({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-a>  :lua require('fzf-lua').live_grep({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-j>  :lua require('fzf-lua').live_grep_resume({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-\>  :lua require('fzf-lua').grep_curbuf({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p>\      :lua require('fzf-lua').grep_cword({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-g>  :lua require('fzf-lua').git_status	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-c>  :lua require('fzf-lua').git_commits	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p>c      :lua require('fzf-lua').git_bcommits	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-b>  :lua require('fzf-lua').git_branches	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-m>  :lua require('fzf-lua').keymaps	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-r>  :lua require('fzf-lua').registers	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-cr> :lua require('fzf-lua').commands	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>

  ]]

  -- buffers  => open buffers
  -- files    => find or fd on a path
  -- oldfiles => opened files history
  -- quickfix => quickfix list
  -- loclist  => location list

  -- grep            => search for a pattern with grep or rg
  -- grep_last       => run search again with the last pattern
  -- grep_cword      => search word under cursor
  -- grep_cWORD      => search WORD under cursor
  -- grep_visual     => search visual selection
  -- grep_curbuf     => live grep current buffer
  -- live_grep       => live grep current project

  -- git_files      => git ls-files
  -- git_status     => git status
  -- git_commits    => git commit log (project)
  -- git_bcommits   => git commit log (buffer)
  -- git_branch     > git branches

  -- lsp_references             => References
  -- lsp_definitions            => Definitions
  -- lsp_declarations           => Declarations
  -- lsp_typedefs               => Type Definitions
  -- lsp_implementations        => Implementations
  -- lsp_document_symbols       => Document Symbols
  -- lsp_workspace_symbols      => Workspace Symbols
  -- lsp_code_actions           => Code Actions
  -- lsp_document_diagnostics   => Document Diagnostics
  -- lsp_workspace_diagnostics  => Workspace Diagnostics

  -- builtin         => fzf-lua builtin methods
  -- help_tags       => help tags
  -- man_pages       => man pages
  -- colorschemes    => color schemes
  -- commands        => neovim commands
  -- command_history => command history
  -- search_history  => search history
  -- marks           => :marks
  -- registers       => :registers
  -- keymaps         => key mappings
  -- spell_suggest   => spelling suggestions
  -- tags            => project tags
  -- btags           => buffer tags

  -- :lua require('fzf-lua').files({ cwd = '~/.config' })
  -- :lua require('fzf-lua').files({ fzf_layout = 'reverse-list' })
end

M.config = function()
  require "fzf-lua".setup {
    fzf_bin = "sk",
    previewers = {
      builtin = {
        keymap = {
          toggle_full = "<c-->", -- toggle full screen
          toggle_wrap = "<c-=>", -- toggle line wrap
          toggle_hide = "<c-0>", -- toggle on/off (not yet in use)
          page_up = "<c-9>", -- preview scroll up
          page_down = "<c-8>", -- preview scroll down
          page_reset = "<c-bs>" -- reset scroll to orig pos
        }
      }
    }
  }
end

return M

-- local actions = require "fzf-lua.actions"
-- require'fzf-lua'.setup {
--   winopts = {
--     -- split         = "new",           -- open in a split instead?
--     win_height       = 0.85,            -- window height
--     win_width        = 0.80,            -- window width
--     win_row          = 0.30,            -- window row position (0=top, 1=bottom)
--     win_col          = 0.50,            -- window col position (0=left, 1=right)
--     -- win_border    = false,           -- window border? or borderchars?
--     win_border       = { '?', '?', '?', '?', '?', '?', '?', '?' },
--     hl_normal        = 'Normal',        -- window normal color
--     hl_border        = 'FloatBorder',   -- window border color
--   },
--   -- fzf_bin             = 'sk',        -- use skim instead of fzf?
--   fzf_layout          = 'reverse',      -- fzf '--layout='
--   fzf_args            = '',             -- adv: fzf extra args, empty unless adv
--   fzf_binds           = {               -- fzf '--bind=' options
--       'f2:toggle-preview',
--       'f3:toggle-preview-wrap',
--       'shift-down:preview-page-down',
--       'shift-up:preview-page-up',
--       'ctrl-d:half-page-down',
--       'ctrl-u:half-page-up',
--       'ctrl-f:page-down',
--       'ctrl-b:page-up',
--       'ctrl-a:toggle-all',
--       'ctrl-l:clear-query',
--   },
--   preview_border      = 'border',       -- border|noborder
--   preview_wrap        = 'nowrap',       -- wrap|nowrap
--   preview_opts        = 'nohidden',     -- hidden|nohidden
--   preview_vertical    = 'down:45%',     -- up|down:size
--   preview_horizontal  = 'right:60%',    -- right|left:size
--   preview_layout      = 'flex',         -- horizontal|vertical|flex
--   flip_columns        = 120,            -- #cols to switch to horizontal on flex
--   -- default_previewer   = "bat",       -- override the default previewer?
--                                         -- by default uses the builtin previewer
--   previewers = {
--     cmd = {
--       -- custom previewer, will execute:
--       -- `<cmd> <args> <filename>`
--       cmd             = "echo",
--       args            = "",
--     },
--     cat = {
--       cmd             = "cat",
--       args            = "--number",
--     },
--     bat = {
--       cmd             = "bat",
--       args            = "--style=numbers,changes --color always",
--       theme           = 'Coldark-Dark', -- bat preview theme (bat --list-themes)
--       config          = nil,            -- nil uses $BAT_CONFIG_PATH
--     },
--     head = {
--       cmd             = "head",
--       args            = nil,
--     },
--     git_diff = {
--       cmd             = "git diff",
--       args            = "--color",
--     },
--     builtin = {
--       title           = true,         -- preview title?
--       scrollbar       = true,         -- scrollbar?
--       scrollchar      = '?',          -- scrollbar character
--       wrap            = false,        -- wrap lines?
--       syntax          = true,         -- preview syntax highlight?
--       fullscreen      = false,        -- preview max size?
--       hl_cursor       = 'Cursor',     -- cursor highlight
--       hl_range        = 'IncSearch',  -- ranger highlight (not yet in use)
--       keymap = {
--         toggle_full   = '<F2>',       -- toggle full screen
--         toggle_wrap   = '<F3>',       -- toggle line wrap
--         toggle_hide   = '<F4>',       -- toggle on/off (not yet in use)
--         page_up       = '<S-up>',     -- preview scroll up
--         page_down     = '<S-down>',   -- preview scroll down
--         page_reset    = '<S-left>',      -- reset scroll to orig pos
--       },
--     },
--   },
--   -- provider setup
--   files = {
--     -- previewer         = "cat",       -- uncomment to override previewer
--     prompt            = 'Files? ',
--     cmd               = '',             -- "find . -type f -printf '%P\n'",
--     git_icons         = true,           -- show git icons?
--     file_icons        = true,           -- show file icons?
--     color_icons       = true,           -- colorize file|git icons
--     actions = {
--       ["default"]     = actions.file_edit,
--       ["ctrl-s"]      = actions.file_split,
--       ["ctrl-v"]      = actions.file_vsplit,
--       ["ctrl-t"]      = actions.file_tabedit,
--       ["ctrl-q"]      = actions.file_sel_to_qf,
--       ["ctrl-y"]      = function(selected) print(selected[2]) end,
--     }
--   },
--   git = {
--     files = {
--       prompt          = 'GitFiles? ',
--       cmd             = 'git ls-files --exclude-standard',
--       git_icons       = true,           -- show git icons?
--       file_icons      = true,           -- show file icons?
--       color_icons     = true,           -- colorize file|git icons
--     },
--     status = {
--       prompt        = 'GitStatus? ',
--       cmd           = "git status -s",
--       previewer     = "git_diff",
--       file_icons    = true,
--       git_icons     = true,
--       color_icons   = true,
--     },
--     commits = {
--       prompt          = 'Commits? ',
--       cmd             = "git log --pretty=oneline --abbrev-commit --color",
--       preview         = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
--       actions = {
--         ["default"] = nil,
--       },
--     },
--     bcommits = {
--       prompt          = 'BCommits? ',
--       cmd             = "git log --pretty=oneline --abbrev-commit --color --",
--       preview         = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
--       actions = {
--         ["default"] = nil,
--       },
--     },
--     branches = {
--       prompt          = 'Branches? ',
--       cmd             = "git branch --all --color",
--       preview         = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
--       actions = {
--         ["default"] = actions.git_switch,
--       },
--     },
--     icons = {
--       ["M"]           = { icon = "M", color = "yellow" },
--       ["D"]           = { icon = "D", color = "red" },
--       ["A"]           = { icon = "A", color = "green" },
--       ["?"]           = { icon = "?", color = "magenta" },
--       -- ["M"]          = { icon = "?", color = "red" },
--       -- ["D"]          = { icon = "?", color = "red" },
--       -- ["A"]          = { icon = "+", color = "green" },
--     },
--   },
--   grep = {
--     prompt            = 'Rg? ',
--     input_prompt      = 'Grep For? ',
--     -- cmd               = "rg --vimgrep",
--     rg_opts           = "--hidden --column --line-number --no-heading " ..
--                         "--color=always --smart-case -g '!{.git,node_modules}/*'",
--     git_icons         = true,           -- show git icons?
--     file_icons        = true,           -- show file icons?
--     color_icons       = true,           -- colorize file|git icons
--     actions = {
--       ["default"]     = actions.file_edit,
--       ["ctrl-s"]      = actions.file_split,
--       ["ctrl-v"]      = actions.file_vsplit,
--       ["ctrl-t"]      = actions.file_tabedit,
--       ["ctrl-q"]      = actions.file_sel_to_qf,
--       ["ctrl-y"]      = function(selected) print(selected[2]) end,
--     }
--   },
--   oldfiles = {
--     prompt            = 'History? ',
--     cwd_only          = false,
--   },
--   buffers = {
--     prompt            = 'Buffers? ',
--     file_icons        = true,         -- show file icons?
--     color_icons       = true,         -- colorize file|git icons
--     sort_lastused     = true,         -- sort buffers() by last used
--     actions = {
--       ["default"]     = actions.buf_edit,
--       ["ctrl-s"]      = actions.buf_split,
--       ["ctrl-v"]      = actions.buf_vsplit,
--       ["ctrl-t"]      = actions.buf_tabedit,
--       ["ctrl-x"]      = actions.buf_del,
--     }
--   },
--   colorschemes = {
--     prompt            = 'Colorschemes? ',
--     live_preview      = true,       -- apply the colorscheme on preview?
--     actions = {
--       ["default"]     = actions.colorscheme,
--       ["ctrl-y"]      = function(selected) print(selected[2]) end,
--     },
--     winopts = {
--       win_height        = 0.55,
--       win_width         = 0.30,
--     },
--     post_reset_cb     = function()
--       -- reset statusline highlights after
--       -- a live_preview of the colorscheme
--       -- require('feline').reset_highlights()
--     end,
--   },
--   quickfix = {
--     -- cwd               = vim.loop.cwd(),
--     file_icons        = true,
--     git_icons         = true,
--   },
--   lsp = {
--     prompt            = '? ',
--     -- cwd               = vim.loop.cwd(),
--     cwd_only          = false,      -- LSP/diagnostics for cwd only?
--     async_or_timeout  = true,       -- timeout(ms) or false for blocking calls
--     file_icons        = true,
--     git_icons         = false,
--     lsp_icons         = true,
--     severity          = "hint",
--     icons = {
--       ["Error"]       = { icon = "?", color = "red" },       -- error
--       ["Warning"]     = { icon = "?", color = "yellow" },    -- warning
--       ["Information"] = { icon = "?", color = "blue" },      -- info
--       ["Hint"]        = { icon = "?", color = "magenta" },   -- hint
--     },
--   },
--   -- placeholders for additional user customizations
--   loclist = {},
--   helptags = {},
--   manpages = {},
--   -- optional override of file extension icon colors
--   -- available colors (terminal):
--   --    clear, bold, black, red, green, yellow
--   --    blue, magenta, cyan, grey, dark_grey, white
--   file_icon_colors = {
--     ["lua"]   = "blue",
--   },
-- }