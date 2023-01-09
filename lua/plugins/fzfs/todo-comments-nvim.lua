return {
"folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  cmd = {
    "TodoQuickFix",
    "TodoLocList",
    "TodoTrouble",
    "TodoTelescope"
  },
  keys = {
    {"<c-s><c-t>", "<cmd>TodoTelescope<cr>", desc = "Telescope (Todo)"}
  },
  config = function()
    require("todo-comments").setup {}
  end
}
