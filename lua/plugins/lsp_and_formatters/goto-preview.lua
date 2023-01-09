return {
  "rmagatti/goto-preview",
  module = "goto-preview",
  keys = {
    {"gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", desc = "Preview Definition"},
    {"gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", desc = "Preview Implementation"},
    {"gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", desc = "Peview Close"}
  },
  config = function()
    require("goto-preview").setup {}
    -- require('goto-preview').setup {
    --    width = 120; -- Width of the floating window
    --    height = 15; -- Height of the floating window
    --    default_mappings = false; -- Bind default mappings
    --    debug = false; -- Print debug information
    --    opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
    --  }
  end
}
