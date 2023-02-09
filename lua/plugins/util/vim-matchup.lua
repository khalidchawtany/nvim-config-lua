return {
  "andymass/vim-matchup",
  event = "VimEnter",
  setup = function()
    -- may set any options here
    vim.g.matchup_matchparen_offscreen = {method = "popup"}
  end
}
