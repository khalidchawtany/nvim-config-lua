local M = {
  requires = {"nvim-treesitter"},
  module = "sibling-swap"
}
M.init = function()
  vim.keymap.set(
    "n",
    "<c-.>",
    function()
      require("sibling-swap.swap").swap_with("right")
    end,
    {desc = "Swap Right"}
  )

  vim.keymap.set(
    "n",
    "<c-,>",
    function()
      require("sibling-swap.swap").swap_with("left")
    end,
    {desc = "Swap Left"}
  )

  vim.keymap.set(
    "n",
    "<leader>.",
    function()
      require("sibling-swap.swap").swap_with("right", true)
    end,
    {desc = "Swap Right(OP)"}
  )

  vim.keymap.set(
    "n",
    "<leader>,",
    function()
      require("sibling-swap.swap").swap_with("left", true)
    end,
    {desc = "Swap Left(OP)"}
  )
end
M.config = function()
  require("sibling-swap").setup(
    {
      allowed_separators = {
        ",",
        ";",
        "and",
        "or",
        "&&",
        "&",
        "||",
        "|",
        "==",
        "===",
        "!=",
        "!==",
        "-",
        "+",
        ["<"] = ">",
        ["<="] = ">=",
        [">"] = "<",
        [">="] = "<="
      },
      use_default_keymaps = true,
      keymaps = {
        ["<C-.>"] = "swap_with_right",
        ["<C-,>"] = "swap_with_left",
        ["<space>."] = "swap_with_right_with_opp",
        ["<space>,"] = "swap_with_left_with_opp"
      },
      ignore_injected_langs = false
    }
  )
end
return M
