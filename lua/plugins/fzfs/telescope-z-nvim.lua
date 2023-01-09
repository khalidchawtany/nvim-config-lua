return {
  "nvim-telescope/telescope-z.nvim",
  dependencies = {
    {"nvim-lua/plenary.nvim"},
    {"nvim-lua/popup.nvim"},
    {"nvim-telescope/telescope.nvim"}
  },
  keys = {
    {
      "<leader>tez",
      [[<cmd>lua require'telescope'.extensions.z.list{}<CR>]],
      desc = "Telescope (Z)"
    }
  },
  config = function()
    require "telescope".load_extension "z"
  end
}
