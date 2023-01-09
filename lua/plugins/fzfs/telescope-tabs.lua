return {
  "LukasPietzschmann/telescope-tabs",
  dependencies = {"nvim-telescope/telescope.nvim"},
  keys = {
    {
      "<c-s><c-i>",
      function()
        require("telescope").extensions["telescope-tabs"].list_tabs()
      end,
      desc = "Telescope (Tabs)"
    }
  },
  config = function()
    require "telescope-tabs".setup {
      show_preview = true
      -- close_tab_shortcut = "C-d",
      -- entry_formatter = function(tab_id, buffer_ids, file_names, file_paths)
      --   local entry_string = table.concat(file_names, ", ")
      --   return string.format("%d: %s", tab_id, entry_string)
      -- end
    }
  end
}
