return {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPost",

    config = function()
        require("gitsigns").setup({
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                untracked = { text = "┆" },
            },
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                follow_files = true,
            },
            attach_to_untracked = true,
            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000, -- Disable if file is longer than this (in lines)
            preview_config = {
                -- Options passed to nvim_open_win
                border = "single",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
            yadm = {
                enable = false,
            },

            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- keys = {
                -- 	{ "<leader>gs",        function() floatFugitive('.') end, desc = "Git (Float)" },
                -- 	{ "<leader>gf",        '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Git"<cr>', desc = "Git" },
                -- 	{ "<leader>gc",        '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Git commit"<cr>', desc = "Git commit" },
                -- 	{ "<leader>gp",        '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Git pull"<cr>', desc = "Git pull" },
                -- 	{ "<leader>gu",        '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Git push | echo \'Pushed :)\'"<cr>', desc = "Git push" },
                -- 	{ "<leader>gU",        '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Git push --force | echo \'Pushed :)\'"<cr>', desc = "Git push force" },
                -- 	{ "<leader>gr",        '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Gread"<cr>', desc = "Git read" },
                -- 	{ "<leader>gw",        '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Gwrite"<cr>', desc = "Git write" },
                -- 	{ "<leader>gdv",       '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Gvdiff"<cr>', desc = "Git diff-V" },
                -- 	{ "<leader>gds",       '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Gdiff"<cr>', desc = "Git diff-S" },
                -- 	-- { "<leader>g<leader>", '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Gtabedit"<cr>', desc = "Git tab" },
                -- 	{ "<leader>g<bs>",     '<cmd>execute"call FugitiveDetect(expand(\'%:p\')) | Gread | Gwrite"<cr>', desc = "Git Read|Write" },
                -- },

                -- Navigation
                -- map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr = true})
                -- map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr = true})

                map("n", "]c", "<cmd>Gitsigns next_hunk<CR>", { noremap = true, desc="Next hunk" })
                map("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", { noremap = true, desc="Previous hunk"})

                -- Actions
                map({ "n", "v" }, "<leader>ghw", ":Gitsigns stage_hunk<CR>", {noremap = true, desc="Stage hunk"})
                map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", {noremap = true, desc="Reset hunk"})
                map("n", "<leader>gw", gs.stage_buffer, { noremap = true, desc="Stage buffer" })
                map("n", "<leader>ghr", gs.undo_stage_hunk, { noremap = true, desc="Undo stage hunk" })
                map("n", "<leader>gr", gs.reset_buffer, { noremap = true, desc="Reset buffer" })
                map("n", "<leader>ghp", gs.preview_hunk, { noremap = true, desc="Preview hunk" })
                map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, { noremap = true, desc="Blame line" })
                map("n", "<leader>ghtb", gs.toggle_current_line_blame, { noremap = true, desc="Toggle current line blame" })
                map("n", "<leader>ghd", gs.diffthis, { noremap = true, desc="Diff this" })
                map("n", "<leader>ghD", function()
                    gs.diffthis("~")
                end, { noremap = true, desc="Diff this (cached)" })
                map("n", "<leader>ghtd", gs.toggle_deleted, { noremap = true, desc="Toggle deleted" })

                -- Text object
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { noremap = true, silent = true })
            end,
        })
    end,
}
