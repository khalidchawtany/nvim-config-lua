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
            nnoremap <c-s>w <cmd>HopWord<cr>

            nnoremap <c-s>/ <cmd>HopPattern<cr>
            nnoremap <c-s>s <cmd>HopChar1<cr>
            nnoremap <c-s>g <cmd>HopChar2<cr>

            nnoremap <c-s>j <cmd>HopLine<cr>
            nnoremap <c-s>k <cmd>HopLine<cr>

            nnoremap <c-s><leader> <cmd>HopWordCurrentLine<cr>
            ]]
end

return M
