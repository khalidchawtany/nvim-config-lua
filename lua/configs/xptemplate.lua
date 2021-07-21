local M = {event = {'InsertEnter'}}

M.config = function()
    vim.cmd [[set runtimepath+=/Users/juju/.config/nvim/xpt-personal]]
    vim.g.xptemplate_key = '<c-\\>'
    vim.g.xptemplate_nav_next = '<C-j>'
    vim.g.xptemplate_nav_prev = '<C-k>'
end

return M
