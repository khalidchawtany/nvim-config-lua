return {
    "luk400/vim-jukit",
    cmd = { "JukitOut" },
    cond = os.getenv("VAR_IS_KITTY_TERM") == "true" and false,
}
