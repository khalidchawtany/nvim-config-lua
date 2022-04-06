local M = {
  event = "InsertEnter",
  config = function()
    vim.schedule(
      function()
        require("copilot").setup()
      end
    )
  end
}

return M
