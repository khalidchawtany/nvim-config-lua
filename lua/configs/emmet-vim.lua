local M = {
  keys = {"<C-;>,"}
}

M.mapKeys = function()
  vim.cmd [[
    let g:user_emmet_leader_key='<C-;>'
    nnoremap <C-;>, nop
  ]]
end

M.init = M.mapKeys
M.config = M.mapKeys

return M
