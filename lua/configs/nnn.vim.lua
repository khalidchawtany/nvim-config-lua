local M = {cmd = {'NnnPicker', 'Np'}}

M.config = function()
    vim.cmd [[
                let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
                let g:nnn#session = 'global'
                let g:nnn#set_default_mappings = 0
                let g:nnn#action = { '<c-t>': 'tab split', '<c-x>': 'split', '<c-v>': 'vsplit' }
            ]]
end

return M

