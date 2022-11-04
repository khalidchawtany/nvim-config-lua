local M = {
  module = "portal"
}

M.init = function()
  for _,keys in pairs({"s<c-o>", "<c-s>o"}) do
    vim.keymap.set(
      "n",
      keys,
      function()
        require("portal").jump_backward()
      end,
      {desc = "Portal (JumpBackward)"}
    )
  end

  for _, keys in pairs({"s<c-i>", "<c-s>i"}) do
    vim.keymap.set(
      "n",
      keys,
      function()
        require("portal").jump_forward()
      end,
      {desc = "Portal (JumpForward)"}
    )
  end
end

M.config = function()
  require("portal").setup(
    {
      jump = {
        --- The default queries used when searching the jumplist. An entry can
        --- be a name of a registered query item, an anonymous predicate, or
        --- a well-formed query item. See Queries section for more information.
        --- @type Portal.QueryLike[]
        query = {"tagged", "modified", "different", "valid"},
        labels = {
          --- An ordered list of keys that will be used for labelling
          --- available jumps. Labels will be applied in same order as
          --- `jump.query`
          select = {"j", "k", "h", "l"},
          --- Keys which will exit portal selection
          escape = {
            ["<esc>"] = true
          }
        },
        --- Keys used for jumping forward and backward
        keys = {
          forward = "<c-i>",
          backward = "<c-o>"
        }
      },
      tag = {
        --- The default scope in which tags will be saved to
        --- Only "global" and "none" has been implemented for now
        --- @type Portal.Scope
        scope = types.Scope.GLOBAL,
        save_path = vim.fn.stdpath("data") .. "/" .. "portal.json"
      },
      window = {
        title = {
          --- When a portal is empty, render an default portal title
          render_empty = true,
          --- The raw window options used for the title window
          options = {
            relative = "cursor",
            width = 80,
            height = 1,
            col = 2,
            style = "minimal",
            focusable = false,
            border = "single",
            noautocmd = true,
            zindex = 98
          }
        },
        portal = {
          -- When a portal is empty, render an empty buffer body
          render_empty = false,
          --- The raw window options used for the portal window
          options = {
            relative = "cursor",
            width = 80,
            height = 3,
            col = 2,
            focusable = false,
            border = "single",
            noautocmd = true,
            zindex = 99
          }
        }
      }
    }
  )
end

return M
