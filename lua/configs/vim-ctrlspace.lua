local M = {
    cmd={'CtrlSpace'},
}

M.init = function ()

    vim.cmd[[
    nnoremap <silent> <C-Space><C-Space> :CtrlSpace<cr>

     let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
     if executable("ag")
         let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
     endif
    ]]
    
end

return M
