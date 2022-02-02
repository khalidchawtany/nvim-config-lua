local M = {
  cmd = {"CtrlSpace"}
}

M.init = function()
  vim.g.CtrlSpaceSymbols = {File = "◯", CTab = "▣", Tabs = "▢"}

  vim.cmd [[
    nnoremap <silent> <C-Space><Space> :CtrlSpace<cr>

     if executable("ag")
         let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
     endif
    ]]
end

return M
