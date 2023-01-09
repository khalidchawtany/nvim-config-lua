return {
  "ckolkey/ts-node-action",
  dependencies = "nvim-treesitter/nvim-treesitter",
  keys = {
    {"<leader>g<cr>", ':lua require("ts-node-action").node_action()<CR>', desc = "Node Action"}
  },
  config = function()
    -- Optional
    -- require("ts-node-action").setup({})
  end
}
