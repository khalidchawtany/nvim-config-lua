return {
    "edluffy/hologram.nvim",
    config = function()
        require("hologram").setup()
    end,
    -- cond = false and os.getenv("VAR_IS_KITTY_TERM") == "true" or os.getenv("$TERM_PROGRAM") == "WezTerm" ,
    cond = false,

    -- rocks = { "magick" }
}
