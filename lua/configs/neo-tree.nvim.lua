local M = {
  branch = "v2.x",
  requires = {
    "MunifTanjim/nui.nvim",
    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim"
  },
}

M.config = function()
  require("neo-tree").setup()
  vim.cmd [[
  nnoremap \- <cmd>Neotree right reveal<cr>
  nnoremap <space>- <cmd>Neotree left reveal<cr>
  nnoremap - <cmd>Neotree float reveal<cr>
  nnoremap \g <cmd>Neotree float git_status<cr>
  nnoremap \b <cmd>Neotree float buffers<cr>
  ]]
end

return M
