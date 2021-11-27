local M = {
    module = 'nvim-autopairs',
    event = {'InsertEnter'},
}

M.config = function()
    require('nvim-autopairs').setup{}
end

return M

