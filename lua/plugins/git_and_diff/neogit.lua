return {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },

    keys = {
        { "<leader>g<leader>", "<cmd>Neogit<cr>", desc = "Neogit" },
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
