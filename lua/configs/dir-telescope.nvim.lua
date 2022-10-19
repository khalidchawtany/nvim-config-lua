local M = {
  requires = {"nvim-telescope/telescope.nvim"},
  module = "dir-telescope",
  cmd = {"GrepInDirectory", "FileInDirectory"}
}

local opts = {
  hidden = false,
  respect_gitignore = true
}

M.init = function()
  vim.keymap.set(
    "n",
    "<c-s><c-]>",
    function()
      require("dir-telescope.features.find-in-dir").FileInDirectory(opts)
    end,
    {desc = "Telescope (FileInDirectory)"}
  )

  vim.keymap.set(
    "n",
    "<c-s><c-[>",
    function()
      require("dir-telescope.features.grep-in-dir").GrepInDirectory(opts)
    end,
    {desc = "Telescope (GrepInDirectory)"}
  )
end

M.config = function()
  require("dir-telescope").setup(opts)
end


return M
