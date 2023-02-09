return {
  "miversen33/netman.nvim", -- allow ftp and docker
  requires = {"nvim-neo-tree/neo-tree.nvim"},
  branch = "v1.1",
  cmd = {"NmloadProvider"},
  config = function()
    require("netman")
  end
}