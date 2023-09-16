return {
    "johmsalas/text-case.nvim",
    cmd = {},
    keys = {
        {
            "<c-s>T",
            function()
                vim.cmd([[TextCaseOpenTelescope]])
            end,
            mode = { "n", "v" },
            { desc = "Telescope (Textcase)" },
        },

        {
            "<leader>crt",
            function()
                require('textcase').current_word('to_title_case')
            end,
            mode = { "n", "v" },
            { desc = "Telescope (Textcase)" },
        },
    },

    config = function()
        require("textcase").setup({})
        require("telescope").load_extension("textcase")
    end,
}
