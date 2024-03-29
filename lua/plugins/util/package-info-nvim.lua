return {
  "vuki656/package-info.nvim", -- npm, yarn, pnpm
  dependencies = {"MunifTanjim/nui.nvim"},
  keys = {
    -- Show package versions
    {"<leader>is", ":lua require('package-info').show()<CR>", desc = "Package info (Show)"},
    -- Hide package versions
    {"<leader>ic", ":lua require('package-info').hide()<CR>", desc = "Package info (Hide)"},
    -- Update package on line
    {"<leader>iu", ":lua require('package-info').update()<CR>", desc = "Package info (Update)"},
    -- Delete package on line
    {
      "<leader>id",
      ":lua require('package-info').delete()<CR>",
      desc = "Package info (Delete)"
    },
    -- Install a new package
    {"<leader>ii", ":lua require('package-info').install()<CR>", desc = "Package info (Update)"},
    -- Reinstall dependencies
    {"<leader>ir", ":lua require('package-info').reinstall()<CR>", desc = "Package info (Update)"},
    -- Install a different package version
    {"<leader>ip", ":lua require('package-info').change_version()<CR>", desc = "Package info (Update)"}
  },
  config = function()
    require("package-info").setup()
  end
}
