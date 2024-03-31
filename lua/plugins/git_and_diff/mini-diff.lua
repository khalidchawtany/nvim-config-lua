return {
    "echasnovski/mini.diff",
    version = false,
    keys = {
        {
            "t<c-d>",
            function()
                require("mini.diff").toggle(0)
            end,
            mode = { "n" },
            desc = "Mini Diff Toggle",
        },
        {
            "t<c-o>",
            function()
                require("mini.diff").toggle_overlay(0)
            end,
            mode = { "n" },
            desc = "Mini Diff Overlay Toggle",
        },
    },
    config = function()
        require("mini.diff").setup(
        -- No need to copy this inside `setup()`. Will be used automatically.
            {
                -- Options for how hunks are visualized
                view = {
                    -- Visualization style. Possible values are 'sign' and 'number'.
                    style = vim.o.number and "number" or "sign",

                    -- Signs used for hunks with 'sign' view
                    signs = { add = "▒", change = "▒", delete = "▒" },

                    -- Priority of used visualization extmarks
                    priority = vim.highlight.priorities.user - 1,
                },

                -- Source for how reference text is computed/updated/etc
                -- Uses content from Git index by default
                source = nil,

                -- Delays (in ms) defining asynchronous processes
                delay = {
                    -- How much to wait before update following every text change
                    text_change = 200,
                },

                -- Module mappings. Use `''` (empty string) to disable one.
                mappings = {
                    -- Apply hunks inside a visual/operator region
                    apply = "gh",

                    -- Reset hunks inside a visual/operator region
                    reset = "gH",

                    -- Hunk range textobject to be used inside operator
                    textobject = "gh",

                    -- Go to hunk range in corresponding direction
                    goto_first = "[H",
                    goto_prev = "[h",
                    goto_next = "]h",
                    goto_last = "]H",
                },

                -- Various options
                options = {
                    -- Diff algorithm. See `:h vim.diff()`.
                    algorithm = "histogram",

                    -- Whether to use "indent heuristic". See `:h vim.diff()`.
                    indent_heuristic = true,

                    -- The amount of second-stage diff to align lines (in Neovim>=0.9)
                    linematch = 60,
                },
            }
        )
    end,
}
