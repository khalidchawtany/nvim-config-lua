local M = {disable = true, opt = true, requires = {'kyazdani42/nvim-web-devicons'}}
M.config = function()

    vim.cmd [[
        nnoremap <silent>    <M-,> :BufferPrevious<CR>
        nnoremap <silent>    <M-.> :BufferNext<CR>

        nnoremap <silent>    <M-<> :BufferMovePrevious<CR>
        nnoremap <silent>    <M->> :BufferMoveNext<CR>

        nnoremap <silent>    <M-1> :BufferGoto 1<CR>
        nnoremap <silent>    <M-2> :BufferGoto 2<CR>
        nnoremap <silent>    <M-3> :BufferGoto 3<CR>
        nnoremap <silent>    <M-4> :BufferGoto 4<CR>
        nnoremap <silent>    <M-5> :BufferGoto 5<CR>
        nnoremap <silent>    <M-6> :BufferGoto 6<CR>
        nnoremap <silent>    <M-7> :BufferGoto 7<CR>
        nnoremap <silent>    <M-8> :BufferGoto 8<CR>
        nnoremap <silent>    <M-9> :BufferLast<CR>

        nnoremap <silent>    <M-c> :BufferClose<CR>

        " Wipeout buffer
        "                          :BufferWipeout<CR>
        " Close commands
        "                          :BufferCloseAllButCurrent<CR>
        "                          :BufferCloseBuffersLeft<CR>
        "                          :BufferCloseBuffersRight<CR>

        " Magic buffer-picking mode
        nnoremap <silent> <C-s>    :BufferPick<CR>

        " Sort automatically by...
        nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
        nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>

        " Other:
        " :BarbarEnable - enables barbar (enabled by default)
        " :BarbarDisable - very bad command, should never be used
        ]]
end

return M
