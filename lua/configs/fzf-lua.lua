local M = {
  module = "fzf-lua",
  cmd = {"FzfLua"}
}


M.init = function()
  vim.cmd [[

  nnoremap <silent><D-p>-  <cmd>lua require('fzf-lua').lsp_document_symbols({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-->  <cmd>lua require('fzf-lua').lsp_document_symbols({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-p>  <cmd>lua require('fzf-lua').files({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-l>  <cmd>lua require('fzf-lua').lines({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p>l      <cmd>lua require('fzf-lua').blines({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-o>  <cmd>lua require('fzf-lua').buffers({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-u>  <cmd>lua require('fzf-lua').oldfiles({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-'>  <cmd>lua require('fzf-lua').marks({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-[>  <cmd>lua require('fzf-lua').tabs({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-j>  <cmd>lua require('fzf-lua').grep_project({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p>j      <cmd>lua require('fzf-lua').live_grep_native({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-a>  <cmd>lua require('fzf-lua').live_grep({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p>a      <cmd>lua require('fzf-lua').live_grep_glob({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p>r      <cmd>lua require('fzf-lua').live_grep_resume({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-r>  <cmd>lua require('fzf-lua').resume({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-\>  <cmd>lua require('fzf-lua').grep_curbuf({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p>\      <cmd>lua require('fzf-lua').grep_cword({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-g>  <cmd>lua require('fzf-lua').git_status	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p>g      <cmd>lua require('fzf-lua').git_status	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-v>  <cmd>lua require('fzf-lua').git_status	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p>v      <cmd>lua require('fzf-lua').git_status	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-c>  <cmd>lua require('fzf-lua').git_commits	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p>c      <cmd>lua require('fzf-lua').git_bcommits	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-b>  <cmd>lua require('fzf-lua').git_branches	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-m>  <cmd>lua require('fzf-lua').keymaps	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-'>  <cmd>lua require('fzf-lua').registers	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-'>  <cmd>lua require('fzf-lua').registers	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>
  nnoremap <silent><D-p><D-cr> <cmd>lua require('fzf-lua').commands	({  preview_layout='vertical', preview_vertical="down", fzf_layout="reverse", preview_border="noborder" })<cr>

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
    fzf_bin = "fzf", --sk
  }
end

return M

