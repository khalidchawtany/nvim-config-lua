local M = {event = {'InsertEnter'}}

M.init = function()
    if vim.fn.has('mac') then
        -- using https://github.com/vovkasm/input-source-switcher
        vim.g.XkbSwitchLib = '/Users/juju/Development/Applications/input-source-switcher/build/libInputSourceSwitcher.dylib'
    elseif vim.fn.has('win') then
        vim.g.XkbSwitchLib = 'C:\\Development\\libxkbswitch64.dll'
        vim.g.XkbSwitchIMappingsTrData = 'C:\\Development\\charmap.txt'
    end
    vim.g.XkbSwitchEnabled = 1
end

return M
