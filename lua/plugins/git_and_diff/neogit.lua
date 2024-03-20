return {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },

    keys = {
        { "<leader>gn", "<cmd>Neogit<cr>", desc = "Neogit" },
        { "<leader>gf", "<cmd>Neogit kind=floating<cr>", desc = "Neogit Float" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration

        -- Only one of these is needed, not both.
        "nvim-telescope/telescope.nvim", -- optional
        "ibhagwan/fzf-lua",        -- optional
    },
    config = true,
}
