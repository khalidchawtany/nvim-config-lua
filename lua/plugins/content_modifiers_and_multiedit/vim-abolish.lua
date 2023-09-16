return {
    "tpope/vim-abolish",
    cmd = { "S", "Subvert", "Abolish" },
    keys = {
        "<Plug>(abolish-coerce)",
        "<Plug>(abolish-coerce-word)",
        "cr-",
        "cr.",
        -- "cr<space>",
        "crU",
        "cr_",
        "crc",
        "crk",
        "crm",
        "crp",
        "crs",
        -- "crt",
        "cru",
    },
    dependencies = {
        "smjonas/live-command.nvim",
    },
}
