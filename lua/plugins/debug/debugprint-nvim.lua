return {
    "andrewferrier/debugprint.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    keys = {
        {
            "<leader>cddk",
            function()
                return require("debugprint").debugprint({ above = true })
            end,
            expr = true,
            desc = "Debugprint Above",
        },
        {
            "<leader>cddj",
            function()
                return require("debugprint").debugprint()
            end,
            desc = "Debugprint Belog",
            expr = true,
        },
        {
            "<leader>cddp",
            function()
                return require("debugprint").debugprint({ variable = true })
            end,
            expr = true,
            desc = "Debugprint Var",
        },
        {
            "<leader>cddP",
            function()
                return require("debugprint").debugprint({ variable = true, above = true })
            end,
            expr = true,
            desc = "Debugprint Var Above",
        },
        {
            "<Leader>cddr",
            function()
                return require("debugprint").deleteprints()
            end,
            expr = true,
            desc = "Debugprint Delete",
        },
    },
    config = function()
        local vue = {
            left = 'console.log(`',
            right = '`)',
            mid_var = "${",
            right_var = '}`)',
        }

        -- require("debugprint").add_custom_filetypes({vue})

        require("debugprint").setup({
            create_keymaps = true,
            create_commands = true,
            filetypes = { ["vue"] = vue },
        })
    end,
}
