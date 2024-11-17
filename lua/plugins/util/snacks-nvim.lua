return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
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
    keys = {

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
            "<leader>gl",
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
                require("snacks").terminal()
            end,
            desc = "Toggle Terminal",
        },
        {
            "<c-_>",
            function()
                require("snacks").terminal()
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