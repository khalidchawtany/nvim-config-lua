local M = {
  keys = {"<c-p><-0>"},
  module = "snap"
}

M.config = function()
  vim.cmd [[ nnoremap  <silent> <C-p><c-.> <cmd>lua require('configs/snap').fzf()<cr> ]]
end

M.fzf = function()
  local snap = require("snap")
  snap.run {
    -- producer = snap.get 'consumer.fzf'(snap.get 'producer.ripgrep.file'),
    -- producer = snap.get 'consumer.fzy'(snap.get 'producer.fd.file'),
    producer = snap.get "consumer.fzf"(snap.get "producer.fd.file"),
    select = snap.get "select.file".select,
    multiselect = snap.get "select.file".multiselect,
    views = {snap.get "preview.file"}
  }
end

return M
