local M = {
  module = {"harpoon"},
  requires = {"nvim-lua/plenary.nvim", "nvim-lua/popup.nvim", "nvim-lua/telescope.nvim"}
}

M.mapKeys = function()
  vim.cmd [[
  nnoremap <silent> <leader>h<leader>  :lua require("harpoon.ui").toggle_quick_menu()<cr>
  nnoremap <silent> <leader>hh  :lua require("harpoon.ui").toggle_quick_menu()<cr>
  nnoremap <silent> <leader>ha         :lua require("harpoon.mark").add_file()<cr>
  nnoremap <silent> <leader>hc         :lua require('harpoon.cmd-ui').toggle_quick_menu()<cr>

  nnoremap <silent> <leader>h1         :lua require("harpoon.ui").nav_file(1)<cr>
  nnoremap <silent> <leader>h2         :lua require("harpoon.ui").nav_file(2)<cr>
  nnoremap <silent> <leader>h3         :lua require("harpoon.ui").nav_file(3)<cr>
  nnoremap <silent> <leader>h4         :lua require("harpoon.ui").nav_file(4)<cr>
  nnoremap <silent> <leader>h5         :lua require("harpoon.ui").nav_file(5)<cr>
  nnoremap <silent> <leader>h6         :lua require("harpoon.ui").nav_file(6)<cr>
  nnoremap <silent> <leader>h7         :lua require("harpoon.ui").nav_file(7)<cr>
  nnoremap <silent> <leader>h8         :lua require("harpoon.ui").nav_file(8)<cr>
  nnoremap <silent> <leader>h9         :lua require("harpoon.ui").nav_file(9)<cr>
  nnoremap <silent> <leader>h0         :lua require("harpoon.ui").nav_file(10)<cr>
  nnoremap <silent> <c-p><c-h>         :Telescope harpoon marks<cr>
  nnoremap <silent> <c-p><c-space>     :Telescope harpoon marks<cr>

  ]]
end

M.init = M.mapKeys

M.config = function()
  M.mapKeys()
  require("harpoon").setup(
    {
      global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
        excluded_filetypes = {"harpoon"}
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

  require("telescope").load_extension('harpoon')
end

return M
