local M = {
  module = "FTerm"
}

M.init = function()
  -- Example keybindings
  local map = vim.api.nvim_set_keymap
  local opts = {noremap = true, silent = true}

  map("n", "<C-cr><C-cr>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
  map("t", "<C-cr><C-cr>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)


  local server = nil
  -- Use this to toggle gitui in a floating terminal
  vim.keymap.set( {"n", "t"}, "<C-cr><C-s>", function()
      if server == nil then
        server = require("FTerm"):new({ft = "terminal", dimensions = {height = 0.9, width = 0.9}})
      end
      server:toggle()
    end,
    {desc='Toggle Long Terminal'}
  )

  local gitui = nil
  -- Use this to toggle gitui in a floating terminal
  vim.keymap.set( "n", "<C-cr><C-g>", function()
      if gitui == nil then
        gitui = require("FTerm"):new({ft = "fterm_gitui", cmd = "gitui", dimensions = {height = 0.9, width = 0.9}})
      end
      gitui:toggle()
    end,
    {desc='Git UI'}
  )

--   vim.cmd [[
--     function! FTermStrategy(cmd)
--       PackerLoad FTerm.nvim
--       execute 'lua require("FTerm"):new({ ft = "fterm_gitui", cmd = "' a:cmd '", dimensions = {height = 0.9, width = 0.9} }):toggle()'
--     endfunction
--
--     let g:test#custom_strategies = {'FTerm': function('FTermStrategy')}
--     let g:test#strategy = 'FTerm'
--   ]]
end

M.config = function()
  require "FTerm".setup(
    {
      -- Filetype of the terminal buffer
      ft = "FTerm",
      -- Command to run inside the terminal. It could be a `string` or `table`
      cmd = os.getenv("SHELL"),
      -- Neovim's native window border. See `:h nvim_open_win` for more configuration options.
      border = "single",
      -- Close the terminal as soon as shell/command exits.
      -- Disabling this will mimic the native terminal behaviour.
      auto_close = true,
      -- Highlight group for the terminal. See `:h winhl`
      hl = "Normal",
      -- Transparency of the floating window. See `:h winblend`
      blend = 0,
      -- Object containing the terminal window dimensions.
      -- The value for each field should be between `0` and `1`
      dimensions = {
        height = 0.8, -- Height of the terminal window
        width = 0.8, -- Width of the terminal window
        x = 0.5, -- X axis of the terminal window
        y = 0.5 -- Y axis of the terminal window
      },
      -- Callback invoked when the terminal exits.
      -- See `:h jobstart-options`
      on_exit = nil,
      -- Callback invoked when the terminal emits stdout data.
      -- See `:h jobstart-options`
      on_stdout = nil,
      -- Callback invoked when the terminal emits stderr data.
      -- See `:h jobstart-options`
      on_stderr = nil
    }
  )
end

return M
