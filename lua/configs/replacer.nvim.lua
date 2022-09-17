local M = {
  module = "replacer"
}

M.config = function()
  vim.api.nvim_set_keymap("n", "<Leader>h", ':lua require("replacer").run()<cr>', {silent = true})
  -- vim.api.nvim_set_keymap('n', '<Leader>h', ':lua require("replacer").run({ rename_files = false })<cr>', { silent = true })
end

return M
