local M = {event = {'InsertEnter'}}

M.config = function()
    vim.cmd [[set runtimepath+=/Users/juju/.config/nvim/xpt-personal]]
    vim.g.xptemplate_key = '<c-\\>'
    vim.g.xptemplate_nav_next = '<D-j>'
    vim.g.xptemplate_nav_prev = '<D-k>'
    vim.g.xptemplate_minimal_prefix = 0
end

return M
