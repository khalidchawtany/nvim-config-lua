return {
  "ldelossa/buffertag", -- put a tag on each windo with the file name
  event = "BufEnter",
  keys = {
    {"yoq", "<cmd>BuffertagToggle<cr>", desc = "Buffertag"}
  },
  config = function()
    require("buffertag").setup()
    -- accepts any border options that `nvim_open_win` accepts.
    -- see ":help vim.api.nvim_open_win"
    -- border = "none",
  end
}
