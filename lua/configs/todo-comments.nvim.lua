local M = {
  requires = {"nvim-lua/plenary.nvim"},
  cmd = {
    "TodoQuickFix",
    "TodoLocList",
    "TodoTrouble",
    "TodoTelescope"
  }
}

M.init = function()
  vim.cmd [[ nnoremap <c-s><c-t>  <cmd>TodoTelescope<cr> ]]
end

M.config = function()
  require("todo-comments").setup {}
end

return M
