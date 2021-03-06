local M = {
  as = "hop",
  branch = 'v2', -- optional
  cmd = {
    "HopWord",
    "HopPattern",
    "HopChar1",
    "HopChar2",
    "HopLine",
    "HopAnywhere"
  }
}
M.config = function()
  -- you can configure Hop the way you like here; see :h hop-config
  require "hop".setup {keys = "etovxqpdygfblzhckisuran"}
end

M.init = function()
  -- vim.api.nvim_set_keymap('n', '$', "<cmd>lua require'hop'.hint_words()<cr>", {})
  vim.cmd [[
            nnoremap <leader>sw <cmd>HopWord<cr>

            nnoremap <leader>s/ <cmd>HopPattern<cr>
            nnoremap <leader>s<leader> <cmd>HopAnywhere<cr>
            nnoremap <leader>ss <cmd>HopChar1<cr>
            nnoremap <leader>sf <cmd>HopChar2<cr>

            nnoremap <leader>sj <cmd>HopLine<cr>
            ]]
end

return M
