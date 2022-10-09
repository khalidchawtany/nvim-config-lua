local M = {
  -- event = "VimEnter",
  requires = {
    {"MunifTanjim/nui.nvim"},
    {"rcarriga/nvim-notify"},
    {"hrsh7th/nvim-cmp"}
  },
  cmd = {"Noice"}
}
M.init = function()
end
M.config = function()
  require("noice").setup(
    {
      throttle = 1000, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
      routes = {
        -- Don't show not found message
        {
          filter = {
            find = "Pattern not found:",
          },
          opts = { skip = true },
        },
        {
          filter = {
            find = "search hit %a+, continuing at %a+",
          },
          opts = { skip = true },
        },
        -- Don't show written messages
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written"
          },
          opts = {skip = true}
        },

-- Use a Classic Bottom Cmdline for Search
        {
          filter = {
            event = "cmdline",
            find = "^%s*[/?]"
          },
          view = "cmdline"
        }
      },
      views = {
        cmdline_popup = {
          position = {
            row = 2,
            col = "50%"
          },
          size = {
            width = 60,
            height = "auto"
          },
          border = {
            style = "none",
            padding = {1, 2}
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder"
          }
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 5,
            col = "50%"
          },
          size = {
            width = 60,
            height = 10
          },
          border = {
            style = "rounded",
            padding = {0, 1}
          },
          win_options = {
            winhighlight = {Normal = "Normal", FloatBorder = "DiagnosticInfo"}
          }
        }
      }
    }
  )
end
return M
