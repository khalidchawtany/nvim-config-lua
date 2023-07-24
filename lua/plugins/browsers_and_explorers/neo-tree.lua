_G.neotree_global_clipboard = {}

local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  event = "VimEnter",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim"
  },
  keys = {
    {
      "--",
      '<cmd>execute"Neotree float reveal dir=".expand("%:h")." reveal_force_cwd"<cr>',
      desc = "NeoTree (float"
    },
    {"-r", "<cmd>Neotree right reveal<cr>", desc = "NeoTree (Reveal right)"},
    {"-l", "<cmd>Neotree left reveal<cr>", desc = "NeoTree (Reveal left)"},
    {"-f", "<cmd>Neotree float reveal<cr>", desc = "NeoTree (Reveal float)"},
    {"-g", "<cmd>Neotree float git_status<cr>", desc = "NeoTree (Git status)"},
    {"-b", "<cmd>Neotree float buffers<cr>", desc = "NeoTree (Buffers)"},
    {"-<space>", "<cmd>Neotree float buffers<cr>", desc = "NeoTree (Buffers)"},
    {"<space>-", "<cmd>Neotree float buffers<cr>", desc = "NeoTree (Buffers)"},
    {"-0", '<cmd>execute"Neotree float dir=".FindGitDirOrRoot()<cr>', desc = "NeoTree (Root)"}
  }
  -- cmd = {"Neotree"},
}

M.init = function()
  vim.g.neo_tree_remove_legacy_commands = 1
  if vim.fn.argc() == 1 then
    local stat = vim.loop.fs_stat(vim.fn.argv(0))
    if stat and stat.type == "directory" then
      require("neo-tree")
    end
  end
end

M.config = function()
  require("neo-tree").setup(
    {
      sources = {
        "filesystem", -- Neotree filesystem source
        "buffers", -- Neotree filesystem source
        "git_status" -- Neotree filesystem source
        -- "netman.ui.neo-tree" -- The one you really care about 😉
      },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = {
			enabled = false,
		},
        filtered_items = {
          visible = true, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = true,
          hide_gitignored = true
        },
        commands = {
          navigate_to_root = function(state)
            local fs = require("neo-tree.sources.filesystem")
            local root_path = vim.api.nvim_call_function("FindGitDirOrRoot", {})
            fs._navigate_internal(state, root_path, nil, nil, false)
          end
        },
        window = {
          mappings = {
            ["<bs>"] = "navigate_up",
            ["0"] = "navigate_to_root",
            ["_"] = "navigate_up",
            ["-"] = function(state)
              local node = state.tree:get_node()

              if state.path == node.path or state.path == node:get_parent_id() then
                require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
                state.commands["navigate_up"](state)
                return
              end

              require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
              state.commands["toggle_directory"](state)
            end,
            ["."] = "set_root",
            ["O"] = "close_all_nodes",
            ["I"] = "show_debug_info",
            ["H"] = "toggle_hidden",
            ["/"] = "fuzzy_finder",
            ["f"] = "filter_on_submit",
            ["<c-x>"] = "clear_filter",
            ["y"] = function(state)
              -- local cc = require("neo-tree.sources.common.commands")
              local fs_cmds = require("neo-tree.sources.filesystem.commands")
              fs_cmds.copy_to_clipboard(state)
              table_merge(_G.neotree_global_clipboard, state.clipboard)
            end,
            ["p"] = function(state)
              -- local cc = require("neo-tree.sources.common.commands")
              local fs_cmds = require("neo-tree.sources.filesystem.commands")
			  state.clipboard = state.clipboard or {}
              table_merge(state.clipboard, _G.neotree_global_clipboard)
              fs_cmds.paste_from_clipboard(state)
              _G.neotree_global_clipboard = {}
            end,
            ["h"] = function(state)
              local node = state.tree:get_node()
              if node.type == "directory" and node:is_expanded() then
                require("neo-tree.sources.filesystem").toggle_directory(state, node)
              else
                require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
              end
            end,
            ["l"] = function(state)
              local node = state.tree:get_node()
              if node.type == "directory" then
                if not node:is_expanded() then
                  require("neo-tree.sources.filesystem").toggle_directory(state, node)
                elseif node:has_children() then
                  require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
                end
              end
            end
          }
        }
      }
    }
  )
end

return M
