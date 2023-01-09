return {
  "ThePrimeagen/harpoon",
  dependencies = {"nvim-lua/plenary.nvim", "nvim-lua/popup.nvim", "nvim-telescope/telescope.nvim"},
  keys = {
    {"<leader>h<leader>", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon (Toggle)"},
    {"<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon (Toggle)"},
    {"<leader>ha", ":lua require('harpoon.mark').add_file()<cr>", desc = "Harpoon (Add)"},
    {"<leader>hc", ":lua require('harpoon.cmd-ui').toggle_quick_menu()<cr>", desc = "Harpoon (Toggle)"},
    {"<leader>h1", ":lua require('harpoon.ui').nav_file(1)<cr>", desc = "Harpoon (1)"},
    {"<leader>h2", ":lua require('harpoon.ui').nav_file(2)<cr>", desc = "Harpoon (2)"},
    {"<leader>h3", ":lua require('harpoon.ui').nav_file(3)<cr>", desc = "Harpoon (3)"},
    {"<leader>h4", ":lua require('harpoon.ui').nav_file(4)<cr>", desc = "Harpoon (4)"},
    {"<leader>h5", ":lua require('harpoon.ui').nav_file(5)<cr>", desc = "Harpoon (5)"},
    {"<leader>h6", ":lua require('harpoon.ui').nav_file(6)<cr>", desc = "Harpoon (6)"},
    {"<leader>h7", ":lua require('harpoon.ui').nav_file(7)<cr>", desc = "Harpoon (7)"},
    {"<leader>h8", ":lua require('harpoon.ui').nav_file(8)<cr>", desc = "Harpoon (8)"},
    {"<leader>h9", ":lua require('harpoon.ui').nav_file(9)<cr>", desc = "Harpoon (9)"},
    {"<leader>h0", ":lua require('harpoon.ui').nav_file(10)<cr>", desc = "Harpoon (10)"},
    {"<c-s><c-space>", ":Telescope harpoon marks<cr>", desc = "Harpoon (Telescope)"},
    {"<c-space><c-space>", ":Telescope harpoon marks<cr>", desc = "Harpoon (Telescope)"}
  },
  config = function()
    require("harpoon").setup(
      {
        global_settings = {
          save_on_toggle = false,
          save_on_change = true,
          enter_on_sendcmd = false,
          excluded_filetypes = {"harpoon"},
          -- set marks specific to each git branch inside git repository
          mark_branch = true
        },
        menu = {
          width = vim.api.nvim_win_get_width(0) - 4
        }
        -- ... your other configs ...
        -- projects = {
        -- ["$HOME/personal/vim-with-me/server"] = {
        --     term = {
        --         cmds = {
        --             "./env && npx ts-node src/index.ts"
        --         }
        --     }
        -- },
      }
    )

    require("telescope").load_extension("harpoon")
  end
}
