return {
    "adibhanna/laravel.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
    },
    -- cmd = { "Artisan", "Composer", "Laravel*" },
    -- cmd = { "Artisan", "Laravel*" },
    ft = { "php" },
    -- event = { "VeryLazy" },
    config = function()
        require("laravel").setup({
            notifications = true,   -- Enable/disable Laravel.nvim notifications (default: true)
            debug = false,          -- Enable/disable debug error notifications (default: false)
            keymaps = false,        -- Enable/disable Laravel.nvim keymaps (default: true)
            sail = {
                enabled = false,    -- Enable/disable Laravel Sail integration (default: true)
                auto_detect = false, -- Auto-detect Sail usage in project (default: true)
            },
        })

        require("which-key").add({
            { "<localleader>]r", group = "Refactor" },
            { "<localleader>]g", group = "Generate" },
            { "<localleader>]i", group = "Insert" },
            { "<localleader>]e", group = "Extract" },
            { "<localleader>]c", group = "Change" },
            { "<localleader>]x", group = "Execute" },
        })

        vim.api.nvim_create_autocmd({ "FileType" }, {
            pattern = "php",
            callback = function()
                vim.keymap.set("n", "<localleader>]xa", ":LaravelArtisan<cr>",
                    { silent = true, buffer = true, desc = "Artisan" })
                vim.keymap.set("n", "<localleader>]xr", ":LaravelRoute<cr>",
                    { silent = true, buffer = true, desc = "List Routes" })
                vim.keymap.set("n", "<localleader>]xm", ":LaravelMake<cr>",
                    { silent = true, buffer = true, desc = "Artisan Make" })
            end,
        })
    end,
}
