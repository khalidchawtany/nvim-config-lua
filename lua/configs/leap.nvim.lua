local M = {
  keys ={"<Plug>(leap-"}
}

M.init = function()
  -- require("leap").set_default_keymaps()

  for _, _1_ in ipairs(
    {
      {"n", "s", "<Plug>(leap-forward)"},
      {"n", "S", "<Plug>(leap-backward)"},
      {"x", "s", "<Plug>(leap-forward)"},
      {"x", "S", "<Plug>(leap-backward)"},
      {"o", "z", "<Plug>(leap-forward)"},
      {"o", "Z", "<Plug>(leap-backward)"},
      {"o", "x", "<Plug>(leap-forward-x)"},
      {"o", "X", "<Plug>(leap-backward-x)"},
      {"n", "gs", "<Plug>(leap-cross-window)"},
      {"x", "gs", "<Plug>(leap-cross-window)"},
      {"o", "gs", "<Plug>(leap-cross-window)"}
    }
  ) do
    local _each_2_ = _1_
    local mode = _each_2_[1]
    local lhs = _each_2_[2]
    local rhs = _each_2_[3]
    vim.keymap.set(mode, lhs, rhs, {silent = true})
  end
end

M.config = function()
  require("leap").setup {
    case_insensitive = true
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
