return {
    "obsidian-nvim/obsidian.nvim",
    -- version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    cmd = {
        "ObsidianOpen",
        "ObsidianNew",
        "ObsidianQuickSwitch",
        "ObsidianFollowLink",
        "ObsidianBacklinks",
        "ObsidianTags",
        "ObsidianToday",
        "ObsidianYesterday",
        "ObsidianTomorrow",
        "ObsidianDailies",
        "ObsidianTemplate",
        "ObsidianSearch",
        "ObsidianLink",
        "ObsidianLinkNew",
        "ObsidianLinks",
        "ObsidianExtractNote",
        "ObsidianWorkspace",
        "ObsidianPasteImg",
        "ObsidianRename",
        "ObsidianToggleCheckbox",
    },
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    keys = {
        { "<leader>ooo", "<cmd>ObsidianOpen<cr>",           desc = "Open (Obsidian)" },
        { "<leader>oos", "<cmd>ObsidianSearch<cr>",         desc = "Search (Obsidian)" },
        { "<leader>ood", "<cmd>ObsidianDailies<cr>",        desc = "Dailies (Obsidian)" },
        { "<leader>ooe", "<cmd>ObsidianExtractNote<cr>",    desc = "Extract (Obsidian)" },
        { "<leader>oow", "<cmd>ObsidianWorkspace<cr>",      desc = "Workspace (Obsidian)" },
        { "<leader>oor", "<cmd>ObsidianRename<cr>",         desc = "Rename (Obsidian)" },
        { "<leader>oot", "<cmd>ObsidianToggleCheckbox<cr>", desc = "Toggle Checkbox (Obsidian)" },
        {
            "<leader>ooS",
            "<cmd>call jobstart('open -a /Applications/Obsidian.app --background \"obsidian://advanced-uri?vault=MyObsidianNotes&commandid=remotely-save%253Astart-sync\"', {})<cr>",
            desc = "Sync (Obsidian)",
        },
        {
            "<leader>ooR",
            "<cmd>call jobstart('/Users/juju/Library/Mobile\\ Documents/iCloud~md~obsidian/Documents/MyObsidianNotes/.code/sync_tasks.sh', {})<cr>",
            desc = "Sync Reminders (Obsidian)",
        },
    },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
        completion = {
            -- Enables completion using nvim_cmp
            nvim_cmp = false,
            -- Enables completion using blink.cmp
            blink = true,
            -- Trigger completion at 2 chars.
            min_chars = 2,
        },

        ui = {
            enable = true,
            checkboxes = {
                -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
                [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                ["x"] = { char = "", hl_group = "ObsidianDone" },
                [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                ["!"] = { char = "", hl_group = "ObsidianImportant" },
                -- Replace the above with this if you don't have a patched font:
                -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
                -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

                -- You can also add more custom ones...
            },
            -- Use bullet marks for non-checkbox lists.
            bullets = { char = "•", hl_group = "ObsidianBullet" },
            external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            -- Replace the above with this if you don't have a patched font:
            -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            reference_text = { hl_group = "ObsidianRefText" },
            highlight_text = { hl_group = "ObsidianHighlightText" },
            tags = { hl_group = "ObsidianTag" },
            block_ids = { hl_group = "ObsidianBlockID" },
            hl_groups = {
                -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                ObsidianTodo = { bold = true, fg = "#f78c6c" },
                ObsidianDone = { bold = true, fg = "#89ddff" },
                ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                ObsidianTilde = { bold = true, fg = "#ff5370" },
                ObsidianImportant = { bold = true, fg = "#d73128" },
                ObsidianBullet = { bold = true, fg = "#89ddff" },
                ObsidianRefText = { underline = true, fg = "#c792ea" },
                ObsidianExtLinkIcon = { fg = "#c792ea" },
                ObsidianTag = { italic = true, fg = "#89ddff" },
                ObsidianBlockID = { italic = true, fg = "#89ddff" },
                ObsidianHighlightText = { bg = "#75662e" },
            },
        },
        workspaces = {
            {
                name = "personal",
                path = "/Users/juju/Nextcloud/MyObsidianNotes",
            },
            -- {
            --     name = "work",
            --     path = "~/vaults/work",
            -- },
        },
        templates = {
            folder = "Meta/Templates",
            date_format = "%Y-%m-%d-%a",
            time_format = "%H:%M",
        },

        daily_notes = {
            -- Optional, if you keep daily notes in a separate directory.
            folder = "notes/dailies",
            -- Optional, if you want to change the date format for the ID of daily notes.
            date_format = "%Y/%Y-%m/%Y-%m-%d",
            -- Optional, if you want to change the date format of the default alias of daily notes.
            alias_format = "%B %-d, %Y",
            -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
            template = "DailyNoteTemplate.md",
        },
        -- see below for full list of options 👇
        -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
        -- way then set 'mappings = {}'.
        mappings = {
            -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
            ["gf"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
            -- Toggle check-boxes.
            ["<leader>ch"] = {
                action = function()
                    return require("obsidian").util.toggle_checkbox()
                end,
                opts = { buffer = true },
            },
            -- Smart action depending on context: follow link, show notes with tag, or toggle checkbox.
            ["<cr>"] = {
                action = function()
                    return require("obsidian").util.smart_action()
                end,
                opts = { buffer = true, expr = true },
            }
        },
    },
}
