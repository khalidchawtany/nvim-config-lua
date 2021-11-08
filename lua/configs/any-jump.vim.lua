local M = {
  cmd = {"AnyJump", "AnyJumpArg", "AnyJumpVisual", "AnyJumpBack", "AnyJumpLastResults"}
}

M.mapKeys = function()
  vim.cmd [[
      nnoremap <leader>aj :AnyJump<CR>
      xnoremap <leader>aj :AnyJumpVisual<CR>
      nnoremap <leader>ak :AnyJumpBack<CR>
      nnoremap <leader>al :AnyJumpLastResults<CR>
  ]]
end

M.init = function()
  M.mapKeys()
end

M.config = function()
  M.mapKeys()
end

return M
