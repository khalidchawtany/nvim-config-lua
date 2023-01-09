local M = {
  "steelsojka/headwind.nvim",
  keys = {
    {"<c-k><c-s>", ':lua require("headwind").buf_sort_tailwind_classes()<CR>', desc = "Headwind (Sort tailwind)"}
  }
}

M.config = function()
  require "headwind".setup {}
end

return M
