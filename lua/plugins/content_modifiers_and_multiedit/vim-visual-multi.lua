local M = {
 "mg979/vim-visual-multi",
  event = "CursorMoved",
  branch = "master",
  config = function()
    -- vim.g.multi_cursor_use_default_mapping = 0
    -- vim.g.multi_cursor_next_key = '<C-n>'
    -- vim.g.multi_cursor_prev_key = '<C-p>'
    -- vim.g.multi_cursor_skip_key = '<C-x>'
    -- vim.g.multi_cursor_quit_key = '<Esc>'
    vim.cmd [[
        let g:VM_maps = {}
        " let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
        " let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n
        let g:VM_maps["Select Cursor Down"] = '∆'      " start selecting down
        let g:VM_maps["Select Cursor Up"]   = '˚'        " start selecting up

        ]]
  end
}

return M
