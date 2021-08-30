local M = {
  keys = {
    "<Plug>(textobj-key-a)",
    "<Plug>(textobj-key-i)",
    "<Plug>(textobj-value-a)",
    "<Plug>(textobj-value-i)"
  }
}

M.init = function()
  vim.g.textobj_key_no_default_key_mappings = true
  vim.cmd [[
        Map vo ak  <Plug>(textobj-key-a)
        Map vo ik  <Plug>(textobj-key-i)
        Map vo aK  <Plug>(textobj-value-a)
        Map vo iK  <Plug>(textobj-value-i)
    ]]
end

return M
