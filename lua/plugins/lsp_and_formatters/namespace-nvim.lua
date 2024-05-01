return {
    "ccaglak/namespace.nvim",
    ft = { "php" },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("which-key").register({
            mode = { "n" },
            ["<leader>c"] = { name = "+Code" },
            ["<leader>cp"] = { name = "+PHP" },
            ["<leader>cpi"] = { name = "+Import" },
        })
        vim.api.nvim_create_autocmd({ "FileType" }, {
            pattern = "php",
            callback = function()
                vim.keymap.set(
                    "n",
                    "<leader>cpii",
                    "<cmd>GetClasses<CR>",
                    { silent = true, buffer = true, desc = "PHP - Import all" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>cpio",
                    "<cmd>GetClass<CR>",
                    { silent = true, buffer = true, desc = "PHP - Import" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>cpia",
                    "<cmd>ClassAs<CR>",
                    { silent = true, buffer = true, desc = "PHP - Import As" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>cpn",
                    "<cmd>Namespace<CR>",
                    { silent = true, buffer = true, desc = "PHP - Namespace" }
                )
            end,
        })
    end,
}
