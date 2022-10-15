local M = {
  as = "hop",
  branch = 'v2', -- optional
  cmd = {
    "HopWord",
    "HopLine",
    "HopWordCurrentLine"
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

            nnoremap <c-s>j <cmd>HopLine<cr>
            nnoremap <c-s>k <cmd>HopLine<cr>

            nnoremap <c-s><leader> <cmd>HopWordCurrentLine<cr>
            ]]
end

return M
