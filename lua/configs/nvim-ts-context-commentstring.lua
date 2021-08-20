local M = {
    init = function()
        require'nvim-treesitter.configs'.setup {
            context_commentstring = {enable = true},
            enable_autocmd = false
        }
    end
}
