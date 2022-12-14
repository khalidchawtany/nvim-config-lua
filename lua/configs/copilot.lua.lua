local M = {
  event = "VimEnter"
}

M.config = function()
  vim.defer_fn(
    function()
      require("copilot").setup(
        {
          panel = {
            enabled = true,
            auto_refresh = false,
            keymap = {
              jump_prev = "[[",
              jump_next = "]]",
              accept = "<CR>",
              refresh = "gr",
              open = "<M-CR>"
            }
          },
          suggestion = {
            enabled = true,
            auto_trigger = false,
            debounce = 75,
            keymap = {
              accept = "<M-l>",
              next = "<M-]>",
              prev = "<M-[>",
              dismiss = "<C-]>"
            }
          },
          filetypes = {
            yaml = false,
            markdown = false,
            help = false,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = false
          },
          copilot_node_command = "node", -- Node.js version must be > 16.x
          server_opts_overrides = {}
        }
      )
    end,
    100
  )
end

return M
