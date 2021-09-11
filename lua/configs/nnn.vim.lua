local M = {cmd = {'NnnPicker'}}

M.init = function ()
    --nnoremap <silent> =- :exec 'NnnPicker ' . expand('%:p:h')<CR>
    --nnoremap <silent> =0 :NnnPicker<CR>
    --vim.g.nnn['command'] = "NNN_COLORS='4321' nnn -d"
    vim.cmd [[ nnoremap _ <cmd>exec 'NnnPicker ' . expand('%:p:h')<cr> ]]
end

M.config = function()
    vim.cmd [[
                let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
                let g:nnn#session = 'global'
                let g:nnn#set_default_mappings = 0
                let g:nnn#action = { '<c-t>': 'tab split', '<c-x>': 'split', '<c-v>': 'vsplit' }
            ]]
end

return M

