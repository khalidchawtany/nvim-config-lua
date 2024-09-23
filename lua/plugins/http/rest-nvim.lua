return {
    "lima1909/resty.nvim",
    cmd = { "Resty" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        vim.keymap.set( { "n", "v" }, "<leader>rr", ":Resty run<CR>", { desc = "[R]esty [R]un request under the cursor" })
        vim.keymap.set({ "n", "v" }, "<leader>rv", ":Resty favorite<CR>", { desc = "[R]esty [V]iew favorites" })
    end,
}

