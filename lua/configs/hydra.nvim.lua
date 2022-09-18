local M = {
  module = "hydra"
}

local gitSubmode = function()
  local Hydra = require("hydra")
  local gitsigns = require("gitsigns")
  local bufnr = vim.api.nvim_get_current_buf()

  local hint =
    [[
 _J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
 _K_: prev hunk   _u_: undo last stage   _p_: preview hunk   _B_: blame show full 
 ^ ^              _S_: stage buffer      ^ ^                 _/_: show base file
 ^
 ^ ^              _<Enter>_: Neogit              _q_: exit
]]

  return Hydra(
    {
      name = "Git",
      hint = hint,
      config = {
        buffer = bufnr,
        color = "pink",
        invoke_on_body = true,
        hint = {
          border = "rounded"
        },
        on_enter = function()
          vim.cmd "mkview"
          vim.cmd "silent! %foldopen!"
          vim.bo.modifiable = false
          gitsigns.toggle_signs(true)
          gitsigns.toggle_linehl(true)
        end,
        on_exit = function()
          local cursor_pos = vim.api.nvim_win_get_cursor(0)
          vim.cmd "loadview"
          vim.api.nvim_win_set_cursor(0, cursor_pos)
          vim.cmd "normal zv"
          gitsigns.toggle_signs(false)
          gitsigns.toggle_linehl(false)
          gitsigns.toggle_deleted(false)
        end
      },
      mode = {"n", "x"},
      body = "<leader>g",
      heads = {
        {
          "J",
          function()
            if vim.wo.diff then
              return "]c"
            end
            vim.schedule(
              function()
                gitsigns.next_hunk()
              end
            )
            return "<Ignore>"
          end,
          {expr = true, desc = "next hunk"}
        },
        {
          "K",
          function()
            if vim.wo.diff then
              return "[c"
            end
            vim.schedule(
              function()
                gitsigns.prev_hunk()
              end
            )
            return "<Ignore>"
          end,
          {expr = true, desc = "prev hunk"}
        },
        {"s", ":Gitsigns stage_hunk<CR>", {silent = true, desc = "stage hunk"}},
        {"u", gitsigns.undo_stage_hunk, {desc = "undo last stage"}},
        {"S", gitsigns.stage_buffer, {desc = "stage buffer"}},
        {"p", gitsigns.preview_hunk, {desc = "preview hunk"}},
        {"d", gitsigns.toggle_deleted, {nowait = true, desc = "toggle deleted"}},
        {"b", gitsigns.blame_line, {desc = "blame"}},
        {
          "B",
          function()
            gitsigns.blame_line {full = true}
          end,
          {desc = "blame show full"}
        },
        {"/", gitsigns.show, {exit = true, desc = "show base file"}}, -- show the base of the file
        {"<Enter>", "<Cmd>Neogit<CR>", {exit = true, desc = "Neogit"}},
        {"q", nil, {exit = true, nowait = true, desc = "exit"}}
      }
    }
  )
end

local telescopeSubmode = function()
  local Hydra = require("hydra")
  local cmd = require("hydra.keymap-util").cmd

  local hint =
    [[
                 _f_: files       _m_: marks
   🭇🬭🬭🬭🬭🬭🬭🬭🬭🬼    _o_: old files   _g_: live grep
  🭉🭁🭠🭘    🭣🭕🭌🬾   _p_: projects    _/_: search in file
  🭅█ ▁     █🭐
  ██🬿      🭊██   _r_: resume      _u_: undotree
 🭋█🬝🮄🮄🮄🮄🮄🮄🮄🮄🬆█🭀  _h_: vim help    _c_: execute command
 🭤🭒🬺🬹🬱🬭🬭🬭🬭🬵🬹🬹🭝🭙  _k_: keymaps     _;_: commands history 
                 _O_: options     _?_: search history
 ^
                 _<Enter>_: Telescope           _<Esc>_
]]

  return Hydra(
    {
      name = "Telescope",
      hint = hint,
      config = {
        color = "teal",
        invoke_on_body = true,
        hint = {
          position = "middle",
          border = "rounded"
        }
      },
      mode = "n",
      body = "<Leader>f",
      heads = {
        {"f", cmd "Telescope find_files"},
        {"g", cmd "Telescope live_grep"},
        {"o", cmd "Telescope oldfiles", {desc = "recently opened files"}},
        {"h", cmd "Telescope help_tags", {desc = "vim help"}},
        {"m", cmd "MarksListBuf", {desc = "marks"}},
        {"k", cmd "Telescope keymaps"},
        {"O", cmd "Telescope vim_options"},
        {"r", cmd "Telescope resume"},
        {"p", cmd "Telescope projects", {desc = "projects"}},
        {"/", cmd "Telescope current_buffer_fuzzy_find", {desc = "search in file"}},
        {"?", cmd "Telescope search_history", {desc = "search history"}},
        {";", cmd "Telescope command_history", {desc = "command-line history"}},
        {"c", cmd "Telescope commands", {desc = "execute command"}},
        {"u", cmd "silent! %foldopen! | UndotreeToggle", {desc = "undotree"}},
        {"<Enter>", cmd "Telescope", {exit = true, desc = "list all pickers"}},
        {"<Esc>", nil, {exit = true, nowait = true}}
      }
    }
  )
end

local windowSubmode = function()
  local Hydra = require("hydra")
  -- local splits = require("smart-splits")

  local cmd = require("hydra.keymap-util").cmd
  local pcmd = require("hydra.keymap-util").pcmd

  local buffer_hydra =
    Hydra(
    {
      name = "Barbar",
      config = {
        on_key = function()
          -- Preserve animation
          vim.wait(
            200,
            function()
              vim.cmd "redraw"
            end,
            30,
            false
          )
        end
      },
      heads = {
        {
          "h",
          function()
            vim.cmd("BufferPrevious")
          end,
          {on_key = false}
        },
        {
          "l",
          function()
            vim.cmd("BufferNext")
          end,
          {desc = "choose", on_key = false}
        },
        {
          "H",
          function()
            vim.cmd("BufferMovePrevious")
          end
        },
        {
          "L",
          function()
            vim.cmd("BufferMoveNext")
          end,
          {desc = "move"}
        },
        {
          "p",
          function()
            vim.cmd("BufferPin")
          end,
          {desc = "pin"}
        },
        {
          "d",
          function()
            vim.cmd("BufferClose")
          end,
          {desc = "close"}
        },
        {
          "c",
          function()
            vim.cmd("BufferClose")
          end,
          {desc = false}
        },
        {
          "q",
          function()
            vim.cmd("BufferClose")
          end,
          {desc = false}
        },
        {
          "od",
          function()
            vim.cmd("BufferOrderByDirectory")
          end,
          {desc = "by directory"}
        },
        {
          "ol",
          function()
            vim.cmd("BufferOrderByLanguage")
          end,
          {desc = "by language"}
        },
        {"<Esc>", nil, {exit = true}}
      }
    }
  )

  local function choose_buffer()
    if #vim.fn.getbufinfo({buflisted = true}) > 1 then
      buffer_hydra:activate()
    end
  end

  vim.keymap.set("n", "gb", choose_buffer)

  local window_hint =
    [[
 ^^^^^^^^^^^^     Move      ^^    Size   ^^   ^^     Split
 ^^^^^^^^^^^^-------------  ^^-----------^^   ^^---------------
 ^ ^ _k_ ^ ^  ^ ^ _K_ ^ ^   ^   _<C-k>_   ^   _s_: horizontally 
 _h_ ^ ^ _l_  _H_ ^ ^ _L_   _<C-h>_ _<C-l>_   _v_: vertically
 ^ ^ _j_ ^ ^  ^ ^ _J_ ^ ^   ^   _<C-j>_   ^   _q_, _c_: close
 focus^^^^^^  window^^^^^^  ^_=_: equalize^   _z_: maximize
 ^ ^ ^ ^ ^ ^  ^ ^ ^ ^ ^ ^   ^^ ^          ^   _o_: remain only
 _b_: choose buffer
]]

  return Hydra(
    {
      name = "Windows",
      hint = window_hint,
      config = {
        invoke_on_body = true,
        hint = {
          border = "rounded",
          position = "middle"
          -- offset = -1
        }
      },
      mode = "n",
      body = "<C-w>",
      heads = {
        {"h", "<C-w>h"},
        {"j", "<C-w>j"},
        {"k", pcmd("wincmd k", "E11", "close")},
        {"l", "<C-w>l"},
        {"H", cmd "WinShift left"},
        {"J", cmd "WinShift down"},
        {"K", cmd "WinShift up"},
        {"L", cmd "WinShift right"},
        {
          "<C-h>",
          function()
            -- splits.resize_left(2)
          end
        },
        {
          "<C-j>",
          function()
            -- splits.resize_down(2)
          end
        },
        {
          "<C-k>",
          function()
            -- splits.resize_up(2)
          end
        },
        {
          "<C-l>",
          function()
            -- splits.resize_right(2)
          end
        },
        {"=", "<C-w>=", {desc = "equalize"}},
        {"s", pcmd("split", "E36")},
        {"<C-s>", pcmd("split", "E36"), {desc = false}},
        {"v", pcmd("vsplit", "E36")},
        {"<C-v>", pcmd("vsplit", "E36"), {desc = false}},
        {"w", "<C-w>w", {exit = true, desc = false}},
        {"<C-w>", "<C-w>w", {exit = true, desc = false}},
        {"z", cmd "MaximizerToggle!", {desc = "maximize"}},
        {"<C-z>", cmd "MaximizerToggle!", {exit = true, desc = false}},
        {"o", "<C-w>o", {exit = true, desc = "remain only"}},
        {"<C-o>", "<C-w>o", {exit = true, desc = false}},
        {"b", choose_buffer, {exit = true, desc = "choose buffer"}},
        {"c", pcmd("close", "E444")},
        {"q", pcmd("close", "E444"), {desc = "close window"}},
        {"<C-c>", pcmd("close", "E444"), {desc = false}},
        {"<C-q>", pcmd("close", "E444"), {desc = false}},
        {"<Esc>", nil, {exit = true, desc = false}}
      }
    }
  )
end

M.init = function()
  vim.keymap.set(
    "n",
    "<leader>g",
    function()
      gitSubmode():activate()
    end,
    {nowait = true, silent = true}
  )

  vim.keymap.set(
    "n",
    "<leader>f",
    function()
      telescopeSubmode():activate()
    end,
    {nowait = true, silent = true}
  )

  vim.keymap.set(
    "n",
    "<c-w>",
    function()
      windowSubmode():activate()
    end,
    {nowait = true, silent = true}
  )
end

M.config = function()
end

return M
