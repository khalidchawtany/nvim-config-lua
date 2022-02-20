local M = {
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope-fzy-native.nvim"
  },
  module = {"telescope"},
  cmd = {"Telescope"}
}

M.init = function()
  vim.cmd [[
            nnoremap <c-s><cr>  <cmd>lua require('telescope.builtin').resume()<cr>
            nnoremap <c-s><c-cr>  <cmd>lua require('telescope.builtin').resume()<cr>
            nnoremap <c-s><c-p>  <cmd>lua require('telescope.builtin').find_files()<cr>
            nnoremap <c-s>p      <cmd>lua require('telescope.builtin').find_files({find_command = {"fd", vim.fn.expand("<cword>")}})<cr>
            nnoremap <c-s><c-a>  <cmd>lua require('telescope.builtin').live_grep()<cr>
            nnoremap <c-s><c-k>  <cmd>lua require('telescope.builtin').live_grep({grep_open_files	= true})<cr>
            nnoremap <c-s>a      <cmd>lua require('telescope.builtin').grep_string()<cr>
            nnoremap <c-s><c-o>  <cmd>lua require('telescope.builtin').buffers()<cr>
            nnoremap <c-s><c-h>  <cmd>lua require('telescope.builtin').help_tags()<cr>
            nnoremap <c-s>-      <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>
            nnoremap <c-s><c-->  <cmd>lua require('telescope.builtin').lsp_document_symbols({default_text = ":method: "})<cr>
            nnoremap <c-s><c-l>  <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
            nnoremap <c-s><c-u>  <cmd>lua require('telescope.builtin').oldfiles()<cr>
            nnoremap <c-s>u      <cmd>lua require('telescope.builtin').oldfiles()<cr>
            nnoremap <c-s><c-g>  <cmd>lua require('telescope.builtin').git_status()<cr>
            nnoremap <c-s>gs  <cmd>lua require('telescope.builtin').git_stash()<cr>
            nnoremap <c-s>gb  <cmd>lua require('telescope.builtin').git_branches()<cr>
            nnoremap <c-s>gC  <cmd>lua require('telescope.builtin').git_commits()<cr>
            nnoremap <c-s>gc  <cmd>lua require('telescope.builtin').git_bcommits()<cr>
            nnoremap <c-s>gf  <cmd>lua require('telescope.builtin').git_files()<cr>
            nnoremap <c-s><c-s>  <cmd>lua require 'telescope'.extensions.file_browser.file_browser()<cr>

 
    ]]

  vim.api.nvim_set_keymap(
    "n",
    "<C-p><c-\\>",
    ":lua require'telescope'.extensions.project.project{}<CR>",
    {noremap = true, silent = true}
  )

  vim.api.nvim_set_keymap(
    "n",
    "<C-s><c-\\>",
    ":lua require'telescope'.extensions.project.project{}<CR>",
    {noremap = true, silent = true}
  )

  vim.api.nvim_set_keymap(
    "n",
    "<c-s><c-d>",
    ":lua require('telescope.builtin').lsp_definitions()<CR>",
    {noremap = true, silent = true}
  )

  -- vim.api.nvim_set_keymap('n', '<c-p>p', ":lua require('telescope.builtin').find_files{search = vim.fn.expand(\"<cword>\") }<CR>",
  --                        {noremap = true, silent = true})
end

M.config = function()
  -- in find files avoid normal mode

  local actions = require("telescope.actions")
  require("telescope").setup {
    defaults = {
      mappings = {
        i = {
          -- To disable a keymap, put [map] = false
          -- So, to not map "<C-n>", just put
          ["<c-x>"] = false,
          -- ["<esc>"] = actions.close,

          -- Otherwise, just set the mapping to the function that you want it to be.
          ["<C-i>"] = actions.select_horizontal,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<c-space>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-'>"] = actions.which_key,
          ["<C-CR>"] = actions.select_default + actions.center

          -- Add up multiple actions
          -- ["<CR>"] = actions.select_default + actions.center

          -- You can perform as many actions in a row as you like
          -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
        },
        n = {
          ["<esc>"] = actions.close
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
          mirror = true,
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

  require("telescope").setup {
    extensions = {
      -- fzy_native = {override_generic_sorter = false, override_file_sorter = true},
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        -- override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case" -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
      file_browser = {
        --theme = "ivy",
        mappings = {
          ["i"] = {},
          ["n"] = {}
        }
      }
    },

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
  -- require("telescope").load_extension("fzy_native")
  require("telescope").load_extension("fzf")
  require("telescope").load_extension("zf-native")

  -- require("telescope").load_extension "file_browser"
end

return M
