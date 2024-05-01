local M = {
  "numToStr/FTerm.nvim",
  keys = {
    {"<c-cr><c-cr>", '<CMD>lua require("FTerm").toggle()<CR>', desc = "FTerm"},
    {"<c-cr><c-cr>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', desc = "FTerm", mode = "t"},
    {
      "<c-cr><c-s>",
      function()
        if _G.tmp.server == nil then
          _G.tmp.server = require("FTerm"):new({ft = "terminal", dimensions = {height = 0.98, width = 0.98}})
        end
        _G.tmp.server:toggle()
      end,
      desc = "Toggle Long Terminal",
      mode = {"n", "t"}
    },
    -- Use this to toggle gitui in a floating terminal
    {
      "<c-cr><c-s>",
      function()
        if _G.tmp.gitui == nil then
          _G.tmp.gitui =
            require("FTerm"):new({ft = "fterm_gitui", cmd = "gitui", dimensions = {height = 0.9, width = 0.9}})
        end
        _G.tmp.gitui:toggle()
      end,
      desc = "Git UI",
      mode = {"n", "t"}
    }
  }
}

M.init = function()
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
      border =  require('user.functions').get_borderoption('single'),
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
        height = 0.95, -- Height of the terminal window
        width = 0.95, -- Width of the terminal window
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
