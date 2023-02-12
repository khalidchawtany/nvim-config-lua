return {
  "mcookly/rosetta.nvim",
  cmd = {"BidiEnable"},
  config = function()
    require("rosetta").setup()
  end
}
