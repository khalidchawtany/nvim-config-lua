local M = {
  requires = "kana/vim-textobj-user",
  keys = {
    "<Plug>(textobj-delimited-forward-i)",
    "<Plug>(textobj-delimited-forward-a)",
    "<Plug>(textobj-delimited-backward-i)",
    "<Plug>(textobj-delimited-backward-a)"
  }
}

M.init = function()
  vim.cmd [[
    Map vo id <Plug>(textobj-delimited-forward-i)
    Map vo ad <Plug>(textobj-delimited-forward-a)
    Map vo iD <Plug>(textobj-delimited-backward-i)
    Map vo aD <Plug>(textobj-delimited-backward-a)
  ]]
end

M.setup = function()
  require("packer").loader("vim-textobj-user")
end
return M
