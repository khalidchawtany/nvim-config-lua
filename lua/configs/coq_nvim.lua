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
  local remap = vim.api.nvim_set_keymap
  local npairs = require("nvim-autopairs")

  npairs.setup({map_bs = false, map_cr = false})

  vim.g.coq_settings = {keymap = {recommended = false}}

  -- these mappings are coq recommended mappings unrelated to nvim-autopairs
  remap("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], {expr = true, noremap = true})
  remap("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], {expr = true, noremap = true})
  remap("i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], {expr = true, noremap = true})
  remap("i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], {expr = true, noremap = true})

  -- skip it, if you use another global object
  _G.MUtils = {}

  MUtils.CR = function()
    if vim.fn.pumvisible() ~= 0 then
      if vim.fn.complete_info({"selected"}).selected ~= -1 then
        return npairs.esc("<c-y>")
      else
        return npairs.esc("<c-e>") .. npairs.autopairs_cr()
      end
    else
      return npairs.autopairs_cr()
    end
  end
  remap("i", "<cr>", "v:lua.MUtils.CR()", {expr = true, noremap = true})

  MUtils.BS = function()
    if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({"mode"}).mode == "eval" then
      return npairs.esc("<c-e>") .. npairs.autopairs_bs()
    else
      return npairs.autopairs_bs()
    end
  end
  remap("i", "<bs>", "v:lua.MUtils.BS()", {expr = true, noremap = true})
end

return M
