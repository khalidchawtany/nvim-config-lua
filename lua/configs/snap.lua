local M = {}

local snap = require('snap')

M.init = function()
    vim.cmd [[ nnoremap  <silent> <C-p><c-0> :silent! lua require('configs/snap').fzf()<cr> ]]
end

M.fzf = function()
    snap.run {
        -- producer = snap.get 'consumer.fzf'(snap.get 'producer.ripgrep.file'),
        -- producer = snap.get 'consumer.fzy'(snap.get 'producer.fd.file'),
        producer = snap.get 'consumer.fzf'(snap.get 'producer.fd.file'),
        select = snap.get'select.file'.select,
        multiselect = snap.get'select.file'.multiselect,
        views = {snap.get 'preview.file'}
    }
end

return M
