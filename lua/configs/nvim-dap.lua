local M = {}

M.config = function()

    local dap = require('dap')
    dap.adapters.php = {type = 'executable', command = 'node', args = {'/Users/juju/.local/share/nvim/debuggers/vscode-php-debug/out/phpDebug.js'}}

    dap.configurations.php = {{type = 'php', request = 'launch', name = 'Listen for Xdebug', server = '127.0.0.1', port = 9003}}

    vim.fn.sign_define('DapBreakpoint', {text = '🟥', texthl = '', linehl = '', numhl = ''})
    vim.fn.sign_define('DapStopped', {text = '⭐️', texthl = '', linehl = '', numhl = ''})

    vim.cmd [[
    nnoremap <leader>dh :lua require'dap'.toggle_breakpoint()<CR>
    nnoremap <S-k> :lua require'dap'.step_out()<CR>
    nnoremap <S-l> :lua require'dap'.step_into()<CR>
    nnoremap <S-j> :lua require'dap'.step_over()<CR>
    nnoremap <leader>ds :lua require'dap'.stop()<CR>
    nnoremap <leader>dn :lua require'dap'.continue()<CR>
    nnoremap <leader>dk :lua require'dap'.up()<CR>
    nnoremap <leader>dj :lua require'dap'.down()<CR>
    nnoremap <leader>d_ :lua require'dap'.run_last()<CR>
    nnoremap <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
    nnoremap <leader>di :lua require'dap.ui.variables'.hover()<CR>
    vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>
    nnoremap <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
    nnoremap <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>
    nnoremap <leader>da :lua require'debugHelper'.attach()<CR>
    nnoremap <leader>dA :lua require'debugHelper'.attachToRemote()<CR>

" new!
    nnoremap <leader>di :lua require'dap.ui.widgets'.hover()<CR>
    nnoremap <leader>d? :lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>


    nnoremap <leader>df :Telescope dap frames<CR>
    nnoremap <leader>dc :Telescope dap commands<CR>
    nnoremap <leader>db :Telescope dap list_breakpoints<CR>

" Dap UI"
    nnoremap <leader>dq :lua require("dapui").toggle()<CR>
]]

    require('telescope').setup()
    require('telescope').load_extension('dap')
    require("dapui").setup()

    vim.g.dap_virtual_text = true

end

return M
