local opts = {hidden = false, respect_gitignore = true}

return {
  "princejoogie/dir-telescope.nvim",
  requires = {"nvim-telescope/telescope.nvim"},
  cmd = {"GrepInDirectory", "FileInDirectory"},
  keys = {
    {
      "<c-s><c-]>",
      function()
        require("dir-telescope.features.find-in-dir").FileInDirectory(opts)
      end,
      desc = "Telescope (FileInDirectory)"
    },
    {
      "<c-s><c-[>",
      function()
        require("dir-telescope.features.find-in-dir").GrepInDirectory(opts)
      end,
      desc = "Telescope (GrepInDirectory)"
    }
  },
  config = function()
    require("dir-telescope").setup(opts)
  end
}
