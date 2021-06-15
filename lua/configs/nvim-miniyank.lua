local M = {}
M.config = function()

    vim.g.miniyank_filename = "/Users/" .. vim.fn.expand('$USER') .. "/.local/share/nvim/cache/miniyank.mpack"

    vim.g.miniyank_maxitems = 1000

    vim.cmd [[
              map p <Plug>(miniyank-autoput)
              map P <Plug>(miniyank-autoPut)
              map [p <Plug>(miniyank-cycle)

              map ]p <Plug>(miniyank-startput)
              map ]P <Plug>(miniyank-startPut)

              map <Leader>mc <Plug>(miniyank-tochar)
              map <Leader>ml <Plug>(miniyank-toline)
              map <Leader>mb <Plug>(miniyank-toblock)
              ]]

end

return M
