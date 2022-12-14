local M = {
  module = {"calc", "stalk", "scratch", "bt"}
  -- fn = { "toggle_player" },
  -- cmd = { "Calc", "Stalk", "Scratch", "Bt" }
}

M.init = function()
  vim.keymap.set(
    "n",
    "<leader>up",
    function()
      require("player").toggle_player()
    end,
    {desc = "Player"}
  )

  vim.keymap.set(
    "n",
    "<leader>uc",
    function()
      require("calc").setup()
    end,
    {desc = "Calculator"}
  )

  vim.keymap.set(
    "n",
    "<leader>us",
    function()
      require("stalk").setup()
    end,
    {desc = "Stalk"}
  )

  vim.keymap.set(
    "n",
    "<leader>ub",
    function()
      require("bt").setup()
    end,
    {desc = "Bookmark Toggle"}
  )
end

-- require("calc").setup()
-- require("stalk").setup()
-- require("scratch").setup()
-- require("bt").setup()
-- require("float").setup()
-- require("tmpclone").clone()

return M
