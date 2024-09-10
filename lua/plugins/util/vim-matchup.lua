return {
    "andymass/vim-matchup",
    event = "BufEnter",
    enabled = false,
    init = function()
        -- may set any options here
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
}
