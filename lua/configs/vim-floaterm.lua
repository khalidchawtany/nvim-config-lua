local M = {
  cmd = {"FloatermNew", "FloatermToggle", "FloatermShow"}
}

local mapKeys = function()
  vim.cmd [[
    nnoremap <C-cr> :FloatermToggle<cr>
    nnoremap <M-cr> :FloatermNew<cr>
 ]]
end

M.init = function()
  mapKeys()
  vim.g.floaterm_height = 0.9
  vim.g.floaterm_width = 0.9
  vim.g.floaterm_autoinsert = true
end

M.config = mapKeys

return M
