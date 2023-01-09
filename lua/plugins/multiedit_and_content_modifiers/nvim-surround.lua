return {
  "kylechui/nvim-surround",
  keys = {
    {"ys", "ds", "ds", {"S", mode = "v"}, {"<c-g>s", mode = "i"}}
  },
  config = function()
    require("nvim-surround").setup({})
  end
}
