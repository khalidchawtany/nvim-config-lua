local M = {
  module = "zen-mode",
  keys = {"<leader>zn"},
  cmd = {"ZenModeToggle", "ZenMode"}
}

M.config = function()
  require("zen-mode").setup {}
  vim.cmd [[
                command! ZenModeToggle :lua require("zen-mode").toggle({ window = { width = .70 }})<cr>
                nnoremap <leader>zm <cmd>ZenModeToggle<cr>
            ]]
end

return M
