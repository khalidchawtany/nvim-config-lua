return {
  "cbochs/portal.nvim",
  dependencies = {"cbochs/grapple.nvim"},
  config = function()
    require("portal").setup(
      {
        ---@type "debug" | "info" | "warn" | "error"
        log_level = "warn",
        -- stylua: ignore
        ---The base filter that is applied to every search.
        ---@type Portal.SearchPredicate
        filter = function(v)
          return vim.api.nvim_buf_is_valid(v.buffer)
        end,
        ---The maximum number of results that can be returned.
        ---@type integer
        max_results = 4,
        ---The maximum number of items that can be searched.
        ---@type integer
        lookback = 100,
        ---An ordered list of keys for labelling portals.
        ---Labels will be applied in order, or to match slotted results.
        ---@type string[]
        labels = {"j", "k", "h", "l"},
        ---Keys used for exiting portal selection. Disable with [{key}] = false
        ---to `false`.
        ---@type table<string, boolean>
        escape = {
          ["<esc>"] = true
        },
        ---The raw window options used for the portal window
        window_options = {
          relative = "cursor",
          width = 80, -- implement as "min/max width",
          height = 3, -- implement as "context lines"
          col = 2, -- implement as "offset"
          focusable = false,
          border = "single",
          noautocmd = true
        }
      }
    )
  end
}
