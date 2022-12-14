local M = {
  branch = "v2.x",
  requires = {
    "MunifTanjim/nui.nvim",
    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim"
  }
}

M.init = function()
  vim.g.neo_tree_remove_legacy_commands = 1
 -- let g:neo_tree_remove_legacy_commands=1
end

M.config = function()
  vim.cmd [[
  nnoremap <silent> -- :Neotree float reveal dir=<c-r>=expand('%:h')<cr> reveal_force_cwd<cr>
  nnoremap <silent> -r <cmd>Neotree right reveal<cr>
  nnoremap <silent> -l <cmd>Neotree left reveal<cr>
  nnoremap <silent> -f <cmd>Neotree float reveal<cr>
  nnoremap <silent> -g <cmd>Neotree float git_status<cr>
  nnoremap <silent> -b <cmd>Neotree float buffers<cr>
  nnoremap <silent> -0 :Neotree float dir=<c-r>=FindGitDirOrRoot()<cr><cr>
  nnoremap <silent> -<space> <cmd>Neotree float buffers<cr>
  ]]

require("neo-tree").setup(
  {
   sources = {
        "filesystem", -- Neotree filesystem source
        "buffers", -- Neotree filesystem source
        "git_status", -- Neotree filesystem source
        "netman.ui.neo-tree", -- The one you really care about 😉
    },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = false,
      filtered_items = {
        visible = true, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = true,
        hide_gitignored = true
      },
      commands = {
        navigate_to_root = function(state)
          local fs = require("neo-tree.sources.filesystem")
          local root_path = vim.api.nvim_call_function('FindGitDirOrRoot', {})
          fs._navigate_internal(state, root_path, nil, nil, false)
        end,
      },
      window = {
        mappings = {
          ["<bs>"] = "navigate_up",
          ["0"] = "navigate_to_root",
          ["_"] = "navigate_up",
          ["-"] = function(state)
            local node = state.tree:get_node()

            if state.path == node.path or state.path == node:get_parent_id() then
              require "neo-tree.ui.renderer".focus_node(state, node:get_parent_id())
              state.commands["navigate_up"](state)
              return
            end

            require "neo-tree.ui.renderer".focus_node(state, node:get_parent_id())
            state.commands["toggle_directory"](state)
          end,
          ["."] = "set_root",
          ["O"] = "close_all_nodes",
          ["I"] = "show_debug_info",
          ["H"] = "toggle_hidden",
          ["/"] = "fuzzy_finder",
          ["f"] = "filter_on_submit",
          ["<c-x>"] = "clear_filter",
          ["h"] = function(state)
            local node = state.tree:get_node()
            if node.type == "directory" and node:is_expanded() then
              require "neo-tree.sources.filesystem".toggle_directory(state, node)
            else
              require "neo-tree.ui.renderer".focus_node(state, node:get_parent_id())
            end
          end,
          ["l"] = function(state)
            local node = state.tree:get_node()
            if node.type == "directory" then
              if not node:is_expanded() then
                require "neo-tree.sources.filesystem".toggle_directory(state, node)
              elseif node:has_children() then
                require "neo-tree.ui.renderer".focus_node(state, node:get_child_ids()[1])
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
