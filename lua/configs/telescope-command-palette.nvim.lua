local M = {
  opt = true,
  after = "telescope.nvim"
}

M.config = function()
  require("telescope").load_extension("command_palette")
  CpMenu = {
    {
      "Help",
      {"tips", ":help tips"},
      {"cheatsheet", ":help index"},
      {"tutorial", ":help tutor"},
      {"summary", ":help summary"},
      {"quick reference", ":help quickref"},
      {"search help(F1)", ":lua require('telescope.builtin').help_tags()", 1},
      {
        "Vim",
        {"current working directory", ":pwd"},
        {"reload vimrc", ":source $MYVIMRC"}
      }
    }
  }
  table.insert(
    CpMenu,
    {
      "Dap",
      {"pause", ":lua require'dap'.pause()"},
      {"step into", ":lua require'dap'.step_into()"},
      {"step back", ":lua require'dap'.step_back()"},
      {"step over", ":lua require'dap'.step_over()"},
      {"step out", ":lua require'dap'.step_out()"},
      {"frames", ":lua require'telescope'.extensions.dap.frames{}"},
      {"current scopes", ':lua ViewCurrentScopes(); vim.cmd("wincmd w|vertical resize 40")'},
      {"current scopes floating window", ":lua ViewCurrentScopesFloatingWindow()"},
      {"current value floating window", ":lua ViewCurrentValueFloatingWindow()"},
      {"commands", ":lua require'telescope'.extensions.dap.commands{}"},
      {"configurations", ":lua require'telescope'.extensions.dap.configurations{}"},
      {"repl", ':lua require\'dap\'.repl.open(); vim.cmd("wincmd w|resize 12")'},
      {"close", ":lua require'dap'.close(); require'dap'.repl.close()"},
      {"run to cursor", ":lua require'dap'.run_to_cursor()"},
      {"continue", ":lua require'dap'.continue()"},
      {"clear breakpoints", ":lua require('dap.breakpoints').clear()"},
      {"brakpoints", ":lua require'telescope'.extensions.dap.list_breakpoints{}"},
      {"toggle breakpoint", ":lua require'dap'.toggle_breakpoint()"}
    }
  )
end

return M
