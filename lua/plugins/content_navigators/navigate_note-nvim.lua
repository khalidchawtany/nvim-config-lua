return {
    "you-n-g/navigate-note.nvim",
    keys = {
        {
            "<leader>nn",
            function()
                require("navigate-note.ops").add_file_line()
            end,
            mode = { "n" },
            desc = "Navigate Open",
        },
        {
            "<leader>na",
            function()
                require("navigate-note.ops").switch_nav_md()
            end,
            mode = { "n" },
            desc = "Navigate Add",
        },
    },

    opts = {
        filename = "nav.md", -- The filename of the markdown.
        width = 0.6,   -- The width of the popup window when jumping in the file with <tab>.
        keymaps = {
            nav_mode = {
                -- Navigation & Jumping
                next = "<tab>",
                prev = "<s-tab>",
                open = "<cr>",
                switch_back = "<bs>", -- Switch back to the previous file from `nav.md`.
                -- Editing
                append_link = "<m-p>", -- (P)aste will more align with the meaning.
                -- Mode switching
                jump_mode = "<m-l>", -- When we jump to a file, jump to the file only or jump to the exact file:line.
            },
            add = "<leader>na",
            open_nav = "<leader>nn", -- Switch to `nav.md`.
        },
        context_line_count = { -- It would be a total of `2 * context_line_count - 1` lines.
            tab = 8,
            vline = 2,
        },
    },
}
