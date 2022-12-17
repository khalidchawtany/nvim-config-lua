local M = {
  requires = {"nvim-telescope/telescope.nvim"},
  module = "telescope-undo"
}

M.init = function()
  vim.keymap.set(
    "n",
    "<c-s><c-t>",
    function()
      require("telescope-undo")()
    end,
    {desc = "Telescope (Undotree)"}
  )
end

M.config = function()
    require("telescope").load_extension("undo")
end

return M
