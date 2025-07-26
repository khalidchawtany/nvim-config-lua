return {
    "mizlan/iswap.nvim",
    cmd = { "ISwap" },
    keys = {
        { "swo", "<cmd>ISwapNode<cr>",          desc = "ISwap Node" },
        { "swO", "<cmd>ISwapNodeWith<cr>",      desc = "ISwap Node With" },
        { "swh", "<cmd>ISwapNodeWithLeft<cr>",  desc = "ISwap Node With Left" },
        { "swl", "<cmd>ISwapNodeWithRight<cr>", desc = "ISwap Node With Right" },
    },
    config = function()
        require("iswap").setup {
            -- The keys that will be used as a selection, in order
            -- ('asdfghjklqwertyuiopzxcvbnm' by default)
            keys = "qwertyuiop",
            -- Grey out the rest of the text when making a selection
            -- (enabled by default)
            grey = "disable",
            -- Highlight group for the sniping value (asdf etc.)
            -- default 'Search'
            hl_snipe = "ErrorMsg",
            -- wighlight group for the visual selection of terms
            -- default 'Visual'
            hl_selection = "WarningMsg",
            -- Highlight group for the greyed background
            -- default 'Comment'
            hl_grey = "LineNr"
        }
    end
}
