local M = {
  branch = "v2.x",
  requires = {
    "MunifTanjim/nui.nvim",
    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim"
  },
}

M.config = function()
  vim.cmd [[
  nnoremap \- <cmd>Neotree right reveal<cr>
  nnoremap <space>- <cmd>Neotree left reveal<cr>
  nnoremap - :Neotree float reveal dir=<c-r>=expand('%:h')<cr><cr>
  nnoremap <c--> <cmd>Neotree float reveal<cr>
  nnoremap \g <cmd>Neotree float git_status<cr>
  nnoremap \b <cmd>Neotree float buffers<cr>
  ]]

  require("neo-tree").setup(
    {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = false,
        filtered_items = {
          visible = true, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = true,
          hide_gitignored = true
        },
        window = {
          mappings = {
            ["<bs>"] = "navigate_up",
            ["-"] = "navigate_up",
            ["."] = "set_root",
            ["O"] = "close_all_nodes",
            ["I"] = "show_debug_info",
            ["H"] = "toggle_hidden",
            ["/"] = "fuzzy_finder",
            ["f"] = "filter_on_submit",
            ["<c-x>"] = "clear_filter"
          }
        }
      }
    }
  )
end

return M
