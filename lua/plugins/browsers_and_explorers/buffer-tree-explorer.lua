return {
  "el-iot/buffer-tree-explorer",
  cmd = {"Tree"},
  keys = {
    {"<c-p>o", "<cmd>Tree<cr>", desc = "Buffer tree"}
  },
  init = function()
    vim.g.buffer_tree_explorer_compress = 1
  end
}
