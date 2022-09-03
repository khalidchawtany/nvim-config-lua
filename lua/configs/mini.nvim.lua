local M = {
  disable = true
}

M.config = function()
  require("mini.surround").setup()

  require("mini.cursorword").setup(
    {
      -- Delay (in ms) between when cursor moved and when highlighting appeared
      delay = 100
    }
  )

  require("mini.starteer").setup(
    {
      -- Whether to open starter buffer on VimEnter. Not opened if Neovim was
      -- started with intent to show something else.
      autoopen = true,
      -- Whether to evaluate action of single active item
      evaluate_single = false,
      -- Items to be displayed. Should be an array with the following elements:
      -- - Item: table with <action>, <name>, and <section> keys.
      -- - Function: should return one of these three categories.
      -- - Array: elements of these three types (i.e. item, array, function).
      -- If `nil` (default), default items will be used (see |mini.starter|).
      items = nil,
      -- Header to be displayed before items. Converted to single string via
      -- `tostring` (use `\n` to display several lines). If function, it is
      -- evaluated first. If `nil` (default), polite greeting will be used.
      header = nil,
      -- Footer to be displayed after items. Converted to single string via
      -- `tostring` (use `\n` to display several lines). If function, it is
      -- evaluated first. If `nil` (default), default usage help will be shown.
      footer = nil,
      -- Array  of functions to be applied consecutively to initial content.
      -- Each function should take and return content for 'Starter' buffer (see
      -- |mini.starter| and |MiniStarter.content| for more details).
      content_hooks = nil,
      -- Characters to update query. Each character will have special buffer
      -- mapping overriding your global ones. Be careful to not add `:` as it
      -- allows you to go into command mode.
      query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-."
    }
  )
  require("mini.sessions").setup(
    {
      -- Whether to read latest session if Neovim opened without file arguments
      autoread = false,
      -- Whether to write current session before quitting Neovim
      autowrite = true,
      -- Directory where global sessions are stored (use `''` to disable)
      directory = vim.fn.stdpath("data") .. "/session/", --<"session" subdir of user data directory from |stdpath()|>,
      -- File for local session (use `''` to disable)
      file = "Session.vim",
      -- Whether to force possibly harmful actions (meaning depends on function)
      force = {read = false, write = true, delete = false},
      -- Hook functions for actions. Default `nil` means 'do nothing'.
      hooks = {
        -- Before successful action
        pre = {read = nil, write = nil, delete = nil},
        -- After successful action
        post = {read = nil, write = nil, delete = nil}
      },
      -- Whether to print session path after action
      verbose = {read = false, write = true, delete = true}
    }
  )

  require("mini.jump").setup(
    {
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        forward = "f",
        backward = "F",
        forward_till = "t",
        backward_till = "T",
        repeat_jump = ";"
      },
      -- Delay values (in ms) for different functionalities. Set any of them to
      -- a very big number (like 10^7) to virtually disable.
      delay = {
        -- Delay between jump and highlighting all possible jumps
        highlight = 250,
        -- Delay between jump and automatic stop if idle (no jump is done)
        idle_stop = 10000000
      }
    }
  )
  require("mini.bufremove").setup(
    {
      -- Whether to set Vim's settings for buffers (allow hidden buffers)
      set_vim_settings = true
    }
  )

  require("mini.comment").setup(
    {
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Toggle comment (like `gcip` - comment inner paragraph) for both
        -- Normal and Visual modes
        comment = "gc",
        -- Toggle comment on current line
        comment_line = "gcc",
        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        textobject = "gc"
      },
      -- Hook functions to be executed at certain stage of commenting
      hooks = {
        -- Before successful commenting. Does nothing by default.
        pre = function()
        end,
        -- After successful commenting. Does nothing by default.
        post = function()
        end
      }
    }
  )
end
return M
