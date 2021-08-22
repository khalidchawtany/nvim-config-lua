local M = {
  requires = "kana/vim-textobj-user",
  keys = {"<Plug>(textobj-anyblock-i)", "<Plug>(textobj-anyblock-a)"}
}

M.init = function()
  vim.g.textobj_anyblock_no_default_key_mappings = true
  vim.cmd [[
    Map vo i<cr> <Plug>(textobj-anyblock-i)
    Map vo a<cr> <Plug>(textobj-anyblock-a)
  ]]
end

M.setup = function()
  require("packer").loader("vim-textobj-user")
end
return M
