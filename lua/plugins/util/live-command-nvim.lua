return {
    "smjonas/live-command.nvim", -- make commands previewable
    -- event = "VeryLazy",
    -- cmd = { "Norm", "Reg", "G", "SS" },
    config = function()
        require("live-command").setup({
            defaults = {
                enable_highlighting = true,
                inline_highlighting = true,
                hl_groups = {
                    insertion = "DiffAdd",
                    deletion = "DiffDelete",
                    change = "DiffChange",
                },
            },
            commands = {
                SS = { cmd = "Subvert" },
                Norm = { cmd = "norm" },
                G = { cmd = "g" },
            },
        })
    end,
}
