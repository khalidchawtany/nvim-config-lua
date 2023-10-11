return {

    "rcarriga/nvim-notify",
    lazy = true,
    config = function()
        require("notify").setup({
            max_width = 80,

            stages = "fade_in_slide_out",
            timeout = 1000,
            top_down = true
        })
    end,
}
