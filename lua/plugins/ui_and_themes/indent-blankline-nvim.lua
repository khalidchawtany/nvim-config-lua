return {
    "lukas-reineke/indent-blankline.nvim",
    cmd = {
        "IBLToggle",
        "IBLEnable",
        "IBLDisable",
        "IBLToggleScope",
        "IBLEnableScope",
        "IBLDisableScope",
    },

    keys = {
        {
            "coI",
            function()
                dump("Indent blankline toggle")
            end,
            desc = "Toggle Indent Blankline",
        },
    },
    -- branch = 'lua',
    -- event = "BufRead",
    config = function()
        vim.g.indent_blankline_enabled = false
        require("ibl").setup({
            debounce = 250,
            indent = { char = "│" },
            whitespace = { highlight = { "Whitespace", "NonText" } },
            -- scope = { exclude = { "git" } },
            -- use_treesitter_scope = true,
            -- char = "▎",
            -- -- char = "│",
            -- use_treesitter = true,
            -- show_first_indent_level = false,
            -- show_end_of_line = true,
            -- show_current_context = true,
            -- show_current_context_start = true,
            -- show_trailing_blankline_indent = false,
            -- -- for blank lines use space as list char
            -- space_char_blankline = " ",
            -- highlight_list = { "Identifier" },
            -- space_char_highlight_list = {},
            -- indent_level = 10,
            -- -- max_indent_increase = 1
        })
    end,
}
