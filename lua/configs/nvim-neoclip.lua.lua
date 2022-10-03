local M = {
  requires = {
    -- you'll need at least one of these
    {"nvim-telescope/telescope.nvim"}
    -- {'ibhagwan/fzf-lua'},
    -- {"kkharji/sqlite.lua", module = "sqlite"}
  }
}

M.config = function()

  vim.keymap.set(
    "n",
    "<c-s><c-y>",
    function()
      require("telescope").extensions["neoclip"].default()
    end,
    {desc = "Telescope (Yank-Ring)"}
  )

  vim.keymap.set(
    "n",
    "<c-s>y",
    function()
      require("telescope").extensions["macroscope"].default()
    end,
    {desc = "Telescope (Macro-Ring)"}
  )




  require("neoclip").setup(
    {
      history = 1000,
      enable_persistent_history = false,
      length_limit = 1048576,
      continuous_sync = false,
      db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
      filter = nil,
      preview = true,
      default_register = '"',
      default_register_macros = "q",
      enable_macro_history = true,
      content_spec_column = false,
      on_paste = {
        set_reg = false
      },
      on_replay = {
        set_reg = false
      },
      keys = {
        telescope = {
          i = {
            select = "<cr>",
            paste = "<c-p>",
            paste_behind = "<c-k>",
            replay = "<c-q>", -- replay a macro
            delete = "<c-d>", -- delete an entry
            custom = {}
          },
          n = {
            select = "<cr>",
            paste = "p",
            --- It is possible to map to more than one key.
            -- paste = { 'p', '<c-p>' },
            paste_behind = "P",
            replay = "q",
            delete = "d",
            custom = {
              ["<space>"] = function(opts)
                print(vim.inspect(opts))
              end
            }
          }
        },
        fzf = {
          select = "default",
          paste = "ctrl-p",
          paste_behind = "ctrl-k",
          custom = {}
        }
      }
    }
  )
end
return M
