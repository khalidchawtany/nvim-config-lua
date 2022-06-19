local M = {
  requires = "kevinhwang91/promise-async",
  disabled = true
}

M.config = function()
  -- option 2: nvim lsp as LSP client
  -- tell the sever the capability of foldingRange
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
  }
  --

  require("ufo").setup()
end

return M
