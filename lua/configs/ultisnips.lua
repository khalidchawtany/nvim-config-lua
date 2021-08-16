local M = {
    event = {'InsertEnter'},
    -- keys = {{'i', '<C-CR>'}},
    -- cmd = {'UltiSnipsEdit'},
}

local setup = function ()
    vim.g.UltiSnipsEnableSnipMate = 0
    vim.g.UltiSnipsExpandTrigger = "<c-cr>"
    vim.g.UltiSnipsJumpForwardTrigger = "<c-cr>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<M-cr>"

    vim.g.ultisnips_java_brace_style = "nl"
    vim.g.Ultisnips_java_brace_style = "nl"
    vim.g.UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"

    -- vim.cmd [[call UltiSnips#FileTypeChanged()]]
    -- vim.cmd [[au VimEnter * au! UltiSnipsFileType]]
    -- vim.g.UltiSnipsSnippetDirectories = [ "/Volumes/Home/.config/nvim/plugged/vim-snippets/UltiSnips"]
end

M.init = setup
M.config = setup


return M
