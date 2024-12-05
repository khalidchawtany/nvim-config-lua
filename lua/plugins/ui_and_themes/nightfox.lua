return {
    "EdenEast/nightfox.nvim",
    event = {
        "VeryLazy",
        "ColorScheme nightfox*",
    },
    config = function()
        require("nightfox").setup({
            options = {
                styles = {
                    comments = "italic",
                    keywords = "bold",
                    types = "italic,bold",
                },
            },
        })
    end,
}
