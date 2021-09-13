local M = {
  module = "snap"
}

M.init = function()
  vim.cmd [[
    nnoremap  <silent> <C-space><c-p> <cmd>lua require('configs/snap').fzf()<cr>
    nnoremap  <silent> <C-space><c-o> <cmd>lua require('configs/snap').buffer()<cr>
    nnoremap  <silent> <C-space><c-u> <cmd>lua require('configs/snap').oldfile()<cr>
    nnoremap  <silent> <C-space><c-l> <cmd>lua require('configs/snap').luvfile()<cr>
  ]]
end

M.config = function()
  -- local snap = require("snap")
  -- snap.maps {
  --   {"<c-space>p", snap.config.file {producer = "ripgrep.file"}},
  --   {"<c-space>o", snap.config.file {producer = "vim.buffer"}},
  --   {"<c-space>u", snap.config.file {producer = "vim.oldfile"}},
  --   {"<c-space>j", snap.config.vimgrep {}}
  -- }
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

M.buffer = function()
  local snap = require("snap")
  snap.run {
    producer = snap.get "consumer.fzf"(snap.get "producer.vim.buffer"),
    select = snap.get "select.file".select
  }
end

M.oldfile = function()
  local snap = require("snap")
  snap.run {
    producer = snap.get "consumer.fzf"(snap.get "producer.vim.oldfile"),
    select = snap.get "select.file".select
  }
end

M.luvfile = function()
  local snap = require("snap")
  snap.run {
    producer = snap.get "consumer.fzf"(snap.get "producer.luv.file"),
    select = snap.get "select.file".select
  }
end

return M
