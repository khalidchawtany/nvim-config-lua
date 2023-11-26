return {
    "edluffy/hologram.nvim",
    config = function()
        require("hologram").setup()
    end,
    cond = os.getenv("VAR_IS_KITTY_TERM") == "true" and false,

    -- rocks = { "magick" }
}
