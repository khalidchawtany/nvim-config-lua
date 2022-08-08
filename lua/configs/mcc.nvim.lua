local M = {}
M.config = function()
  require("mcc").setup(
    {
      php = {
        {"-", "->", "--"},
        {":", "::", ":"},
      }
    }
  )
end
return M
