return {
    "OXY2DEV/markview.nvim",
    -- ft = "markdown",
    cmd = { "Markview" },

    dependencies = {
        -- You may not need this if you don't lazy load
        -- Or if the parsers are in your $RUNTIMEPATH
        "nvim-treesitter/nvim-treesitter",

        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        require("markview").setup()
    end,
}
