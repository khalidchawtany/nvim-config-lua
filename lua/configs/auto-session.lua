local M = {
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  module = "auto-session"
}
M.config = function()
  require("auto-session").setup {
    log_level = "error",
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = false,
    auto_session_use_git_branch = nil,
    -- the configs below are lua only
    -- bypass_session_save_file_types = nil,
    -- auto_session_suppress_dirs = {
    --   "~/Projects/*/*"
    -- },
    auto_session_allowed_dirs = {
      "~/Projects/*/*"
    },
    cwd_change_handling = nil
    -- cwd_change_handling = {
    --   restore_upcoming_session = false, -- already the default is true, no need to specify like this, only here as an example
    --   pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
    --   post_cwd_changed_hook = function()
    --     -- example refreshing the lualine status line _after_ the cwd changes
    --     -- require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
    --   end
    -- }
  }
end
return M
