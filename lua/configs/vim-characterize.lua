local M = {
    keys = { "<Plug>(characterize)" }
}
M.init = function()
    vim.cmd [[nmap gA <Plug>(characterize)<cr>]]
end
return M
