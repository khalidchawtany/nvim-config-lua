return {
    "SmiteshP/nvim-gps", -- allow to get context and put in winbar to the left or virtual text
    enabled = false,
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-gps").setup()
    end
}
