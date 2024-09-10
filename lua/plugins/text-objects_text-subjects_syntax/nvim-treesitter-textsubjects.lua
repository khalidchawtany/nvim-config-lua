local M = {
 "RRethy/nvim-treesitter-textsubjects",
  dependencies = "nvim-treesitter/nvim-treesitter",

 -- TODO: inspect keys which are mapped to map them here
  -- keys = {
  --   {".", "<cmd>PounceRepeat<cr>", desc = "Pounce (Repeat)"},
  -- },
}

M.config = function()
  require "nvim-treesitter.configs".setup {
    textsubjects = {
      enable = true,
      keymaps = {
        ["."] = "textsubjects-smart",
        [","] = "textsubjects-container-outer",
        -- [".,"] = { 'textsubjects-container-inner', desc = "Select inside containers (classes, functions, etc.)" },
      }
    }
  }
end

return M

