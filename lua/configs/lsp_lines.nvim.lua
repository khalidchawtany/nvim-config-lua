local M = {
  requires = {"folke/trouble.nvim"}
}

M.config = function()
  require("lsp_lines").register_lsp_virtual_lines()
end
return M
