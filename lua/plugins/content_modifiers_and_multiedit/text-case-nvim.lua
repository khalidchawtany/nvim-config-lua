return {
    "johmsalas/text-case.nvim",
    cmd = {"Subs"},
    keys = {
        {
            "<c-s>ct",
            function()
                vim.cmd([[TextCaseOpenTelescope]])
            end,
            mode = { "n", "v" },
            desc = "Telescope (Textcase)",
        },

        {
            "crt",
            function()
                require("textcase").current_word("to_title_case")
            end,
            mode = { "n", "v" },
            desc = "Title Case",
        },
    },

    config = function()
        require("textcase").setup({
            -- prefix = "cr",
        })
        require("telescope").load_extension("textcase")
    end,
}
