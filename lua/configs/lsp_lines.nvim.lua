local M = {
  requires = {"folke/trouble.nvim"}
}

M.config = function()
  vim.diagnostic.config({
    virtual_text = false,
  })
  require("lsp_lines").setup()
end
return M
