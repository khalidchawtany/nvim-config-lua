local M = {
  "folke/which-key.nvim"
}

M.config = function()
  require("which-key").setup {}

  local wk = require("which-key")
  -- As an example, we will the following mappings:
  --  1. <leader>fn new file
  --  2. <leader>fr show recent files
  --  2. <leader>ff find files
  --
  wk.register(
    {
      f = {
        name = "file", -- optional group name
        -- f = {"<cmd>Telescope find_files<cr>", "Find File"}, -- create a binding with label
        -- r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
        n = {"New File"}, -- just a label. don't create any mapping
        e = "Edit File", -- same as above
        ["1"] = "which_key_ignore" -- special label to hide it in the popup
        -- b = {
        --     function()
        --         print("bar")
        --     end, "Foobar"
        -- } -- you can also pass functions!
      }
    },
    {prefix = "<leader>"}
  )

  wk.register({name = "fzf-lua"}, {prefix = "<D-p>"})
  wk.register({name = "fzf"}, {prefix = "<C-p>"})
  wk.register({name = "telescope"}, {prefix = "<C-s>"})
end

return M
