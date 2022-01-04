local M = {
  requires = {
    {"nvim-lua/plenary.nvim"},
    {"nvim-lua/popup.nvim"},
    {"nvim-telescope/telescope.nvim"}
  },
  after = "telescope.nvim"
}

M.mapKeys = function()
  vim.api.nvim_set_keymap(
    "n",
    "<leader>tez",
    [[<cmd>lua require'telescope'.extensions.z.list{}<CR>]],
    {noremap = true, silent = true}
  )
end

M.init = M.mapKeys

M.config = function()
  M.mapKeys()
  require "telescope".load_extension "z"
end

return M
