local M = {
  module = "fzf-lua",
  cmd = {"FzfLua"}
}

M.init = function()
  vim.cmd [[
  nnoremap <silent><D-p><D-p>  :lua require('fzf-lua').files({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-l>  :lua require('fzf-lua').lines({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p>l      :lua require('fzf-lua').blines({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-o>  :lua require('fzf-lua').buffers({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-u>  :lua require('fzf-lua').oldfiles({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-'>  :lua require('fzf-lua').marks({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-[>  :lua require('fzf-lua').tabs({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-a>  :lua require('fzf-lua').live_grep({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-j>  :lua require('fzf-lua').live_grep_resume({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-\>  :lua require('fzf-lua').grep_curbuf({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p>\      :lua require('fzf-lua').grep_cword({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-g>  :lua require('fzf-lua').git_status	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-c>  :lua require('fzf-lua').git_commits	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p>c      :lua require('fzf-lua').git_bcommits	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-b>  :lua require('fzf-lua').git_branches	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-m>  :lua require('fzf-lua').keymaps	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-r>  :lua require('fzf-lua').registers	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-cr> :lua require('fzf-lua').commands	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>

  ]]

  -- buffers  => open buffers
  -- files    => find or fd on a path
  -- oldfiles => opened files history
  -- quickfix => quickfix list
  -- loclist  => location list

  -- grep            => search for a pattern with grep or rg
  -- grep_last       => run search again with the last pattern
  -- grep_cword      => search word under cursor
  -- grep_cWORD      => search WORD under cursor
  -- grep_visual     => search visual selection
  -- grep_curbuf     => live grep current buffer
  -- live_grep       => live grep current project

  -- git_files      => git ls-files
  -- git_status     => git status
  -- git_commits    => git commit log (project)
  -- git_bcommits   => git commit log (buffer)
  -- git_branch     > git branches

  -- lsp_references             => References
  -- lsp_definitions            => Definitions
  -- lsp_declarations           => Declarations
  -- lsp_typedefs               => Type Definitions
  -- lsp_implementations        => Implementations
  -- lsp_document_symbols       => Document Symbols
  -- lsp_workspace_symbols      => Workspace Symbols
  -- lsp_code_actions           => Code Actions
  -- lsp_document_diagnostics   => Document Diagnostics
  -- lsp_workspace_diagnostics  => Workspace Diagnostics

  -- builtin         => fzf-lua builtin methods
  -- help_tags       => help tags
  -- man_pages       => man pages
  -- colorschemes    => color schemes
  -- commands        => neovim commands
  -- command_history => command history
  -- search_history  => search history
  -- marks           => :marks
  -- registers       => :registers
  -- keymaps         => key mappings
  -- spell_suggest   => spelling suggestions
  -- tags            => project tags
  -- btags           => buffer tags

  -- :lua require('fzf-lua').files({ cwd = '~/.config' })
  -- :lua require('fzf-lua').files({ fzf_layout = 'reverse-list' })
end

M.config = function()
  require "fzf-lua".setup {
    -- fzf_bin = "sk",
  }
end

return M

