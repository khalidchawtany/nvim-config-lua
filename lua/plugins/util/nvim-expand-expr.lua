return {
  "AllenDang/nvim-expand-expr",
  cmd = {"ExpandExpr"},
  keys = {
    {"<c-;>e", "<cmd>ExpandExpr<cr>", desc = "Expand Expression"}
  },
  config = function()
    vim.cmd [[ command! ExpandExpr lua require("expand_expr").expand()<cr> ]]
  end
}
