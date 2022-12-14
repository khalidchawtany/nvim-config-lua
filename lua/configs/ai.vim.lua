local M = {
  cmd = {"AI"}
}

M.init = function()
  vim.api.nvim_set_keymap("n", "<D-a>", ":AI ", {noremap = true})
  vim.api.nvim_set_keymap("v", "<D-a>", ":AI ", {noremap = true})
  vim.api.nvim_set_keymap("i", "<D-a>", "<Esc>:AI<CR>a", {noremap = true})
end

M.config = function()
end

return M
