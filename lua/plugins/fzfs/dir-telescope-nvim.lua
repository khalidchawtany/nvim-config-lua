
return {
  "princejoogie/dir-telescope.nvim",
  dependencies = {"nvim-telescope/telescope.nvim"},
  keys = {
    {
      "<leader>fid",
      "<cmd>Telescope dir find_files<CR>",
      desc = "Telescope (FileInDirectory)"
    },
    {
      "<leader>sid",
      "<cmd>Telescope dir live_grep<CR>",
      desc = "Telescope (GrepInDirectory)"
    }
  },
  config = function()
    require("dir-telescope").setup({
      -- these are the default options set
      hidden = true,
      no_ignore = false,
      show_preview = true,
    })
  end
}
