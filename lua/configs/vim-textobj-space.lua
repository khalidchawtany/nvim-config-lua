local M = {
  requires = "kana/vim-textobj-user",
  keys = {
    "<Plug>(textobj-space-i)",
    "<Plug>(textobj-space-a)"
  }
}

M.init = function()
  vim.g.textobj_space_no_default_key_mappings = true
  vim.cmd [[
    Map vo i<space> <Plug>(textobj-space-i)
    Map vo a<space> <Plug>(textobj-space-a)
  ]]
end

M.setup = function()
  require("packer").loader("vim-textobj-user")
end
return M
