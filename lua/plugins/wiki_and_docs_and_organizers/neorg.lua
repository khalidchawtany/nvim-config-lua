local M = {
  "vhyrro/neorg",
  ft = {"norg"},
  -- tag = "*",
  dependencies = {"nvim-treesitter"} -- You may want to specify Telescope here as well
}

M.config = function()
  require("neorg").setup {
    load = {
      ["core.defaults"] = {},
      ["core.norg.concealer"] = {
        config = {
          icon_preset = "diamond"
        }
      },
      ["core.export"] = {
        config = {}
      },
      ["core.export.markdown"] = {
        config = {
		}
      }
    }
  }
end

return M
