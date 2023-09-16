return {
    "smjonas/live-command.nvim", -- make commands previewable
    cmd = { "Norm", "Reg", "G", "SS" },
    config = function()
        require("live-command").setup({
            defaults = {
                enable_highlighting = false,
                inline_highlighting = false,
                hl_groups = {
                    insertion = "DiffAdd",
                    deletion = "DiffDelete",
                    change = "DiffChange",
                },
            },
            debug = false,
            commands = {
                SS = { cmd = "Subvert" }, -- must be defined before we import vim-abolish
                Norm = {
                    cmd = "norm",
                    hl_range = { kind = "visible" },
                },
                Reg = {
                    cmd = "norm",
                    -- This will transform ":5Reg a" into ":norm 5@a"
                    args = function(opts)
                        return (opts.count == -1 and "" or opts.count) .. "@" .. opts.args
                    end,
                    -- range = ""
                    hl_range = { kind = "visible" },
                },
                G = { cmd = "g", hl_range = { 1, -1, kind = "absolute" } },
            },
        })
    end,
}
