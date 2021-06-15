local M = {cmd = {'EasyAlign'}, keys = {{'v', '<cr>'}}}

M.init = function()

    -- Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    vim.g.easy_align_ignore_comment = 0 -- align comments
    vim.cmd [[
        vmap <Enter> <Plug>(EasyAlign)

        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        vnoremap g<Enter> :EasyAlign */[(,)]\\+/<left><left><left><left>

        nmap g<cr> <Plug>(EasyAlign)
      ]]
end

return M
