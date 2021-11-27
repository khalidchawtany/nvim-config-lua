local M = {
  module = "tsht"
}

M.mapKeys = function()
  vim.cmd [[
    omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
    vnoremap <silent> m :lua require('tsht').nodes()<CR>
  ]]
end

M.init = M.mapKeys

M.config = function()
  M.mapKeys()
  require("tsht").config.hint_keys = {"h", "j", "f", "d", "n", "v", "s", "l", "a"}
end

return M
