return {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim", -- optional
    event = "VeryLazy",
    keys = {
        {
            "<leader>sse",
            function()
                require("scissors").editSnippet()
            end,
            desc = "Edit Snippet",
        },
        {
            "<leader>ssa",
            function()
                require("scissors").addNewSnippet()
            end,
            mode = { "x", "n" },
            desc = "Add Snippet",
        },
    },

    opts = {
        snippetDir = "/Users/juju/.config/nvim/vscode_snippets/",
    },
}
