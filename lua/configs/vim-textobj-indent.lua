local M = {
  requires = "kana/vim-textobj-user",
  keys = {
    "<Plug>(textobj-indent-i)",
    "<Plug>(textobj-indent-a)",
    "<Plug>(textobj-indent-same-i)",
    "<Plug>(textobj-indent-same-a)"
  }
}

M.init = function()
  vim.g.textobj_indent_no_default_key_mappings = true
  vim.cmd [[
    Map vo ii <Plug>(textobj-indent-i)
    Map vo ai <Plug>(textobj-indent-a)
    Map vo iI <Plug>(textobj-indent-same-i)
    Map vo aI <Plug>(textobj-indent-same-a)
  ]]
end

M.setup = function()
  require("packer").loader("vim-textobj-user")
end
return M
