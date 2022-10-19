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
      cmdline = {
        enabled = true, -- enables the Noice cmdline UI
        view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        view_search = "cmdline_popup_search", -- view for rendering the cmdline for search
        opts = {buf_options = {filetype = "vim"}}, -- enable syntax highlighting in the cmdline
        icons = {
          ["/"] = {icon = " ", hl_group = "NoiceCmdlineIconSearch"},
          ["?"] = {icon = " ", hl_group = "NoiceCmdlineIconSearch"},
          [":"] = {icon = " ", hl_group = "NoiceCmdlineIcon", firstc = false}
        }
      },
      messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = true, -- enables the Noice messages UI
        view = "notify", -- default view for messages
        view_error = "notify", -- view for errors
        view_warn = "notify", -- view for warnings
        view_history = "split", -- view for :messages
        view_search = "virtualtext" -- view for search count messages. Set to `false` to disable
      },
      popupmenu = {
        enabled = true, -- enables the Noice popupmenu UI
        ---@type 'nui'|'cmp'
        backend = "nui" -- backend to use to show regular cmdline completions
      },
      ---@type NoiceRouteConfig
      history = {
        -- options for the message history that you get with `:Noice`
        view = "split",
        opts = {enter = true, format = "details"},
        filter = {event = {"msg_show", "notify"}, ["not"] = {kind = {"search_count", "echo"}}}
      },
      notify = {
        -- Noice can be used as `vim.notify` so you can route any notification like other messages
        -- Notification messages have their level and other properties set.
        -- event is always "notify" and kind can be any log level as a string
        -- The default routes will forward notifications to nvim-notify
        -- Benefit of using Noice for this is the routing and consistent history view
        enabled = true,
        view = "notify"
      },
      lsp_progress = {
        enabled = false,
        -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
        -- See the section on formatting for more details on how to customize.
        --- @type NoiceFormat|string
        format = "lsp_progress",
        --- @type NoiceFormat|string
        format_done = "lsp_progress_done",
        throttle = 1000 / 30, -- frequency to update lsp progress message
        view = "mini"
      },
      throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
      ---@type NoiceConfigViews
      views = {
        cmdline_popup = {
          position = {
            row = 7,
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
            row = 7,
            col = "50%"
          },
          size = {
            width = 60,
            height = "auto"
          },
          border = {
            style = "rounded",
            padding = {0, 1}
          },
          win_options = {
            winhighlight = {Normal = "Normal", FloatBorder = "DiagnosticInfo"}
          }
        }
      }, ---@see section on views
      ---@type NoiceRouteConfig[]
      --- @see section on routes
      routes = {
        -- always route any messages with more than 20 lines to the split view
        {
          view = "split",
          filter = {event = "msg_show", min_height = 20}
        },
        -- skip search_count messages instead of showing them as virtual text
        {
          filter = {event = "msg_show", kind = "search_count"},
          opts = {skip = true}
        }
      },
      ---@type table<string, NoiceFilter>
      status = {}, --- @see section on statusline components
      ---@type NoiceFormatOptions
      format = {} --- @see section on formatting
    }
  )
end
return M

--  {
--   -- throttle = 100, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
--   hacks = {
--     -- due to https://github.com/neovim/neovim/issues/20416
--     -- messages are resent during a redraw. Noice detects this in most cases, but
--     -- some plugins (mostly vim plugns), can still cause loops.
--     -- When a loop is detected, Noice exits.
--     -- Enable this option to simply skip duplicate messages instead.
--     skip_duplicate_messages = true
--   },
--   routes = {
--     -- Don't show not found message
--     {
--       view = "mini",
--       filter = {
--         find = "Pattern not found:"
--       },
--       opts = {skip = false}
--     },
--     {
--       view = "mini",
--       filter = {
--         find = "search hit %a+, continuing at %a+"
--       },
--       opts = {skip = false}
--     },
--     -- Don't show written messages
--     {
--       view = "mini",
--       filter = {
--         event = "msg_show",
--         kind = "",
--         find = "written"
--       },
--       opts = {skip = false}
--     },
--     -- Use a Classic Bottom Cmdline for Search
--     {
--       filter = {
--         event = "cmdline",
--         find = "^%s*[/?]"
--       },
--       view = "cmdline"
--     }
--   },
--   views = {
--     mini = {
--       timeout = 1000 -- 1 second
--     },
--     cmdline_popup = {
--       position = {
--         row = 2,
--         col = "50%"
--       },
--       size = {
--         width = 60,
--         height = "auto"
--       },
--       border = {
--         style = "none",
--         padding = {1, 2}
--       },
--       -- filter_options = {},
--       win_options = {
--         winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder"
--       }
--     },
--     popupmenu = {
--       relative = "editor",
--       position = {
--         row = 5,
--         col = "50%"
--       },
--       size = {
--         width = 60,
--         height = 10
--       },
--       border = {
--         style = "rounded",
--         padding = {0, 1}
--       },
--       win_options = {
--         winhighlight = {Normal = "Normal", FloatBorder = "DiagnosticInfo"}
--       }
--     }
--   }
-- }
