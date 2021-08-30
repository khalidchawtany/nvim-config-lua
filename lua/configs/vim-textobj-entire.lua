local M = {
  requires = "kana/vim-textobj-user",
  keys = {
    "<Plug>(textobj-entire-i)",
    "<Plug>(textobj-entire-a)"
  }
}

M.init = function()
  vim.g.textobj_entire_no_default_key_mappings = true
  vim.cmd [[
    Map vo iG <Plug>(textobj-entire-i)
    Map vo aG <Plug>(textobj-entire-a)
  ]]
end

M.setup = function()
  require("packer").loader("vim-textobj-user")
end
return M
