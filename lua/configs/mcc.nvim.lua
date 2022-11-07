local M = {disable = true}
M.config = function()
  require("mcc").setup(
    {
      php = {
        -- {"-", "->", "--"},
        -- {":", "::", ":"},
      }
    }
  )
end
return M
