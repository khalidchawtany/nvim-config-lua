return { -- lazy
    "ccaglak/phptools.nvim",
    -- keys = {
    --     { "<leader>lm", "<cmd>PhpMethod<cr>" },
    --     { "<leader>lc", "<cmd>PhpClass<cr>" },
    --     { "<leader>ls", "<cmd>PhpScripts<cr>" },
    --     { "<leader>ln", "<cmd>PhpNamespace<cr>" },
    --     { "<leader>lg", "<cmd>PhpGetSet<cr>" },
    --     { "<leader>lf", "<cmd>PhpCreate<cr>" },
    -- },
    ft = { "php" },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("phptools").setup({
            ui = false, -- if you have stevearc/dressing.nvim or something similar keep it false or else true
        })
        vim.keymap.set("v", "<leader>lr", ":PhpRefactor<cr>")

        vim.api.nvim_create_autocmd({ "FileType" }, {
            pattern = "php",
            callback = function()
                vim.keymap.set(
                    "v",
                    "<leader>cpr",
                    "<cmd>PhpRefactor<CR>",
                    { silent = true, buffer = true, desc = "PHP - Import all" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>cpm",
                    "<cmd>PhpMethod<CR>",
                    { silent = true, buffer = true, desc = "PHP - Class" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>cpss",
                    "<cmd>PhpScripts<CR>",
                    { silent = true, buffer = true, desc = "PHP - Scripts" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>cpn",
                    "<cmd>PhpNamespace<CR>",
                    { silent = true, buffer = true, desc = "PHP - Namespace" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>cpg",
                    "<cmd>PhpGetSet<CR>",
                    { silent = true, buffer = true, desc = "PHP - GetSet" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>cpc",
                    "<cmd>PhpCreate<CR>",
                    { silent = true, buffer = true, desc = "PHP - Create" }
                )
            end,
        })
    end,
}
