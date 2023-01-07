local M = {
  requires = {"nvim-treesitter"},
  module = "ts-node-action"
}

M.init = function()
  -- vim.keymap.set({"n"}, "g<cr>", require("ts-node-action").node_action, {desc = "Trigger Node Action"})
  vim.api.nvim_set_keymap(
    "n",
    "g<cr>",
    ':lua require("ts-node-action").node_action()<CR>',
    {noremap = true, silent = true}
  )
end

M.config = function()
  -- Optional
  -- require("ts-node-action").setup({})
end
return M
