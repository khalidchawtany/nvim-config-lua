local M = {event = {'InsertEnter'}}
-- keys = {'<c-cr>'},
-- cmd = {'UltiSnipsEdit'},

M.config = function()

    -- vim.cmd [[call UltiSnips#FileTypeChanged()]]

    -- vim.cmd [[au VimEnter * au! UltiSnipsFileType]]

    vim.g.UltiSnipsEnableSnipMate = 0
    vim.g.UltiSnipsExpandTrigger = "<c-cr>"
    vim.g.UltiSnipsJumpForwardTrigger = "<c-cr>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<M-cr>"

    vim.g.ultisnips_java_brace_style = "nl"
    vim.g.Ultisnips_java_brace_style = "nl"
    vim.g.UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
    -- vim.g.UltiSnipsSnippetDirectories = [ "/Volumes/Home/.config/nvim/plugged/vim-snippets/UltiSnips"]
end

return M
