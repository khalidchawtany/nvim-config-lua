return {
    "samuelsimoes/vim-drawer",
    cmd = { "VimDrawer" },
    keys = {
        {
            "<c-space><space>",
            function()
                vim.cmd("VimDrawer")
            end,
            mode = { "n" },
            desc = "VimDrawer",
        },
    },
    config = function()
        vim.g.vim_drawer_spaces = {
            { "model",        "models" },
            { "controller",   "controllers" },
            { "migration",    "updates" },
            { "model-f",      "models/*/*.[yaml|htm]$" },
            { "controller-f", "controllers/*/*.[yaml|htm]$" },
            -- { "view",      ".html.erb$" },
            -- { "asset",     ".[js|css]$" },
        }
    end,
}
