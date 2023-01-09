return {
  "natecraddock/telescope-zf-native.nvim",
  lazy = true,
  config = function()
    require("telescope").load_extension("zf-native")
    require("telescope").setup {
      extensions = {
        ["zf-native"] = {
          -- options for sorting file-like items
          file = {
            -- override default telescope file sorter
            enable = true,
            -- highlight matching text in results
            highlight_results = true,
            -- enable zf filename match priority
            match_filename = true
          },
          -- options for sorting all other items
          generic = {
            -- override default telescope generic item sorter
            enable = false,
            -- highlight matching text in results
            highlight_results = true,
            -- disable zf filename match priority
            match_filename = false
          }
        }
      }
    }
  end
}
