local M = {
  module = "nvim-autopairs",
  event = {"InsertEnter"}
}

M.config = function()
  require("nvim-autopairs").setup {
    disable_in_macro = true
  }
end

return M
