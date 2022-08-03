local M = {
  requires = {"folke/trouble.nvim"}
}

M.config = function()
  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { only_current_line = true },
  })
  require("lsp_lines").setup()
end
return M
