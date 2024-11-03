return {
    "ccaglak/namespace.nvim",
    -- "khalidchawtany/namespace.nvim",
    ft = { "php" },
    dependencies = {
        "ccaglak/phptools.nvim", -- optional
        "ccaglak/larago.nvim", -- optional
    },
    config = function()
        require("namespace").setup({
            ui = true,         -- default: true -- false only if you want to use your own ui
            cacheOnload = false, -- default: false -- cache composer.json on load
            dumpOnload = false, -- default: false -- dump composer.json on load
            sort = {
                on_save = false, -- default: false -- sorts on every search
                sort_type = "length_desc", -- default: natural -- seam like what pint is sorting
                --  ascending -- descending -- length_asc
                -- length_desc -- natural -- case_insensitive
            },
        })

        require("which-key").add({
            { "<leader>c",   group = "Code" },
            { "<leader>cp",  group = "PHP" },
            { "<leader>cpi", group = "Import" },
        })
        vim.api.nvim_create_autocmd({ "FileType" }, {
            pattern = "php",
            callback = function()
                vim.keymap.set(
                    "n",
                    "<leader>cpii",
                    "<cmd>Php classes<cr>",
                    { silent = true, buffer = true, desc = "PHP - Import all" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>cpio",
                    "<cmd>Php class<cr>",
                    { silent = true, buffer = true, desc = "PHP - Import" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>cpn",
                    "<cmd>Php namespace<cr>",
                    { silent = true, buffer = true, desc = "PHP - Namespace" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>cpis",
                    "<cmd>Php sort<cr>",
                    { silent = true, buffer = true, desc = "PHP - Sort" }
                )
            end,
        })
    end,
}
