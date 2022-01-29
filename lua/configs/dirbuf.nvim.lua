local M = {
  cmd = {"Dirbuf"}
}

M.mapKeys = function()
  vim.cmd [[nnoremap <leader>_ <cmd>Dirbuf<cr>]]
end

M.init = M.mapKeys

M.config = function()
  M.mapKeys()
  require("dirbuf").setup { hash_padding = 2, show_hidden = true }
end
return M
