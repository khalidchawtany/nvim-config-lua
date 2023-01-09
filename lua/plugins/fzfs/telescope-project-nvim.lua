return {
  "nvim-telescope/telescope-project.nvim",
  dependencies = {"nvim-telescope/telescope.nvim"},
  keys = {
    {"<c-p><c-\\>", "<cmd>lua require'telescope'.extensions.project.project{}<CR>", desc = "Telescope (Projects)"},
    {"<c-s><c-\\>", "<cmd>lua require'telescope'.extensions.project.project{}<CR>", desc = "Telescope (Projects)"}
  }
}
