local M = {}
M.init = function()

    vim.g.submode_timeout = 0
    vim.cmd [[

     " Window resize
       call submode#enter_with('h/l', 'n', '', '<C-w>h', '<C-w><<cr>')
       call submode#enter_with('h/l', 'n', '', '<C-w>l', '<C-w>><cr>')
       call submode#map('h/l', 'n', '', 'h', '<C-w><<cr>')
       " call submode#map('h/l', 'n', '', 'l', '<C-w>>')
       call submode#map('h/l', 'n', '', 'l', '<C-w>><cr>')
       call submode#enter_with('j/k', 'n', '', '<C-w>j', '<C-w>-<cr>')
       call submode#enter_with('j/k', 'n', '', '<C-w>k', '<C-w>+<cr>')
       call submode#map('j/k', 'n', '', 'j', '<C-w>-<cr>')
       call submode#map('j/k', 'n', '', 'k', '<C-w>+<cr>')

     " horizontal navigation
       call submode#enter_with('H-Scroll', 'n', '', 'zl', 'zl')
       call submode#enter_with('H-Scroll', 'n', '', 'zh', 'zh')
       call submode#map('H-Scroll', 'n', '', 'l', 'zl')
       call submode#map('H-Scroll', 'n', '', 'h', 'zh')
       call submode#map('H-Scroll', 'n', '', 'k', '10zl')
       call submode#map('H-Scroll', 'n', '', 'j', '10zh')

     " colorscheme chooser
      call submode#enter_with('Colorscheme', 'n', '', 'c]c', ':<C-U>exe "NextColorScheme"<cr>')
      call submode#enter_with('Colorscheme', 'n', '', 'c[c', ':<C-U>exe "PrevColorScheme"<cr>')
      call submode#map('Colorscheme', 'n', '', 'j', ':<C-U>exe "NextColorScheme"<cr>')
      call submode#map('Colorscheme', 'n', '', 'k', ':<C-U>exe "PrevColorScheme"<cr>')

     "Toggles FOLD
       call submode#enter_with('toggle-fold', 'n', 's', 'cof', ':<C-U>exe "call ToggleFoldMethod()"<cr>')
       call submode#leave_with('toggle-fold', 'n', 's', '<Esc>')
       call submode#map(       'toggle-fold', 'n', 's', 'f', ':<C-U>exe "call ToggleFoldMethod()"<cr>')
       call submode#map(       'toggle-fold', 'n', 's', 'n', ':<C-U>exe "call ToggleFoldMethod()"<cr>')
       call submode#map(       'toggle-fold', 'n', 's', 'p', ':<C-U>exe "call ToggleFoldMethod(1)"<cr>')
       call submode#map(       'toggle-fold', 'n', 's', 'j', ':<C-U>exe "call ToggleFoldMethod()"<cr>')
       call submode#map(       'toggle-fold', 'n', 's', 'k', ':<C-U>exe "call ToggleFoldMethod(1)"<cr>')
       call submode#map(       'toggle-fold', 'n', 's', 'o', ':<C-U>set foldmethod=off<cr>')
       call submode#map(       'toggle-fold', 'n', 's', 's', ':<C-U>set foldmethod=syntax<cr>')
       call submode#map(       'toggle-fold', 'n', 's', 'i', ':<C-U>set foldmethod=indent<cr>')
       call submode#map(       'toggle-fold', 'n', 's', 'm', ':<C-U>set foldmethod=manual<cr>')
       call submode#map(       'toggle-fold', 'n', 's', '{', ':<C-U>set foldmethod=manual<cr>')
       call submode#map(       'toggle-fold', 'n', 's', 'e', ':<C-U>set foldexpr=nvim_treesitter#foldexpr()<cr>set foldmethod=expr<cr>') "}}} _Toogles FOLD

     "Toggles
       call submode#enter_with('toggle-mode', 'n', '', 'coo', ':<C-U>echo ""<cr>')
       call submode#leave_with('toggle-mode', 'n', '', '<Esc>')
       call submode#map(       'toggle-mode', 'n', '', 'f', ':<C-U>exe "call ToggleFoldMethod()"<cr>')
       call submode#map(       'toggle-mode', 'n', '', 'm', ':<C-U>exe "call ToggleMouseFunction()"<cr>')
       call submode#map(       'toggle-mode', 'n', '', ';', ':<C-U>set showcmd!<cr>')
       call submode#map(       'toggle-mode', 'n', '', ':', ':<C-U>set showcmd!<cr>')
       call submode#map(       'toggle-mode', 'n', '', 't', ':<C-U>exe "set showtabline=" . (&showtabline+2)%3<cr>')
       call submode#map(       'toggle-mode', 'n', '', '<space>', ':<C-U>exe "set laststatus=" . (&laststatus+2)%3<cr>')
       call submode#map(       'toggle-mode', 'n', '', 'q', ':<C-U>QFix<cr>')


     "Undo/Redo
       call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
       call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
       call submode#leave_with('undo/redo', 'n', '', '<Esc>')
       call submode#map('undo/redo', 'n', '', '-', 'g-')
       call submode#map('undo/redo', 'n', '', '+', 'g+')

     "Jump/Edit
       call submode#enter_with('Jump/Edit', 'n', 's', 'coj', ':<C-U>exe "silent! normal g,zO"<cr>')
       call submode#enter_with('Jump/Edit', 'n', 's', 'coe', ':<C-U>exe "silent! normal g,zO"<cr>')
       call submode#enter_with('Jump/Edit', 'n', 's', ']j', ':<C-U>exe "silent! normal g,zO"<cr>')
       call submode#enter_with('Jump/Edit', 'n', 's', '[j', ':<C-U>exe "silent! normal g;zO"<cr>')
       call submode#map('Jump/Edit', 'n', 's', ']', ':<C-U>exe "silent! normal g,zO"<cr>')
       call submode#map('Jump/Edit', 'n', 's', '[', ':<C-U>exe "silent! normal g;zO"<cr>')
       call submode#map('Jump/Edit', 'n', 's', 'n', ':<C-U>exe "silent! normal g,zO"<cr>')
       call submode#map('Jump/Edit', 'n', 's', 'p', ':<C-U>exe "silent! normal g;zO"<cr>')
       call submode#map('Jump/Edit', 'n', 's', 'j', ':<C-U>exe "silent! normal g,zO"<cr>')
       call submode#map('Jump/Edit', 'n', 's', 'k', ':<C-U>exe "silent! normal g;zO"<cr>')

]]
end

return M
