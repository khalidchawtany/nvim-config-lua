local M = {keys = {'<leader>zn'}, cmd = {'ZenModeToggle'}}

M.config = function()
    require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    }
    vim.cmd [[
                command! ZenModeToggle :lua require("zen-mode").toggle({ window = { width = .70 }})<cr>
                nnoremap <leader>zn <cmd>ZenModeToggle<cr>
            ]]
end

return M
