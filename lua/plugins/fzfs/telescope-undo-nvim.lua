return {
  "debugloop/telescope-undo.nvim",
  dependencies = {"nvim-telescope/telescope.nvim"},
  keys = {
    {
      "<c-s><c-r>",
      function()
        require("telescope-undo")()
      end,
      desc = "Telescope (Undotree)"
    }
  },
  config = function()
    require("telescope").load_extension("undo")
  end
}
