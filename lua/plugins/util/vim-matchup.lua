return {
  "andymass/vim-matchup",
  event = "BufEnter",
  setup = function()
    -- may set any options here
    vim.g.matchup_matchparen_offscreen = {method = "popup"}
  end
}
