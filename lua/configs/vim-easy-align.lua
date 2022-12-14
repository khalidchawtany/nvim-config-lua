local M = {}

local setMaps = function()
end
M.init = function()
  vim.g.easy_align_ignore_comment = 0 -- align comments

  vim.cmd [[
    vnoremap <Enter> :EasyAlign<cr>

    vnoremap g<Enter> :EasyAlign */[(,)]\\+/<left><left><left><left>

    nmap g<cr> <Plug>(EasyAlign)
    ]]
end

M.config = function()
  vim.cmd [[
    vnoremap <Enter> :EasyAlign<cr>

    vnoremap g<Enter> :EasyAlign */[(,)]\\+/<left><left><left><left>

    nmap g<cr> <Plug>(EasyAlign)
    ]]
end

return M
