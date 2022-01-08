local M = {}

M.init = function()
  vim.cmd [[
      noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
	      \<Cmd>lua require('hlslens').start()<CR>
      noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
	      \<Cmd>lua require('hlslens').start()<CR>
      noremap * *<Cmd>lua require('hlslens').start()<CR>
      noremap # #<Cmd>lua require('hlslens').start()<CR>
      noremap g* g*<Cmd>lua require('hlslens').start()<CR>
      noremap g# g#<Cmd>lua require('hlslens').start()<CR>
    ]]
end

M.config = function()
  require("hlslens").setup(
    {
      build_position_cb = function(plist, bufnr, changedtick, pattern)
        require("scrollbar").search_handler.show(plist.start_pos)
      end
    }
  )
end

return M
