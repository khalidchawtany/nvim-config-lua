return {
    "benfowler/telescope-luasnip.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    lazy = true,
    keys = {
        {
            "<c-s>L",
            function()
                require("telescope").extensions.luasnip.luasnip({})
            end,
            mode = { "n" },
            desc = "Telescope luasnip",
        },
    },
    config = function()
        require("telescope").load_extension("luasnip")
    end,
}
