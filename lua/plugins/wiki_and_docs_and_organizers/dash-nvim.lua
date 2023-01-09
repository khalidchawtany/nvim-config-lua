return {
  "mrjones2014/dash.nvim",
  depencencies = {"nvim-telescope/telescope.nvim"},
  cmd = {"Dash", "DashWord"},
  build = "make install",
  keys = {
    {"f<c-k>", ':lua require("dash").search(true, vim.fn.expand("<cword>"))<cr>', desc = "Pounce (Repeat)"}
  },
  config = function()
    require("dash").setup(
      {
        extensions = {
          dash = {
            -- configure path to Dash.app if installed somewhere other than /Applications/Dash.app
            dash_app_path = "/Applications/Dash.app",
            -- debounce while typing, in milliseconds, defaults to 750 (0.75 seconds)
            debounce = 750,
            -- map filetype strings to the keywords you've configured for docsets in Dash
            -- setting to false will disable filtering by filetype for that filetype
            -- filetypes not included in this table will not filter the query by filetype
            -- check lua/dash/utils/config.lua to see all defaults
            -- the values you pass for file_type_keywords are merged with the defaults
            -- to disable filtering for all filetypes,
            -- set file_type_keywords = false
            file_type_keywords = {
              dashboard = false,
              NvimTree = false,
              TelescopePrompt = false,
              terminal = false,
              packer = false,
              -- a table of strings will search on multiple keywords
              javascript = {"javascript", "nodejs"},
              typescript = {"typescript", "javascript", "nodejs"},
              typescriptreact = {"typescript", "javascript", "react"},
              javascriptreact = {"javascript", "react"},
              php = {"php", "laravel"}
              -- you can also do a string, for example,
              -- bash = 'sh'
            }
          }
        }
      }
    )
  end
}
