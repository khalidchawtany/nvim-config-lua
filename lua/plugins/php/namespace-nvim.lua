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

        vim.api.nvim_create_autocmd({ "FileType" }, {
            pattern = "php",
            callback = function()
                vim.keymap.set( "n", "<localleader>]ii", "<cmd>Php classes<cr>", { silent  = true, buffer = true, desc = "Import all" })
                vim.keymap.set( "n", "<localleader>]io", "<cmd>Php class<cr>", { silent    = true, buffer = true, desc = "Import" })
                vim.keymap.set( "n", "<localleader>]n", "<cmd>Php namespace<cr>", { silent = true, buffer = true, desc = "Namespace" })
                vim.keymap.set( "n", "<localleader>]is", "<cmd>Php sort<cr>", { silent     = true, buffer = true, desc = "Sort" })
            end,
        })
    end,
}
