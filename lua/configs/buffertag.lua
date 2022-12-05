local M = {
  event = "BufEnter"
}

M.config = function()
  vim.cmd [[nnoremap yoq <cmd>BuffertagToggle<cr>]]
  require("buffertag").setup()
end
-- accepts any border options that `nvim_open_win` accepts.
-- see ":help vim.api.nvim_open_win"
-- border = "none",

return M
