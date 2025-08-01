-- formatter=path.filename_first
-- :FzfLua live_grep  multiline=2
-- :FzfLua lsp_finder  multiline=1
-- :lua require("fzf-lua").live_grep({  multiline = 2 })
-- :lua require("fzf-lua").lsp_finder({  multiline = 1 })

local getOpts = function(...)
    local n_args = select("#", ...) -- number of arguments passed
    if n_args == 0 then
        return {
            winopts = {
                preview = {
                    layout = "vertical",
                    vertical = "down",
                },
            },

            -- preview_layout = "vertical",
            fzf_layout = "reverse",
        }
    end
    return {
        fzf_opts = { ["--query"] = vim.fn.expand("<cword>") },
        -- preview_layout = "vertical",
        -- preview_vertical = "down",
        winopts = {
            preview = {
                layout = "vertical",
                vertical = "down",
            },
        },
        fzf_layout = "reverse",
    }
end

--   require'fzf-lua'.lsp_document_symbols({ fzf_args = [[--query='Function']] })
-- :lua require'fzf-lua'.lsp_document_symbols({ fzf_opts = { ['--query'] = 'Function' }})
-- -- I recommend the latter option as I find it easier to use custom queries
-- -- for example this expands to "word under cursor"
-- :lua require'fzf-lua'.lsp_document_symbols({ fzf_opts = { ['--query'] = vim.fn.expand('<cword>') }})

--  -- both cmds have the same result (different ways of supplying the '--query'
-- -- flag), using 'fzf_opts' table does the 'vim.fn.shellescape' for you
-- :lua require'fzf-lua'.grep_project({ fzf_opts={ ['--query']=vim.fn.expand('<cword>') }})
-- :lua require'fzf-lua'.grep_project({ fzf_cli_args= '--query='..vim.fn.shellescape(vim.fn.expand('<cword>')) })
--  require'fzf-lua'.setup {
--   grep = {
--     actions = {
--       ['ctrl-y'] = function(_, opts)
--         if opts.__FNCREF__ then
--           require'fzf-lua'.grep({ continue_last_search = true })
--           require'fzf-lua.actions'.ensure_insert_mode()
--         else
--           require'fzf-lua'.live_grep({ continue_last_search = true })
--           require'fzf-lua.actions'.ensure_insert_mode()
--         end
--       end
--     },
--   },
-- }

return {
    "ibhagwan/fzf-lua",
    cmd = { "FzfLua" },
    keys = {
        -- { "<D-p><leader>", function() require('fzf-lua').changes({}) end, desc = "changes" },
        --
        {
            "<D-p>-",
            function()
                require("fzf-lua").lsp_document_symbols({ fzf_args = [[--query='Method ']] })
            end,
            desc = "lsp_document_symbols Methods",
        },
        {
            "<D-p><D-cr>",
            function()
                require("fzf-lua").builtin(getOpts())
            end,
            desc = "FzfLua builtins",
        },
        {
            "<D-p><D-->",
            function()
                require("fzf-lua").lsp_document_symbols(getOpts())
            end,
            desc = "lsp_document_symbols",
        },
        {
            "<D-p><D-p>",
            function()
                require("fzf-lua").files(getOpts())
            end,
            desc = "files",
        },
        {
            "<D-p><D-m>",
            function()
                require("fzf-lua").changes(getOpts())
            end,
            desc = "changes",
        },
        {
            "<D-p><D-l>",
            function()
                require("fzf-lua").lines(getOpts())
            end,
            desc = "lines",
        },
        {
            "<D-p><D-t>",
            function()
                require("fzf-lua").colorschemes(getOpts())
            end,
            desc = "colorschemes",
        },
        {
            "<D-p>l",
            function()
                require("fzf-lua").blines(getOpts())
            end,
            desc = "blines",
        },
        {
            "<D-p><D-o>",
            function()
                require("fzf-lua").buffers(getOpts())
            end,
            desc = "buffers",
        },
        {
            "<D-p><D-u>",
            function()
                require("fzf-lua").oldfiles(getOpts())
            end,
            desc = "oldfiles",
        },
        {
            "<D-p><D-'>",
            function()
                require("fzf-lua").marks(getOpts())
            end,
            desc = "marks",
        },
        {
            "<D-p><D-[>",
            function()
                require("fzf-lua").tabs(getOpts())
            end,
            desc = "tabs",
        },
        {
            "<D-p><D-j>",
            function()
                require("fzf-lua").grep_project(getOpts())
            end,
            desc = "grep_project",
        },
        {
            "<D-p>j",
            function()
                require("fzf-lua").grep_cword(getOpts())
            end,
            desc = "grep_projct <cword>",
        },
        {
            "<D-p>J",
            function()
                require("fzf-lua").live_grep_native(getOpts())
            end,
            desc = "live_grep_native",
        },

        {
            "<D-p>a",
            function()
                require("fzf-lua").live_grep(getOpts())
            end,
            desc = "live_grep",
        },
        {
            "<D-p><D-a>",
            function()
                require("fzf-lua").live_grep_glob(getOpts())
            end,
            desc = "live_grep_glob",
        },
        {
            "<D-p>r",
            function()
                require("fzf-lua").live_grep_resume(getOpts())
            end,
            desc = "live_grep_resume",
        },
        {
            "<D-p><D-r>",
            function()
                require("fzf-lua").resume(getOpts())
            end,
            desc = "resume",
        },
        {
            "<D-p><D-\\>",
            function()
                require("fzf-lua").grep_curbuf(getOpts())
            end,
            desc = "grep_curbuf",
        },
        {
            "<D-p>\\",
            function()
                require("fzf-lua").grep_cword(getOpts())
            end,
            desc = "grep_cword",
        },
        {
            "<D-p><D-g>",
            function()
                require("fzf-lua").git_status(getOpts())
            end,
            desc = "git_status",
        },
        {
            "<D-p>g",
            function()
                require("fzf-lua").git_status(getOpts())
            end,
            desc = "git_status",
        },
        {
            "<D-p><D-v>",
            function()
                require("fzf-lua").git_status(getOpts())
            end,
            desc = "git_status",
        },
        {
            "<D-p>v",
            function()
                require("fzf-lua").git_status(getOpts())
            end,
            desc = "git_status",
        },
        {
            "<D-p><D-c>",
            function()
                require("fzf-lua").git_commits(getOpts())
            end,
            desc = "git_commits",
        },
        {
            "<D-p>c",
            function()
                require("fzf-lua").git_bcommits(getOpts())
            end,
            desc = "git_bcommits",
        },
        {
            "<D-p><D-b>",
            function()
                require("fzf-lua").git_branches(getOpts())
            end,
            desc = "git_branches",
        },
        {
            "<D-p><D-k>",
            function()
                require("fzf-lua").keymaps(getOpts())
            end,
            desc = "keymaps",
        },
        {
            "<D-p><D-'>",
            function()
                require("fzf-lua").registers(getOpts())
            end,
            desc = "registers",
        },
        {
            '<D-p><D-">',
            function()
                require("fzf-lua").registers(getOpts())
            end,
            desc = "registers",
        },
        {
            "<D-p><D-;>",
            function()
                require("fzf-lua").commands(getOpts())
            end,
            desc = "commands",
        },
        {
            "<D-p><D-]>",
            "<cmd>ListFilesFromBranch<cr>",
            desc = "Git list files from other branch",
        },
        {
            "<D-p><D-i>",
            "<cmd>PickFileFromCommit<cr>",
            desc = "Git list files from a commit and shows it",
        },
        {
            "<D-p><D-h>",
            "<cmd>ListFilesFromHEAD<cr>",
            desc = "Files from HEAD",
        },
    },

    init = function()
        -- nnoremap <silent> <c-p><c-h> :call fzf#run({"source":"git diff --name-only HEAD HEAD~1 " , "sink":"edit"})<cr>

        vim.api.nvim_create_user_command("ListFilesFromHEAD", function(opts)
            require("lazy").load({ plugins = { "vim-fugitive" } })
            require("fzf-lua").git_files({
                cmd       = "git diff --name-only HEAD HEAD~1 " .. opts.args,
                prompt    = opts.args .. "> ",
                actions   = {
                    ["default"] = function(selected, o)
                        local file = require("fzf-lua").path.entry_to_file(selected[1], o)
                        local cmd = string.format("e %s", file.path)
                        vim.cmd(cmd)
                    end,
                    ["ctrl-g"] = function(selected, o)
                        local file = require("fzf-lua").path.entry_to_file(selected[1], o)
                        local rel_path = require('functions').to_relative_path(file.path)
                        local cmd = string.format("Gvsplit HEAD:%s", rel_path)
                        local file = require("fzf-lua").path.entry_to_file(selected[1], o)
                    end,
                    ["ctrl-t"] = function(selected, o)
                        local file = require("fzf-lua").path.entry_to_file(selected[1], o)
                        -- local cmd = string.format("Gtabedit %s:%s", opts.args, file.path)
                        local cmd = string.format("tabedit %s", file.path)
                        vim.cmd(cmd)
                    end,
                    ["ctrl-s"] = function(selected, o)
                        local file = require("fzf-lua").path.entry_to_file(selected[1], o)
                        -- local cmd = string.format("Gsplit %s:%s", opts.args, file.path)
                        local cmd = string.format("split %s", file.path)
                        vim.cmd(cmd)
                    end,
                    ["ctrl-v"] = function(selected, o)
                        local file = require("fzf-lua").path.entry_to_file(selected[1], o)

                        local cmd = string.format("vsplit %s", file.path)
                        vim.cmd(cmd)
                    end,
                },

                previewer = false,
                -- preview = "git diff {ref} {file}",
                preview   = require('fzf-lua.previewer.fzf').git_diff,
                preview   = require("fzf-lua").shell.raw_preview_action_cmd(function(items)
                    local file = require("fzf-lua").path.entry_to_file(items[1])
                    return string.format("git --no-pager diff   %s HEAD~1 -- %s | delta", opts.args, file.path)
                end),
            })
        end, {
            force = true,
        })

        vim.api.nvim_create_user_command("ListFilesFromBranch", function(opts)
            require("lazy").load({ plugins = { "vim-fugitive" } })
            local args = opts.args
            local listFilesFromBranch = function(branch)
                require("fzf-lua").files({
                    cmd = "git ls-tree -r --name-only " .. branch,
                    prompt = branch .. "> ",
                    actions = {
                        ["default"] = false,
                        ["ctrl-s"] = false,
                        ["ctrl-v"] = function(selected, o)
                            local file = require("fzf-lua").path.entry_to_file(selected[1], o)
                            local cmd = string.format("Gvsplit %s:%s", branch, file.path)
                            vim.cmd(cmd)
                        end,
                    },
                    previewer = false,
                    preview = require("fzf-lua").shell.raw_preview_action_cmd(function(items)
                        local file = require("fzf-lua").path.entry_to_file(items[1])

                        local fileParts = require("user.functions").splitBy(file.path, "\t")

                        local filePath = ""
                        if #fileParts == 1 then
                            filePath = fileParts[1]
                        else
                            filePath = fileParts[2] .. "/" .. fileParts[1]
                        end

                        -- return string.format("git diff %s HEAD -- %s | delta", branch, filePath)
                        return string.format("git diff %s -- %s | delta", branch, filePath)
                    end),
                })
            end

            if #args == 0 then
                -- list all bracnhes in a fzf to choose from
                return require("fzf-lua").git_branches({
                    actions = {
                        ["default"] = function(selected, o)
                            local branch = selected[1]
                            branch = branch:match("[^%s%*]+"):gsub("^remotes/", "")
                            listFilesFromBranch(branch)
                        end,
                    },
                })
            end

            listFilesFromBranch(args)
        end, {
            nargs = "?",
            force = true,
            complete = function()
                local branches = vim.fn.systemlist("git branch --all --sort=-committerdate")
                if vim.v.shell_error == 0 then
                    return vim.tbl_map(function(x)
                        return x:match("[^%s%*]+"):gsub("^remotes/", "")
                    end, branches)
                end
            end,
        })
    end,

    config = function()
        local actions = require("fzf-lua.actions")
        require("fzf-lua").setup({

            defaults = {
                formatter = "path.filename_first",
                multiline = 1,
            },
            -- fzf_bin         = 'sk',            -- use skim instead of fzf?
            -- https://github.com/lotabout/skim
            global_resume = true, -- enable global `resume`?
            -- can also be sent individually:
            -- `<any_function>.({ gl ... })`
            global_resume_query = true, -- include typed query in `resume`?
            winopts = {
                -- split         = "belowright new",-- open in a split instead?
                -- "belowright new"  : split below
                -- "aboveleft new"   : split above
                -- "belowright vnew" : split right
                -- "aboveleft vnew   : split left
                -- Only valid when using a float window
                -- (i.e. when 'split' is not defined, default)
                height = 0.90, -- window height
                width = 0.90,  -- window width
                row = 0.35,    -- window row position (0=top, 1=bottom)
                col = 0.50,    -- window col position (0=left, 1=right)
                -- border argument passthrough to nvim_open_win(), also used
                -- to manually draw the border characters around the preview
                -- window, can be set to 'false' to remove all borders or to
                -- 'none', 'single', 'double', 'thicc' or 'rounded' (default)
                -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },

                border = require("user.functions").get_borderchars("fzf-lua"),
                fullscreen = false, -- start fullscreen?
                -- highlights should optimally be set by the colorscheme using
                -- FzfLuaXXX highlights. If your colorscheme doesn't set these
                -- or you wish to override its defaults use these:
                --[[ hl = {
          normal         = 'Normal',        -- window normal color (fg+bg)
          border         = 'FloatBorder',   -- border color
          help_normal    = 'Normal',        -- <F1> window normal
          help_border    = 'FloatBorder',   -- <F1> window border
          -- Only used with the builtin previewer:
          cursor         = 'Cursor',        -- cursor highlight (grep/LSP matches)
          cursorline     = 'CursorLine',    -- cursor line
          cursorlinenr   = 'CursorLineNr',  -- cursor line number
          search         = 'IncSearch',     -- search matches (ctags|help)
          title          = 'Normal',        -- preview border title (file/buffer)
          -- Only used with 'winopts.preview.scrollbar = 'float'
          scrollfloat_e  = 'PmenuSbar',     -- scrollbar "empty" section highlight
          scrollfloat_f  = 'PmenuThumb',    -- scrollbar "full" section highlight
          -- Only used with 'winopts.preview.scrollbar = 'border'
          scrollborder_e = 'FloatBorder',   -- scrollbar "empty" section highlight
          scrollborder_f = 'FloatBorder',   -- scrollbar "full" section highlight
        }, ]]
                preview = {
                    -- default     = 'bat',           -- override the default previewer?
                    -- default uses the 'builtin' previewer
                    border = "border",        -- border|noborder, applies only to
                    -- native fzf previewers (bat/cat/git/etc)
                    wrap = "nowrap",          -- wrap|nowrap
                    hidden = "nohidden",      -- hidden|nohidden
                    vertical = "down:45%",    -- up|down:size
                    horizontal = "right:60%", -- right|left:size
                    layout = "flex",          -- horizontal|vertical|flex
                    flip_columns = 120,       -- #cols to switch to horizontal on flex
                    -- Only used with the builtin previewer:
                    title = true,             -- preview border title (file/buf)?
                    title_pos = "left",       -- left|center|right, title alignment
                    scrollbar = "float",      -- `false` or string:'float|border'
                    -- float:  in-window floating border
                    -- border: in-border chars (see below)
                    scrolloff = "-2", -- float scrollbar offset from right
                    -- applies only when scrollbar = 'float'
                    scrollchars = { "█", "" }, -- scrollbar chars ({ <full>, <empty> }
                    -- applies only when scrollbar = 'border'
                    delay = 0, -- delay(ms) displaying the preview
                    -- prevents lag on fast scrolling
                    winopts = {
                        -- builtin previewer window options
                        number = true,
                        relativenumber = false,
                        cursorline = true,
                        cursorlineopt = "both",
                        cursorcolumn = false,
                        signcolumn = "no",
                        list = false,
                        foldenable = false,
                        foldmethod = "manual",
                    },
                },
                on_create = function()
                    -- called once upon creation of the fzf main window
                    -- can be used to add custom fzf-lua mappings, e.g:
                    --   vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", "<Down>",
                    --     { silent = true, noremap = true })
                end,
            },
            keymap = {
                -- These override the default tables completely
                -- no need to set to `false` to disable a bind
                -- delete or modify is sufficient
                builtin = {
                    -- neovim `:tmap` mappings for the fzf win
                    ["<c-/>"] = "toggle-help",
                    ["<c-cr>"] = "toggle-fullscreen",
                    -- Only valid with the 'builtin' previewer
                    ["<c-w>"] = "toggle-preview-wrap",
                    ["<c-p>"] = "toggle-preview",
                    -- Rotate preview clockwise/counter-clockwise
                    ["<c-]>"] = "toggle-preview-ccw",
                    ["<c-[>"] = "toggle-preview-cw",
                    ["<c-;>"] = "preview-page-down",
                    ["<c-'>"] = "preview-page-up",
                    ["<c-bs>"] = "preview-page-reset",
                },
                fzf = {
                    -- fzf '--bind=' options
                    ["ctrl-z"] = "abort",
                    ["ctrl-u"] = "unix-line-discard",
                    ["ctrl-f"] = "half-page-down",
                    ["ctrl-b"] = "half-page-up",
                    ["ctrl-a"] = "beginning-of-line",
                    ["ctrl-e"] = "end-of-line",
                    ["ctrl-space"] = "toggle-all",
                    -- Only valid with fzf previewers (bat/cat/git/etc)
                    ["f3"] = "toggle-preview-wrap",
                    ["f4"] = "toggle-preview",
                    ["shift-down"] = "preview-page-down",
                    ["shift-up"] = "preview-page-up",
                },
            },
            actions = {
                -- These override the default tables completely
                -- no need to set to `false` to disable an action
                -- delete or modify is sufficient
                files = {
                    -- providers that inherit these actions:
                    --   files, git_files, git_status, grep, lsp
                    --   oldfiles, quickfix, loclist, tags, btags
                    --   args
                    -- default action opens a single selection
                    -- or sends multiple selection to quickfix
                    -- replace the default action with the below
                    -- to open all files whether single or multiple
                    -- ["default"]     = actions.file_edit,
                    ["default"] = actions.file_edit_or_qf,
                    ["ctrl-s"] = actions.file_split,
                    ["ctrl-v"] = actions.file_vsplit,
                    ["alt-i"] = actions.toggle_ignore,
                    ["alt-h"] = actions.toggle_hidden,
                    ["ctrl-t"] = actions.file_tabedit,
                    ["ctrl-q"] = actions.file_sel_to_qf,
                    ["ctrl-l"] = actions.file_sel_to_ll,
                },
                buffers = {
                    -- providers that inherit these actions:
                    --   buffers, tabs, lines, blines
                    ["default"] = actions.buf_edit,
                    ["ctrl-s"] = actions.buf_split,
                    ["ctrl-v"] = actions.buf_vsplit,
                    ["ctrl-t"] = actions.buf_tabedit,
                },
            },
            fzf_opts = {
                -- options are sent as `<left>=<right>`
                -- set to `false` to remove a flag
                -- set to '' for a non-value flag
                -- for raw args use `fzf_args` instead
                ["--ansi"] = "",
                ["--info"] = "inline",
                ["--height"] = "100%",
                ["--layout"] = "reverse",
                ["--border"] = "none",
            },
            -- fzf '--color=' options (optional)
            --[[ fzf_colors = {
          ["fg"]          = { "fg", "CursorLine" },
          ["bg"]          = { "bg", "Normal" },
          ["hl"]          = { "fg", "Comment" },
          ["fg+"]         = { "fg", "Normal" },
          ["bg+"]         = { "bg", "CursorLine" },
          ["hl+"]         = { "fg", "Statement" },
          ["info"]        = { "fg", "PreProc" },
          ["prompt"]      = { "fg", "Conditional" },
          ["pointer"]     = { "fg", "Exception" },
          ["marker"]      = { "fg", "Keyword" },
          ["spinner"]     = { "fg", "Label" },
          ["header"]      = { "fg", "Comment" },
          ["gutter"]      = { "bg", "Normal" },
      }, ]]
            previewers = {
                cat = {
                    cmd = "cat",
                    args = "--number",
                },
                bat = {
                    cmd = "bat",
                    args = "--style=numbers,changes --color always",
                    theme = "Coldark-Dark", -- bat preview theme (bat --list-themes)
                    config = nil,           -- nil uses $BAT_CONFIG_PATH
                },
                head = {
                    cmd = "head",
                    args = nil,
                },
                git_diff = {
                    cmd_deleted = "git diff --color HEAD --",
                    cmd_modified = "git diff --color HEAD",
                    cmd_untracked = "git diff --color --no-index /dev/null",
                    -- uncomment if you wish to use git-delta as pager
                    -- can also be set under 'git.status.preview_pager'
                    -- pager        = "delta --width=$FZF_PREVIEW_COLUMNS",
                },
                man = {
                    -- NOTE: remove the `-c` flag when using man-db
                    cmd = "man -c %s | col -bx",
                },
                builtin = {
                    syntax = true,                -- preview syntax highlight?
                    syntax_limit_l = 0,           -- syntax limit (lines), 0=nolimit
                    syntax_limit_b = 1024 * 1024, -- syntax limit (bytes), 0=nolimit
                    limit_b = 1024 * 1024 * 10,   -- preview limit (bytes), 0=nolimit
                    -- preview extensions using a custom shell command:
                    -- for example, use `viu` for image previews
                    -- will do nothing if `viu` isn't executable
                    extensions = {
                        -- neovim terminal only supports `viu` block output
                        ["png"] = { "viu", "-b" },
                        ["svg"] = { "chafa" },
                        ["jpg"] = { "ueberzug" },
                    },
                    -- if using `ueberzug` in the above extensions map
                    -- set the default image scaler, possible scalers:
                    --   false (none), "crop", "distort", "fit_contain",
                    --   "contain", "forced_cover", "cover"
                    -- https://github.com/seebye/ueberzug
                    ueberzug_scaler = "cover",
                },
            },
            -- provider setup
            files = {
                -- previewer      = "bat",          -- uncomment to override previewer
                -- (name from 'previewers' table)
                -- set to 'false' to disable
                prompt = "Files❯ ",
                multiprocess = true, -- run command in a separate process
                git_icons = true,    -- show git icons?
                file_icons = true,   -- show file icons?
                color_icons = true,  -- colorize file|git icons
                -- path_shorten   = 1,              -- 'true' or number, shorten path?
                -- executed command priority is 'cmd' (if exists)
                -- otherwise auto-detect prioritizes `fd`:`rg`:`find`
                -- default options are controlled by 'fd|rg|find|_opts'
                -- NOTE: 'find -printf' requires GNU find
                -- cmd            = "find . -type f -printf '%P\n'",
                find_opts = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
                rg_opts = "--color=never --files --hidden --follow -g '!.git'",
                fd_opts = "--color=never --type f --hidden --follow --exclude .git",
                -- by default, cwd appears in the header only if {opts} contain a cwd
                -- parameter to a different folder than the current working directory
                -- uncomment if you wish to force display of the cwd as part of the
                -- query prompt string (fzf.vim style), header line or both
                -- show_cwd_prompt = true,
                -- show_cwd_header = true,
                actions = {
                    -- inherits from 'actions.files', here we can override
                    -- or set bind to 'false' to disable a default action
                    ["default"] = actions.file_edit,
                    -- custom actions are available too
                    ["ctrl-y"] = function(selected)
                        print(selected[1])
                    end,
                },
            },
            git = {
                files = {
                    prompt = "GitFiles❯ ",
                    cmd = "git ls-files --exclude-standard",
                    multiprocess = true, -- run command in a separate process
                    git_icons = true,    -- show git icons?
                    file_icons = true,   -- show file icons?
                    color_icons = true,  -- colorize file|git icons
                    -- force display the cwd header line regardles of your current working
                    -- directory can also be used to hide the header when not wanted
                    -- show_cwd_header = true
                },
                status = {
                    prompt = "GitStatus❯ ",
                    -- consider using `git status -su` if you wish to see
                    -- untracked files individually under their subfolders
                    cmd = "git status -s",
                    file_icons = true,
                    git_icons = true,
                    color_icons = true,
                    previewer = "git_diff",
                    -- uncomment if you wish to use git-delta as pager
                    --preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS",
                    actions = {
                        -- actions inherit from 'actions.files' and merge
                        ["right"] = { actions.git_unstage, actions.resume },
                        ["left"] = { actions.git_stage, actions.resume },
                    },
                },
                commits = {
                    prompt = "Commits❯ ",
                    cmd =
                    "git log --color --pretty=format:'%C(yellow)%h%Creset %Cgreen(%><(12)%cr%><|(12))%Creset %s %C(blue)<%an>%Creset'",
                    preview = "git show --pretty='%Cred%H%n%Cblue%an <%ae>%n%C(yellow)%cD%n%Cgreen%s' --color {1}",
                    -- uncomment if you wish to use git-delta as pager
                    --preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS",
                    actions = {
                        ["default"] = actions.git_checkout,
                    },
                },
                bcommits = {
                    prompt = "BCommits❯ ",
                    -- default preview shows a git diff vs the previous commit
                    -- if you prefer to see the entire commit you can use:
                    --   git show --color {1} --rotate-to=<file>
                    --   {1}    : commit SHA (fzf field index expression)
                    --   <file> : filepath placement within the commands
                    cmd =
                    "git log --color --pretty=format:'%C(yellow)%h%Creset %Cgreen(%><(12)%cr%><|(12))%Creset %s %C(blue)<%an>%Creset' <file>",
                    preview = "git diff --color {1}~1 {1} -- <file>",
                    -- uncomment if you wish to use git-delta as pager
                    --preview_pager = "delta --width=$FZF_PREVIEW_COLUMNS",
                    actions = {
                        ["default"] = actions.git_buf_edit,
                        ["ctrl-s"] = actions.git_buf_split,
                        ["ctrl-v"] = actions.git_buf_vsplit,
                        ["ctrl-t"] = actions.git_buf_tabedit,
                    },
                },
                branches = {
                    prompt = "Branches❯ ",
                    cmd = "git branch --all --color",
                    preview = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
                    actions = {
                        ["default"] = actions.git_switch,
                    },
                },
                stash = {
                    prompt = "Stash> ",
                    cmd = "git --no-pager stash list",
                    preview = "git --no-pager stash show --patch --color {1}",
                    actions = {
                        ["default"] = actions.git_stash_apply,
                        ["ctrl-x"] = { actions.git_stash_drop, actions.resume },
                    },
                    fzf_opts = {
                        ["--no-multi"] = "",
                        ["--delimiter"] = "'[:]'",
                    },
                },
                icons = {
                    ["M"] = { icon = "M", color = "yellow" },
                    ["D"] = { icon = "D", color = "red" },
                    ["A"] = { icon = "A", color = "green" },
                    ["R"] = { icon = "R", color = "yellow" },
                    ["C"] = { icon = "C", color = "yellow" },
                    ["T"] = { icon = "T", color = "magenta" },
                    ["?"] = { icon = "?", color = "magenta" },
                    -- override git icons?
                    -- ["M"]        = { icon = "★", color = "red" },
                    -- ["D"]        = { icon = "✗", color = "red" },
                    -- ["A"]        = { icon = "+", color = "green" },
                },
            },
            grep = {
                prompt = "Rg❯ ",
                input_prompt = "Grep For❯ ",
                multiprocess = true, -- run command in a separate process
                git_icons = true,    -- show git icons?
                file_icons = true,   -- show file icons?
                color_icons = true,  -- colorize file|git icons
                -- executed command priority is 'cmd' (if exists)
                -- otherwise auto-detect prioritizes `rg` over `grep`
                -- default options are controlled by 'rg|grep_opts'
                -- cmd            = "rg --vimgrep",
                grep_opts = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp",
                rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512",
                -- set to 'true' to always parse globs in both 'grep' and 'live_grep'
                -- search strings will be split using the 'glob_separator' and translated
                -- to '--iglob=' arguments, requires 'rg'
                -- can still be used when 'false' by calling 'live_grep_glob' directly
                rg_glob = false,           -- default to glob parsing?
                glob_flag = "--iglob",     -- for case sensitive globs use '--glob'
                glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
                -- advanced usage: for custom argument parsing define
                -- 'rg_glob_fn' to return a pair:
                --   first returned argument is the new search query
                --   second returned argument are addtional rg flags
                -- rg_glob_fn = function(query, opts)
                --   ...
                --   return new_query, flags
                -- end,
                actions = {
                    -- actions inherit from 'actions.files' and merge
                    -- this action toggles between 'grep' and 'live_grep'
                    ["ctrl-g"] = { actions.grep_lgrep },
                },
                no_header = false,   -- hide grep|cwd header?
                no_header_i = false, -- hide interactive header?
            },
            args = {
                prompt = "Args❯ ",
                files_only = true,
                -- actions inherit from 'actions.files' and merge
                actions = { ["ctrl-x"] = { actions.arg_del, actions.resume } },
            },
            oldfiles = {
                prompt = "History❯ ",
                cwd_only = false,
                stat_file = true,                -- verify files exist on disk
                include_current_session = false, -- include bufs from current session
            },
            buffers = {
                prompt = "Buffers❯ ",
                file_icons = true,    -- show file icons?
                color_icons = true,   -- colorize file|git icons
                sort_lastused = true, -- sort buffers() by last used
                actions = {
                    -- actions inherit from 'actions.buffers' and merge
                    -- by supplying a table of functions we're telling
                    -- fzf-lua to not close the fzf window, this way we
                    -- can resume the buffers picker on the same window
                    -- eliminating an otherwise unaesthetic win "flash"
                    ["ctrl-x"] = { actions.buf_del, actions.resume },
                },
            },
            tabs = {
                prompt = "Tabs❯ ",
                tab_title = "Tab",
                tab_marker = "<<",
                file_icons = true,  -- show file icons?
                color_icons = true, -- colorize file|git icons
                actions = {
                    -- actions inherit from 'actions.buffers' and merge
                    ["default"] = actions.buf_switch,
                    ["ctrl-x"] = { actions.buf_del, actions.resume },
                },
                fzf_opts = {
                    -- hide tabnr
                    ["--delimiter"] = "'[\\):]'",
                    ["--with-nth"] = "2..",
                },
            },
            lines = {
                previewer = "builtin",  -- set to 'false' to disable
                prompt = "Lines❯ ",
                show_unlisted = false,  -- exclude 'help' buffers
                no_term_buffers = true, -- exclude 'term' buffers
                fzf_opts = {
                    -- do not include bufnr in fuzzy matching
                    -- tiebreak by line no.
                    ["--delimiter"] = "'[\\]:]'",
                    ["--nth"] = "2..",
                    ["--tiebreak"] = "index",
                    ["--tabstop"] = "1",
                },
                -- actions inherit from 'actions.buffers' and merge
                actions = {
                    ["default"] = actions.buf_edit_or_qf,
                    ["alt-q"] = actions.buf_sel_to_qf,
                    ["alt-l"] = actions.buf_sel_to_ll,
                },
            },
            blines = {
                previewer = "builtin",   -- set to 'false' to disable
                prompt = "BLines❯ ",
                show_unlisted = true,    -- include 'help' buffers
                no_term_buffers = false, -- include 'term' buffers
                fzf_opts = {
                    -- hide filename, tiebreak by line no.
                    ["--delimiter"] = "'[\\]:]'",
                    ["--with-nth"] = "2..",
                    ["--tiebreak"] = "index",
                    ["--tabstop"] = "1",
                },
                -- actions inherit from 'actions.buffers' and merge
                actions = {
                    ["default"] = actions.buf_edit_or_qf,
                    ["alt-q"] = actions.buf_sel_to_qf,
                    ["alt-l"] = actions.buf_sel_to_ll,
                },
            },
            tags = {
                prompt = "Tags❯ ",
                ctags_file = "tags",
                multiprocess = true,
                file_icons = true,
                git_icons = true,
                color_icons = true,
                -- 'tags_live_grep' options, `rg` prioritizes over `grep`
                rg_opts = "--no-heading --color=always --smart-case",
                grep_opts = "--color=auto --perl-regexp",
                actions = {
                    -- actions inherit from 'actions.files' and merge
                    -- this action toggles between 'grep' and 'live_grep'
                    ["ctrl-g"] = { actions.grep_lgrep },
                },
                no_header = false,   -- hide grep|cwd header?
                no_header_i = false, -- hide interactive header?
            },
            btags = {
                prompt = "BTags❯ ",
                ctags_file = "tags",
                ctags_autogen = false, -- dynamically generate ctags each call
                multiprocess = true,
                file_icons = true,
                git_icons = true,
                color_icons = true,
                rg_opts = "--no-heading --color=always",
                grep_opts = "--color=auto --perl-regexp",
                fzf_opts = {
                    ["--delimiter"] = "'[\\]:]'",
                    ["--with-nth"] = "2..",
                    ["--tiebreak"] = "index",
                },
                -- actions inherit from 'actions.files'
            },
            colorschemes = {
                prompt = "Colorschemes❯ ",
                live_preview = true, -- apply the colorscheme on preview?
                actions = { ["default"] = actions.colorscheme },
                winopts = { height = 0.55, width = 0.30 },
                post_reset_cb = function()
                    -- reset statusline highlights after
                    -- a live_preview of the colorscheme
                    -- require('feline').reset_highlights()
                end,
            },
            quickfix = {
                file_icons = true,
                git_icons = true,
            },
            lsp = {
                prompt_postfix = "❯ ", -- will be appended to the LSP label
                -- to override use 'prompt' instead
                cwd_only = false, -- LSP/diagnostics for cwd only?
                async_or_timeout = 5000, -- timeout(ms) or 'true' for async calls
                file_icons = true,
                git_icons = false,
                -- settings for 'lsp_{document|workspace|lsp_live_workspace}_symbols'
                symbols = {
                    async_or_timeout = true, -- symbols are async by default
                    symbol_style = 1,        -- style for document/workspace symbols
                    -- false: disable,    1: icon+kind
                    --     2: icon only,  3: kind only
                    -- NOTE: icons are extracted from
                    -- vim.lsp.protocol.CompletionItemKind
                    -- colorize using nvim-cmp's CmpItemKindXXX highlights
                    -- can also be set to 'TS' for treesitter highlights ('TSProperty', etc)
                    -- or 'false' to disable highlighting
                    symbol_hl_prefix = "CmpItemKind",
                    -- additional symbol formatting, works with or without style
                    symbol_fmt = function(s)
                        return "[" .. s .. "]"
                    end,
                },
                code_actions = {
                    prompt = "Code Actions> ",
                    ui_select = true, -- use 'vim.ui.select'?
                    async_or_timeout = 5000,
                    winopts = {
                        row = 0.40,
                        height = 0.35,
                        width = 0.60,
                    },
                },
            },
            diagnostics = {
                prompt = "Diagnostics❯ ",
                cwd_only = false,
                file_icons = true,
                git_icons = false,
                diag_icons = true,
                icon_padding = "", -- add padding for wide diagnostics signs
                -- by default icons and highlights are extracted from 'DiagnosticSignXXX'
                -- and highlighted by a highlight group of the same name (which is usually
                -- set by your colorscheme, for more info see:
                --   :help DiagnosticSignHint'
                --   :help hl-DiagnosticSignHint'
                -- only uncomment below if you wish to override the signs/highlights
                -- define only text, texthl or both (':help sign_define()' for more info)
                -- signs = {
                --   ["Error"] = { text = "", texthl = "DiagnosticError" },
                --   ["Warn"]  = { text = "", texthl = "DiagnosticWarn" },
                --   ["Info"]  = { text = "", texthl = "DiagnosticInfo" },
                --   ["Hint"]  = { text = "", texthl = "DiagnosticHint" },
                -- },
                -- limit to specific severity, use either a string or num:
                --   1 or "hint"
                --   2 or "information"
                --   3 or "warning"
                --   4 or "error"
                -- severity_only:   keep any matching exact severity
                -- severity_limit:  keep any equal or more severe (lower)
                -- severity_bound:  keep any equal or less severe (higher)
            },
            -- uncomment to use the old help previewer which used a
            -- minimized help window to generate the help tag preview
            -- helptags = { previewer = "help_tags" },
            -- uncomment to use `man` command as native fzf previewer
            -- (instead of using a neovim floating window)
            -- manpages = { previewer = "man_native" },
            --
            -- optional override of file extension icon colors
            -- available colors (terminal):
            --    clear, bold, black, red, green, yellow
            --    blue, magenta, cyan, grey, dark_grey, white
            file_icon_colors = {
                ["sh"] = "green",
            },
            -- padding can help kitty term users with
            -- double-width icon rendering
            file_icon_padding = "",
            -- uncomment if your terminal/font does not support unicode character
            -- 'EN SPACE' (U+2002), the below sets it to 'NBSP' (U+00A0) instead
            -- nbsp = '\xc2\xa0',
        })
    end,
}

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
