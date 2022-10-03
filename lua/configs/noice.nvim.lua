local M = {
  -- event = "VimEnter",
  requires = {
    {"MunifTanjim/nui.nvim"},
    {"rcarriga/nvim-notify"},
    {"hrsh7th/nvim-cmp"}
  }
}
M.init = function()
end
M.config = function()
   require("noice").setup()
end
return M
