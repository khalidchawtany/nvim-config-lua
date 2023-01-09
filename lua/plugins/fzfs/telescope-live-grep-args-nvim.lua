return {
  "nvim-telescope/telescope-live-grep-args.nvim",
  dependencies = {"nvim-telescope/telescope.nvim"},
  keys = {
    {
      "<c-s><c-j>",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args(
          {
            prompt_title = "Live Grep (Args)"
          }
        )
      end,
      desc = "Telescope live_grep_args"
    }
  },
  config = function()
    require("telescope").setup {
      extensions = {
        live_grep_args = {
          -- auto_quoting = true, -- enable/disable auto-quoting
          -- override default mappings
          default_mappings = {
            i = {
              ["<C-'>"] = require("telescope-live-grep-args.actions").quote_prompt() -- k for kwote :D - q is already taken
            }
          },
          mappings = {
            -- extend mappings
            i = {
              ["<C-'>"] = require("telescope-live-grep-args.actions").quote_prompt() -- k for kwote :D - q is already taken
              -- ["<C-;>"] = require("telescope-live-grep-args.actions").actions.quote_prompt({postfix = " --iglob "}),
              -- ["<C-\\>"] = require("telescope-live-grep-args.actions").actions.actions.quote_prompt({postfix = " -t"})
            }
          }
        }
      }
    }
    require("telescope").load_extension("live_grep_args")
  end
}
