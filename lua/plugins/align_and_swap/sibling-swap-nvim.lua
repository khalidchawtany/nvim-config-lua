return {
    "Wansmer/sibling-swap.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
        {
            "<c-.>",
            function()
                require("sibling-swap.swap").swap_with("right")
            end,
            desc = "Sibling (Swap right)"
        },
        {
            "<c-,>",
            function()
                require("sibling-swap.swap").swap_with("left")
            end,
            desc = "Sibling (Swap left)"
        },
        {
            "<leader>.",
            function()
                require("sibling-swap.swap").swap_with("right", true)
            end,
            desc = "Sibling (Swap right OP)"
        },
        {
            "<leader>,",
            function()
                require("sibling-swap.swap").swap_with("left", true)
            end,
            desc = "Sibling (Swap left OP)"
        }
    },
    config = function()
        require("sibling-swap").setup(
            {
                allowed_separators = {
                    ",",
                    ";",
                    "and",
                    "or",
                    "&&",
                    "&",
                    "||",
                    "|",
                    "==",
                    "===",
                    "!=",
                    "!==",
                    "-",
                    "+",
                    ["<"] = ">",
                    ["<="] = ">=",
                    [">"] = "<",
                    [">="] = "<="
                },
                use_default_keymaps = true,
                keymaps = {
                    ["<C-.>"] = "swap_with_right",
                    ["<C-,>"] = "swap_with_left",
                    ["<space>."] = "swap_with_right_with_opp",
                    ["<space>,"] = "swap_with_left_with_opp"
                },
                ignore_injected_langs = false
            }
        )
    end
}
