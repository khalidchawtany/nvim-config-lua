local M = {}
M.config = function()
    require'tabline'.setup {
        show_index = true, -- show tab index
        show_modify = true, -- show buffer modification indicator
        no_name = '[No name]' -- no name buffer name
    }

end

return M
