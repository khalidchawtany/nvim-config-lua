local M = {
  -- event = "VimEnter",
  requires = {
    {"MunifTanjim/nui.nvim"},
    -- {"rcarriga/nvim-notify"},
    {"hrsh7th/nvim-cmp"}
  },
  cmd = {"Noice"}
}
M.init = function()
end
M.config = function()
  require("noice").setup(
    {
      -- throttle = 100, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
      hacks = {
        -- due to https://github.com/neovim/neovim/issues/20416
        -- messages are resent during a redraw. Noice detects this in most cases, but
        -- some plugins (mostly vim plugns), can still cause loops.
        -- When a loop is detected, Noice exits.
        -- Enable this option to simply skip duplicate messages instead.
        skip_duplicate_messages = true
      },
      routes = {
        -- Don't show not found message
        {
          view = "mini",
          filter = {
            find = "Pattern not found:"
          },
          opts = {skip = false}
        },
        {
          view = "mini",
          filter = {
            find = "search hit %a+, continuing at %a+"
          },
          opts = {skip = false}
        },
        -- Don't show written messages
        {
          view = "mini",
          filter = {
            event = "msg_show",
            kind = "",
            find = "written"
          },
          opts = {skip = false}
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
        mini = {
          timeout = 1000 -- 1 second
        },
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
          -- filter_options = {},
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
