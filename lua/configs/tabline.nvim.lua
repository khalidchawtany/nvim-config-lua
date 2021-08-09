local M = {
    requires = { { 'hoob3rt/lualine.nvim', opt=true }, 'kyazdani42/nvim-web-devicons' }
}

M.config = function()
    require'tabline'.setup {
        --tabline_show_bufnr = true,
    }
    vim.cmd[[
    set guioptions-=e " Use showtabline in gui vim
    set sessionoptions+=tabpages,globals " store tabpages and globals in session

    let g:tabline_show_filename_only=v:true
    let g:tabline_show_bufnr = v:false

    nnoremap <leader>tr :TablineTabRename 

    ]]
end


return M
