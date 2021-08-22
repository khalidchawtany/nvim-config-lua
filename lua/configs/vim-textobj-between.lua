local M = {
  requires = "kana/vim-textobj-user",
  keys = {
    "<Plug>(textobj-between-i)",
    "<Plug>(textobj-between-a)"
  }
}

M.init = function()
  vim.g.textobj_between_no_default_key_mappings = true
  vim.cmd [[
    Map vo is <Plug>(textobj-between-i)
    Map vo as <Plug>(textobj-between-a)
  ]]
end

M.setup = function()
  require("packer").loader("vim-textobj-user")
end
return M
