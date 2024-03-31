return {
    "DreamMaoMao/yazi.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },

    cmd = { "Yazi" },

    keys = {
        { "-y", "<cmd>Yazi<CR>", desc = "Toggle Yazi" },
    },
}
