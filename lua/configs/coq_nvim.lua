local M = {
  branch = "coq",
  event = "VimEnter"
}

M.init = function()
  vim.g.coq_settings = {keymap = {bigger_preview = "<D-k>"}}
end


M.config = function()
  vim.cmd [[COQnow]]

  -- local nvim_lsp = require("lspconfig")
  -- local coq = require("coq")
  -- for server, config in pairs(servers) do
  --   nvim_lsp[server].setup(
  --     coq.lsp_ensure_capabilities(
  --       vim.tbl_deep_extend(
  --         "force",
  --         {
  --           on_attach = lsp_on_attach,
  --           capabilities = capabilities,
  --           flags = {debounce_text_changes = 150},
  --           init_options = config
  --         },
  --         {}
  --       )
  --     )
  --   )
  -- local cfg = nvim_lsp[server]
  -- if not (cfg and cfg.cmd and vim.fn.executable(cfg.cmd[1]) == 1) then
  --   print(server .. ": cmd not found: " .. vim.inspect(cfg.cmd))
  -- end
  -- end
end

return M
