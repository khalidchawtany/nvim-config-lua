return {
    "adibhanna/laravel.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
    },
    -- cmd = { "Artisan", "Laravel*" },
    keys = {
        { "<leader>lla", ":LaravelArtisan<cr>", desc = "Laravel Artisan" },
        { "<leader>llr", ":LaravelRoute<cr>",   desc = "Laravel Routes" },
        { "<leader>llm", ":LaravelMake<cr>",    desc = "Laravel Make" },
    },
    event = { "VeryLazy" },
    config = function()
        require("laravel").setup()
    end,
}
