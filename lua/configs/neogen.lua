local M = {
  requires = "nvim-treesitter/nvim-treesitter",
  cmd = {"Neogen"},
  module = "neogen"
}

M.mapKeys = function()
  -- :Neogen func|class|type|...

  local opts = {noremap = true, silent = true}

  vim.api.nvim_set_keymap("n", "<Leader>dgd", ":lua require('neogen').generate()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<Leader>dgg", ":lua require('neogen').generate()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<Leader>dgc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>dgn", ":lua require('neogen').jump_next()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>dgp", ":lua require('neogen').jump_prev()<CR>", opts)
end

M.init = M.mapKeys

M.config = function()
  require("neogen").setup {
    enabled = true
  }
end
