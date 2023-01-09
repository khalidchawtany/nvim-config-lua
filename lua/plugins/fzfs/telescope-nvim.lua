local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "LinArcX/telescope-command-palette.nvim",
    "natecraddock/telescope-zf-native.nvim"
  },
  cmd = {"Telescope"},
  keys = {
    {"<c-s><leader>p", "<cmd>lua require('telescope.builtin').pickers()<cr>", desc = ""},
    {"<c-s><leader>s", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", desc = ""},
    {"<c-s><leader>p", "<cmd>lua require('telescope.builtin').pickers()<cr>", desc = ""},
    {"<c-s><leader>t", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>", desc = ""},
    {"<c-s><leader>e", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", desc = ""},
    {"<c-s><leader>i", "<cmd>lua require('telescope.builtin').lsp_incoming_calls()<cr>", desc = ""},
    {"<c-s><leader>o", "<cmd>lua require('telescope.builtin').lsp_outgoing_calls()<cr>", desc = ""},
    {"<c-s><leader>r", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", desc = ""},
    {"<leader><c-s>p", "<cmd>lua require('telescope.builtin').pickers()<cr>", desc = ""},
    {"<leader><c-s>s", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", desc = ""},
    {"<leader><c-s>p", "<cmd>lua require('telescope.builtin').pickers()<cr>", desc = ""},
    {"<leader><c-s>t", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>", desc = ""},
    {"<leader><c-s>e", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", desc = ""},
    {"<leader><c-s>i", "<cmd>lua require('telescope.builtin').lsp_incoming_calls()<cr>", desc = ""},
    {"<leader><c-s>o", "<cmd>lua require('telescope.builtin').lsp_outgoing_calls()<cr>", desc = ""},
    {"<leader><c-s>r", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", desc = ""},
    {"<c-s>r", "<cmd>lua require('telescope.builtin').reloader()<cr>", desc = ""},
    {"<c-s><cr>", "<cmd>lua require('telescope.builtin').resume()<cr>", desc = ""},
    {"<c-s><c-cr>", "<cmd>lua require('telescope.builtin').resume()<cr>", desc = ""},
    {"<c-s><c-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = ""},
    {
      "<c-s>p",
      "<cmd>lua require('telescope.builtin').find_files({find_command = {'fd', vim.fn.expand('<cword>')}})<cr>",
      desc = ""
    },
    {"<c-s><c-a>", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = ""},
    {"<c-s><c-k>", "<cmd>lua require('telescope.builtin').live_grep({grep_open_files	= true})<cr>", desc = ""},
    {"<c-s>a", "<cmd>lua require('telescope.builtin').grep_string()<cr>", desc = ""},
    {"<c-s><c-o>", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = ""},
    {"<c-s><c-h>", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = ""},
    {"<c-s>-", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", desc = ""},
    {
      "<c-s><c-->",
      "<cmd>lua require('telescope.builtin').lsp_document_symbols({default_text = 'method '})<cr>",
      desc = ""
    },
    {"<c-s><c-l>", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", desc = ""},
    {"<c-s>l", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", desc = ""},
    {"<c-s><c-u>", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", desc = ""},
    {"<c-s>u", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", desc = ""},
    {"<c-s><c-g>", "<cmd>lua require('telescope.builtin').git_status()<cr>", desc = ""},
    {"<c-s>gg", "<cmd>lua require('telescope.builtin').git_status()<cr>", desc = ""},
    {"<c-s>gs", "<cmd>lua require('telescope.builtin').git_stash()<cr>", desc = ""},
    {"<c-s>gb", "<cmd>lua require('telescope.builtin').git_branches()<cr>", desc = ""},
    {"<c-s>gC", "<cmd>lua require('telescope.builtin').git_commits()<cr>", desc = ""},
    {"<c-s>gc", "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", desc = ""},
    {"<c-s>gf", "<cmd>lua require('telescope.builtin').git_files()<cr>", desc = ""},
    {"<c-s>f", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<cr>", desc = ""},
    {"<C-s><c-d>", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", desc = ""}
  }
}

M.init = function()
  vim.keymap.set(
    "n",
    "<leader>hoo",
    function()
      require("telescope.builtin").live_grep(
        {
          cwd = "~/Development/Libraries/october",
          prompt_title = "OctoberCMS Docs",
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--glob",
            "!*lang",
            "--glob",
            "!*.min.js",
            "--glob",
            "!*/ru/*"
          }
        }
      )
    end,
    {desc = "Telescope (OctoberCMS Docs)"}
  )

  vim.keymap.set(
    "n",
    "<leader>hot",
    function()
      require("telescope.builtin").live_grep(
        {
          cwd = "~/Projects/PHP/tic/plugins/lox/tic/",
          prompt_title = "OctoberCMS TIC",
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--glob",
            "!*lang",
            "--glob",
            "!*.min.js"
          }
        }
      )
    end,
    {desc = "Telescope (OctoberCMS TIC)"}
  )

  -- vim.api.nvim_set_keymap('n', '<c-p>p', ":lua require('telescope.builtin').find_files{search = vim.fn.expand(\"<cword>\") }<CR>",
  --                        {noremap = true, silent = true})
end

M.config = function()
  local open_in_nvim_tree = function(prompt_bufnr)
    local action_state = require "telescope.actions.state"
    local Path = require "plenary.path"
    local actions = require "telescope.actions"

    local entry = action_state.get_selected_entry()[1]
    local entry_path = Path:new(entry):parent():absolute()
    actions._close(prompt_bufnr, true)
    entry_path = Path:new(entry):parent():absolute()
    entry_path = entry_path:gsub("\\", "\\\\")
    -- dump(entry_path)

    -- vim.cmd("e " .. entry_path)
    -- vim.cmd("NvimTreeFindFile " .. entry_path)

    -- file_name = nil
    -- for s in string.gmatch(entry, "[^/]+") do
    --   file_name = s
    -- end
    --
    -- dump("file_name: " .. file_name)
    --
    -- vim.cmd("/" .. file_name)
  end

  -- in find files avoid normal mode

  local actions = require("telescope.actions")
  require("telescope").setup {
    extensions = {
      file_browser = {
        --theme = "ivy",
        mappings = {
          ["i"] = {},
          ["n"] = {}
        }
      }
    },
    defaults = {
      mappings = {
        i = {
          -- To disable a keymap, put [map] = false
          -- So, to not map "<C-n>", just put
          ["<c-x>"] = false,
          -- ["<esc>"] = actions.close,
          ["<c-s>"] = open_in_nvim_tree,
          -- Otherwise, just set the mapping to the function that you want it to be.
          ["<C-i>"] = actions.select_horizontal,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<c-space>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-'>"] = actions.which_key,
          ["<C-CR>"] = actions.select_default + actions.center,
          ["<C-c>"] = actions.close,
          ["<C-p>"] = require("telescope.actions.layout").toggle_preview

          -- Add up multiple actions
          -- ["<CR>"] = actions.select_default + actions.center

          -- You can perform as many actions in a row as you like
          -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
        },
        n = {
          ["<esc>"] = actions.close,
          ["<c-s>"] = open_in_nvim_tree,
          ["<C-c>"] = actions.close
          -- ["<C-i>"] = my_cool_custom_action,
        }
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case"
      },
      prompt_prefix = "> ",
      selection_caret = "> ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      -- show results from top to bottom
      sorting_strategy = "ascending", -- "descending",
      file_sorter = require "telescope.sorters".get_fuzzy_file,
      file_ignore_patterns = {},
      generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
      -- path_display = {},
      winblend = 0,
      layout_strategy = "flex",
      -- layout_defaults = {horizontal = {mirror = false}, vertical = {mirror = false}},
      layout_config = {
        horizontal = {
          mirror = false,
          preview_width = 0.5
        },
        vertical = {
          mirror = false,
          preview_height = 0.3
        },
        width = 0.8,
        height = 0.95,
        -- preview_width = 0.4,
        prompt_position = "top",
        preview_cutoff = 10
      },
      border = {},
      borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
      color_devicons = true,
      use_less = true,
      set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
      file_previewer = require "telescope.previewers".vim_buffer_cat.new,
      grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
      qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
    }
  }
end

return M
