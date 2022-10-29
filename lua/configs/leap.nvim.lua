local M = {
  keys = {"<Plug>(leap-"},
  module = "leap"
}

M.init = function()
  -- require("leap").set_default_keymaps()

  for _, _1_ in ipairs(
    {
      {"n", "s", "<Plug>(leap-forward)"},
      {"n", "S", "<Plug>(leap-backward)"},
      {"x", "s", "<Plug>(leap-forward)"},
      {"x", "S", "<Plug>(leap-backward)"},
      {"o", "z", "<Plug>(leap-forward)"},
      {"o", "Z", "<Plug>(leap-backward)"},
      {"o", "x", "<Plug>(leap-forward-x)"},
      {"o", "X", "<Plug>(leap-backward-x)"},
      {"n", "gs", "<Plug>(leap-cross-window)"},
      {"x", "gs", "<Plug>(leap-cross-window)"},
      {"o", "gs", "<Plug>(leap-cross-window)"}
    }
  ) do
    local _each_2_ = _1_
    local mode = _each_2_[1]
    local lhs = _each_2_[2]
    local rhs = _each_2_[3]
    vim.keymap.set(mode, lhs, rhs, {silent = true})
  end
end

-- Bidirectional search in the current window is just a specific case of the multi-window mode.
vim.keymap.set( "n", "\\s",
  function()
    require("leap").leap {target_windows = {vim.fn.win_getid()}}
  end,
  {desc = "Leap (Bidirectional)"}
)

local function get_line_starts(winid)
  local wininfo = vim.fn.getwininfo(winid)[1]
  local cur_line = vim.fn.line(".")

  -- Get targets.
  local targets = {}
  local lnum = wininfo.topline
  while lnum <= wininfo.botline do
    local fold_end = vim.fn.foldclosedend(lnum)
    -- Skip folded ranges.
    if fold_end ~= -1 then
      lnum = fold_end + 1
    else
      if lnum ~= cur_line then
        table.insert(targets, {pos = {lnum, 1}})
      end
      lnum = lnum + 1
    end
  end
  -- Sort them by vertical screen distance from cursor.
  local cur_screen_row = vim.fn.screenpos(winid, cur_line, 1)["row"]
  local function screen_rows_from_cur(t)
    local t_screen_row = vim.fn.screenpos(winid, t.pos[1], t.pos[2])["row"]
    return math.abs(cur_screen_row - t_screen_row)
  end
  table.sort(
    targets,
    function(t1, t2)
      return screen_rows_from_cur(t1) < screen_rows_from_cur(t2)
    end
  )

  if #targets >= 1 then
    return targets
  end
end

-- Usage:
local function leap_to_line()
  winid = vim.api.nvim_get_current_win()
  require("leap").leap {
    target_windows = {winid},
    targets = get_line_starts(winid)
  }
end

M.config = function()
  require("leap").setup {
    case_insensitive = true
    -- Leaving the appropriate list empty effectively disables "smart" mode,
    -- and forces auto-jump to be on or off.
    -- safe_labels = { . . . },
    -- labels = { . . . },
    -- These keys are captured directly by the plugin at runtime.
    -- special_keys = {
    --   repeat_search = "<enter>",
    --   next_match = "<enter>",
    --   prev_match = "<tab>",
    --   next_group = "<space>",
    --   prev_group = "<tab>",
    --   eol = "<space>"
    -- }
  }
  -- vim.api.nvim_create_autocmd("VimEnter", {
  --    pattern = "*",
  --    callback = function()
  --   end,
  -- })
end

return M
