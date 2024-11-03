return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        -- "echasnovski/mini.nvim", -- if you use the mini.nvim suite
    },

    ft = {
        "markdown",
        "Avante",
    },
    cmd = { "RenderMarkdown" },
    opts = {

        file_types = {
            "markdown",
            "Avante",
        },
    },
}
