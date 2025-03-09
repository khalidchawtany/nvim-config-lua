return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    keys = {

        {
            "<localleader>.",
            function()
                require("snacks").scratch()
            end,
            desc = "Toggle Scratch Buffer",
        },
        {
            "<localleader>S",
            function()
                require("snacks").scratch.select()
            end,
            desc = "Select Scratch Buffer",
        },

        {
            "<leader>prp",
            function()
                require("snacks").picker.resume({ source = "smart" })
            end,
            desc = "Smart Picker Resume",
        },

        {
            "<leader>p\\",
            function()
                require('lua.plugins.fzfs.telescope-projects-nvim.telescope-projects-nvim-snacks-picker').project({})
                -- require("snacks").picker.projects()
            end,
            desc = "Projects Picker",
        },

        {
            "<leader>p<leader>",
            function()
                require("snacks").picker.pick()
            end,
            desc = "Smart Picker Resume",
        },

        {
            "<leader>pp",
            function()
                require("snacks").picker.pick({ source = "smart" })
            end,
            desc = "Smart Picker",
        },

        {
            "<leader>pg",
            function()
                require("snacks").picker.pick({ source = "git_status" })
            end,
            desc = "Smart Picker",
        },

        {
            "<leader>pb",
            function()
                require("snacks").picker.git_branches()
            end,
            desc = "Git Branches Picker",
        },

        {
            "<leader>pf",
            function()
                require("snacks").picker.pick({ source = "files" })
            end,
            desc = "Files Picker",
        },

        {
            "<leader>prp",
            function()
                require("snacks").picker.resume({ source = "smart" })
            end,
            desc = "Files Picker Resume",
        },
        {
            "<leader>po",
            function()
                require("snacks").picker.pick({ source = "buffers" })
            end,
            desc = "Buffer Picker",
        },
        {
            "<leader>p<cr>",
            function()
                require("snacks").picker.pick({ source = "commands" })
            end,
            desc = "Commands Picker",
        },

        {
            "<leader>p;",
            function()
                require("snacks").picker.command_history({})
            end,
            desc = "Command History Picker",
        },

        {
            "<leader>pm",
            function()
                require("snacks").picker.keymaps()
            end,
            desc = "Keymaps Picker",
        },

        {
            "<leader>pk",
            function()
                require("snacks").picker.keymaps()
            end,
            desc = "Keymaps Picker",
        },

        {
            "<leader>pu",
            function()
                require("snacks").picker.pick({ source = "undo" })
            end,
            desc = "Undo Picker",
        },

        {
            "-s",
            function()
                require("snacks").picker.explorer()
            end,
            desc = "Snacks Explorer",
        },

        {
            "<leader>pj",
            function()
                require("snacks").picker.pick({ source = "grep" })
            end,
            desc = "Grep Picker",
        },

        {
            "<leader>gb",
            function()
                require("snacks").picker.git_branches()
            end,
            desc = "Git Branches Picker",
        },

        {
            "<leader>un",
            function()
                require("snacks").notifier.hide()
            end,
            desc = "Dismiss All Notifications",
        },

        {
            "<leader>uu",
            function()
                require("snacks").notifier.show_history()
            end,
            desc = "Show All Notifications",
        },
        {
            "<leader>bd",
            function()
                require("snacks").bufdelete()
            end,
            desc = "Delete Buffer",
        },
        {
            "<leader>gg",
            function()
                require("snacks").lazygit()
            end,
            desc = "Lazygit",
        },
        {
            "<leader>gb",
            function()
                require("snacks").git.blame_line()
            end,
            desc = "Git Blame Line",
        },
        {
            "<leader>gB",
            function()
                require("snacks").gitbrowse()
            end,
            desc = "Git Browse",
        },
        {
            "<leader>gf",
            function()
                require("snacks").lazygit.log_file()
            end,
            desc = "Lazygit Current File History",
        },
        {
            "<leader>gll",
            function()
                require("snacks").lazygit.log()
            end,
            desc = "Lazygit Log (cwd)",
        },
        {
            "<leader>cR",
            function()
                require("snacks").rename()
            end,
            desc = "Rename File",
        },
        {
            "<c-/>",
            function()
                -- require("snacks").terminal()
                require("snacks").terminal()
            end,
            desc = "Toggle Terminal",
        },
        {
            "<leader>pls",
            function()
                -- require("snacks").terminal()
                require("snacks").terminal("lazysql mysql://root:root@localhost")
            end,
            desc = "which_key_ignore",
        },
        {
            "]]",
            function()
                require("snacks").words.jump(vim.v.count1)
            end,
            desc = "Next Reference",
        },
        {
            "[[",
            function()
                require("snacks").words.jump(-vim.v.count1)
            end,
            desc = "Prev Reference",
        },
        {
            "<leader>N",
            desc = "Neovim News",
            function()
                require("snacks").win({
                    file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                    width = 0.9,
                    height = 0.9,
                    wo = {
                        spell = false,
                        wrap = false,
                        signcolumn = "yes",
                        statuscolumn = " ",
                        conceallevel = 3,
                    },
                })
            end,
        },
    },
    ---@type snacks.Config
    opts = {

        init = {
            -- your init configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        projects = {
            finder = "recent_projects",
            format = "file",
            dev = { "~/Projects/PHP/", "~/Sites" },
            confirm = "load_session",
            patterns = {".git", "_darcs", ".hg", ".bzr", ".svn", "package.json", "Makefile" },
            win = {
                preview = { minimal = true },
                input = {
                    keys = {
                        -- every action will always first change the cwd to the project
                        ["<c-e>"] = { { "cd", "picker_explorer" }, mode = { "n", "i" } },
                        ["<c-f>"] = { { "cd", "picker_files" }, mode = { "n", "i" } },
                        ["<c-g>"] = { { "cd", "picker_grep" }, mode = { "n", "i" } },
                        ["<c-r>"] = { { "cd", "picker_recent" }, mode = { "n", "i" } },
                        ["<c-w>"] = { { "cd" }, mode = { "n", "i" } },
                    },
                },
            },
        },

        picker = {
            layout = "my_telescope_top",
            layouts = {
                my_telescope_top = {
                    layout = {
                        box = "horizontal",
                        backdrop = false,
                        width = 0.8,
                        height = 0.9,
                        border = "none",
                        {
                            box = "vertical",
                            {
                                win = "input",
                                height = 1,
                                border = "none",
                                title = "{title} {live} {flags}",
                                title_pos = "center",
                            },
                            { win = "list", title = " Results ", title_pos = "center", border = "none" },
                        },
                        {
                            win = "preview",
                            title = "{preview:Preview}",
                            width = 0.45,
                            border = "none",
                            title_pos = "center",
                        },
                    },
                },
            },
            ui_select = true, -- replace `vim.ui.select` with the snacks picker
            win = {
                -- input window
                input = {
                    keys = {

                        ["<c-a>"] = function(picker)
                            -- move cursor to start of text
                            vim.api.nvim_feedkeys("0", "n", false)
                        end,
                        -- ["<c-a>"] = {
                        -- 	function()
                        -- 		vim.api.nvim_feedkeys('0', 'n', false)
                        --
                        -- 	end,
                        -- 	mode = { "n", "i" },
                        -- },
                        ["<c-space>"] = { "select_all", mode = { "n", "i" } },
                        ["x"] = { "copy_recursive", mode = { "n" } },
                    },
                },
            },

            -- require('snacks').setup({picker = {actions = {  recursive_copy = function(x,y) dd(x) end }}})
            actions = {
                copy_recursive = function(picker)
                    local items = picker:items()
                    for _, item in ipairs(items) do
                        if item.dir then
                            dd(item.file)
                        else
                        end
                    end
                    -- for _, item in ipairs(picker:selected({ fallback = true })) do
                    --     dd(item)
                    --     -- picker.list:unselect(item)
                    -- end

                    -- picker:close()
                    -- picker:hide()
                    -- picker:action("edit")
                    -- Snacks.explorer({focus = "input"})
                    -- check for Snacks.picker.current
                    -- So then you can do Snacks.picker.current.input.win:focus()
                    -- Snacks.picker.get({source = "explorer"}) -- returns a LIST of pickers, so you'll need to get `[1]`
                end,
            },
        },
        lazygit = {
            -- your lazygit configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        scratch = {
            -- your scratch configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },

        bigfile = {
            notify = true,   -- show notification when big file detected
            size = 1.5 * 1024 * 1024, -- 1.5MB
            -- Enable or disable features when big file detected
            ---@param ctx {buf: number, ft:string}
            setup = function(ctx)
                vim.cmd([[NoMatchParen]])
                require("snacks").util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
                vim.b.minianimate_disable = true
                vim.schedule(function()
                    vim.bo[ctx.buf].syntax = ctx.ft
                end)
            end,
        },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        styles = {
            notification = {
                border = "rounded",
                zindex = 100,
                ft = "markdown",
                wo = {
                    winblend = 5,
                    wrap = true,
                    conceallevel = 2,
                },
                bo = { filetype = "snacks_notif" },
                History = {
                    border = "rounded",
                    zindex = 100,
                    width = 0.9,
                    height = 0.9,
                    minimal = false,
                    title = "Notification History",
                    title_pos = "center",
                    ft = "markdown",
                    bo = { filetype = "snacks_notif_history" },
                    wo = {
                        winhighlight = "Normal:SnacksNotifierHistory",
                        winblend = 5,
                        wrap = true,
                        conceallevel = 2,
                    },
                    keys = { q = "close" },
                },
            },
        },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    require("snacks").debug.inspect(...)
                end
                _G.bt = function()
                    require("snacks").debug.backtrace()
                end
                vim.print = _G.dd -- Override print to use snacks for `:=` command

                -- Create some toggle mappings
                require("snacks").toggle.option("spell", { name = "Spelling" }):map("<leader>us")
                require("snacks").toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                require("snacks").toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                require("snacks").toggle.diagnostics():map("<leader>ud")
                require("snacks").toggle.line_number():map("<leader>ul")
                require("snacks").toggle
                    .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
                    :map("<leader>uc")
                require("snacks").toggle.treesitter():map("<leader>uT")
                require("snacks").toggle
                    .option("background", { off = "light", on = "dark", name = "Dark Background" })
                    :map("<leader>ub")
                require("snacks").toggle.inlay_hints():map("<leader>uh")
            end,
        })
    end,
}
