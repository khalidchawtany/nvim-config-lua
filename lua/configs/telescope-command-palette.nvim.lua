local M = {
  opt = true,
  after = "telescope.nvim"
}

M.config = function()
  require("telescope").load_extension("command_palette")
  CpMenu = {
    {
      "File",
      {"entire selection (C-a)", ':call feedkeys("GVgg")'},
      {"save current file (C-s)", "<cmd>w"},
      {"save all files (C-A-s)", "<cmd>wa"},
      {"quit (C-q)", "<cmd>qa"},
      {"file browser (C-i)", "<cmd>lua require'telescope'.extensions.file_browser.file_browser()", 1},
      {"search word (A-w)", "<cmd>lua require('telescope.builtin').live_grep()", 1},
      {"git files (A-f)", "<cmd>lua require('telescope.builtin').git_files()", 1},
      {"files (C-f)", "<cmd>lua require('telescope.builtin').find_files()", 1}
    },
    {
      "Help",
      {"tips", "<cmd>help tips"},
      {"cheatsheet", "<cmd>help index"},
      {"tutorial", "<cmd>help tutor"},
      {"summary", "<cmd>help summary"},
      {"quick reference", "<cmd>help quickref"},
      {"search help(F1)", "<cmd>lua require('telescope.builtin').help_tags()", 1}
    },
    {
      "Vim",
      {"reload vimrc", "<cmd>source $MYVIMRC"},
      {"check health", "<cmd>checkhealth"},
      {"jumps (Alt-j)", "<cmd>lua require('telescope.builtin').jumplist()"},
      {"commands", "<cmd>lua require('telescope.builtin').commands()"},
      {"command history", "<cmd>lua require('telescope.builtin').command_history()"},
      {"registers (A-e)", "<cmd>lua require('telescope.builtin').registers()"},
      {"colorshceme", "<cmd>lua require('telescope.builtin').colorscheme()", 1},
      {"vim options", "<cmd>lua require('telescope.builtin').vim_options()"},
      {"keymaps", "<cmd>lua require('telescope.builtin').keymaps()"},
      {"buffers", "<cmd>Telescope buffers"},
      {"search history (C-h)", "<cmd>lua require('telescope.builtin').search_history()"},
      {"paste mode", "<cmd>set paste!"},
      {"cursor line", "<cmd>set cursorline!"},
      {"cursor column", "<cmd>set cursorcolumn!"},
      {"spell checker", "<cmd>set spell!"},
      {"relative number", "<cmd>set relativenumber!"},
      {"search highlighting (F12)", "<cmd>set hlsearch!"}
    }
  }
  table.insert(
    CpMenu,
    {
      "Dap",
      {"pause", "<cmd>lua require'dap'.pause()"},
      {"step into", "<cmd>lua require'dap'.step_into()"},
      {"step back", "<cmd>lua require'dap'.step_back()"},
      {"step over", "<cmd>lua require'dap'.step_over()"},
      {"step out", "<cmd>lua require'dap'.step_out()"},
      {"frames", "<cmd>lua require'telescope'.extensions.dap.frames{}"},
      {"current scopes", ':lua ViewCurrentScopes(); vim.cmd("wincmd w|vertical resize 40")'},
      {"current scopes floating window", "<cmd>lua ViewCurrentScopesFloatingWindow()"},
      {"current value floating window", "<cmd>lua ViewCurrentValueFloatingWindow()"},
      {"commands", "<cmd>lua require'telescope'.extensions.dap.commands{}"},
      {"configurations", "<cmd>lua require'telescope'.extensions.dap.configurations{}"},
      {"repl", ':lua require\'dap\'.repl.open(); vim.cmd("wincmd w|resize 12")'},
      {"close", "<cmd>lua require'dap'.close(); require'dap'.repl.close()"},
      {"run to cursor", "<cmd>lua require'dap'.run_to_cursor()"},
      {"continue", "<cmd>lua require'dap'.continue()"},
      {"clear breakpoints", "<cmd>lua require('dap.breakpoints').clear()"},
      {"brakpoints", "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}"},
      {"toggle breakpoint", "<cmd>lua require'dap'.toggle_breakpoint()"}
    }
  )
end

return M
