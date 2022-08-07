local M = {
  module = "nomodoro",
  cmd = {
    "NomoWork",
    "NomoBreak",
    "NomoStop",
    "NomoStatus",
    "NomoTimer"
  }
}

M.config = function()
  local map = vim.api.nvim_set_keymap
  local opts = {noremap = true, silent = true}

  map("n", "<leader>nw", "<cmd>NomoWork<cr>", opts)
  map("n", "<leader>nb", "<cmd>NomoBreak<cr>", opts)
  map("n", "<leader>ns", "<cmd>NomoStop<cr>", opts)

  require("nomodoro").setup(
    {
      work_time = 25,
      break_time = 5,
      menu_available = true,
      texts = {
        on_break_complete = "TIME IS UP!",
        on_work_complete = "TIME IS UP!",
        status_icon = "羽",
        timer_format = "!%0M:%0S" -- To include hours: '!%0H:%0M:%0S'
      },
      on_work_complete = function()
        vim.fn.jobstart(
          {"afplay", "/Users/juju/Development/Sounds/Bebebebeeep.mp3"},
          {
            on_stdout = function(j, d, e)
            end
          }
        )
      end,
      on_break_complete = function()
        vim.fn.jobstart(
          {"afplay", "/Users/juju/Development/Sounds/tic_short.mp3"},
          {
            on_stdout = function(j, d, e)
            end
          }
        )
      end
    }
  )
end

return M
