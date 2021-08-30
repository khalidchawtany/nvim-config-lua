local M = {
  requires = "kana/vim-textobj-user",
  keys = {
    "<Plug>(textobj-line-i)",
    "<Plug>(textobj-line-a)",
  }
}

M.init = function()
  vim.g.textobj_line_no_default_key_mappings = true
  vim.cmd [[
    Map vo il <Plug>(textobj-line-i)
    Map vo al <Plug>(textobj-line-a)
  ]]
end

M.setup = function()
  require("packer").loader("vim-textobj-user")
end
return M
