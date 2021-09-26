local M = {
  cmd = {"EasyAlign"},
  keys = {
    "<Plug>(EasyAlign)"
  }
}

local setMaps = function()
  vim.cmd [[
    vnoremap <Enter> :EasyAlign<cr>

    vnoremap g<Enter> :EasyAlign */[(,)]\\+/<left><left><left><left>

    nmap g<cr> <Plug>(EasyAlign)
    ]]
end
M.init = function()
  vim.g.easy_align_ignore_comment = 0 -- align comments

  setMaps()
end

M.config = function()
  setMaps()
end

return M
