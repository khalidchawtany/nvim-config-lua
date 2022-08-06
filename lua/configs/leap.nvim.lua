local M = {}

M.init = function()
  require('leap').set_default_keymaps()
end

M.config = function()
  require("leap").setup {
    case_insensitive = true,
    -- Leaving the appropriate list empty effectively disables "smart" mode,
    -- and forces auto-jump to be on or off.
    -- safe_labels = { . . . },
    -- labels = { . . . },
    -- These keys are captured directly by the plugin at runtime.
   -- special_keys = {
    --   repeat_search = "<enter>",
    --   next_match = "<enter>",
    --   prev_match = "<tab>",
    --   next_group = "<space>",
    --   prev_group = "<tab>",
    --   eol = "<space>"
    -- }
  }
   -- vim.api.nvim_create_autocmd("VimEnter", {
   --    pattern = "*",
   --    callback = function()
    --   end,
    -- })
end

return M
