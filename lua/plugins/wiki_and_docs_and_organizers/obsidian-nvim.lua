return {
    "epwalsh/obsidian.nvim",
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
        workspaces = {
            {
                name = "personal",
                path = "/Users/juju/ownCloud/MyObsidianNotes",
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
    },
}
