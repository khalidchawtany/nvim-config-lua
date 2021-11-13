local M = {
  cmd = {"FloatermNew", "FloatermToggle", "FloatermShow"},
  module = "FTerm"
}

M.init = function()
  vim.g.floaterm_height = 0.9
  vim.g.floaterm_width = 0.9
  vim.g.floaterm_autoinsert = true

  vim.cmd[[ nnoremap <leader>gi :lua require('vim-floaterm.gitUi'):toggle() ]]
end

return M
