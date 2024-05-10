function floatFugitive(dir)
    vim.fn.chdir(dir)
    vim.cmd("Git")
    local timer = vim.loop.new_timer()
    local fug_win = vim.api.nvim_get_current_win()
    local fug_buf = vim.api.nvim_win_get_buf(fug_win)
    local ui = vim.api.nvim_list_uis()[1]
    local width_pad = math.floor((ui.width / 4.14))
    local win_width = (ui.width - width_pad)
    local height_pad = math.floor((ui.height / 4.14))
    local win_height = (ui.height - height_pad)
    local win_opts = {
        border = "rounded",
        col = ((ui.width - win_width) / 2),
        height = win_height,
        relative = "editor",
        row = ((ui.height - win_height) / 2),
        style = "minimal",
        width = win_width,
    }
    local function mod_fugitive()
        vim.keymap.set("n", "q", function()
            vim.api.nvim_win_close(fug_win, true)
        end, {
            buffer = fug_buf,
            desc = "Close fugitive window with just q",
        })
        vim.keymap.set("n", "<Esc>", function()
            vim.api.nvim_win_close(fug_win, true)
        end, {
            buffer = fug_buf,
            desc = "Close fugitive window with just <Esc>",
        })
        local fug_floatwin = vim.api.nvim_create_augroup("fugitiveFloatwin", { clear = true })
        vim.api.nvim_create_autocmd("BufLeave", {
            buffer = fug_buf,
            callback = function()
                vim.api.nvim_win_close(fug_win, true)
                vim.api.nvim_del_augroup_by_id(fug_floatwin)
            end,
            desc = "Close fugitive floating window after we leave it",
            group = fug_floatwin,
        })
        return vim.api.nvim_win_set_config(fug_win, win_opts)
    end
    return timer:start(1, 0, vim.schedule_wrap(mod_fugitive))
end

return {
    "tpope/vim-fugitive",
    event = "BufReadPost fugitive://*",
    commands = {
        "G",
        "Git",
        "Git!",
        "Git",
        "Git",
        "Git",
        "Git",
        "Git",
        "Git",
        "Git",
        "Git",
        "Ggrep",
        "Git",
        "Ggrep",
        "Ggrep",
        "Glgrep",
        "0Git",
        "Gclog",
        "Gllog",
        "Gcd",
        "Glcd",
        "Gedit",
        "Gsplit",
        "Gvsplit",
        "Gtabedit",
        "Gpedit",
        "Gdrop",
        "Gread",
        "Gwrite",
        "Gwrite",
        "Gwq",
        "Gwq!",
        "Gdiffsplit",
        "Gdiffsplit!",
        "Gdiffsplit!",
        "Gvdiffsplit",
        "Gdiffsplit",
        "Ghdiffsplit",
        "GMove",
        "GRename",
        "GDelete",
        "GRemove",
        "GUnlink",
        "GBrowse",
        "GBrowse",
        "GBrowse",
        "GBrowse",
        "Makefile",
    },

    keys = {
        {
            "<leader>gf",
            function()
                floatFugitive(".")
            end,
            desc = "Git (Float)",
        },
        { "<leader>gs", "<cmd>execute\"call FugitiveDetect(expand('%:p')) | Git\"<cr>",      desc = "Git" },
        {
            "<leader>gc",
            "<cmd>execute\"call FugitiveDetect(expand('%:p')) | Git commit\"<cr>",
            desc = "Git commit",
        },
        { "<leader>gp", "<cmd>execute\"call FugitiveDetect(expand('%:p')) | Git pull\"<cr>", desc = "Git pull" },
        {
            "<leader>gu",
            "<cmd>execute\"call FugitiveDetect(expand('%:p')) | Git push | echo 'Pushed :)'\"<cr>",
            desc = "Git push",
        },
        {
            "<leader>gU",
            "<cmd>execute\"call FugitiveDetect(expand('%:p')) | Git push --force | echo 'Pushed :)'\"<cr>",
            desc = "Git push force",
        },
        { "<leader>gr",  "<cmd>execute\"call FugitiveDetect(expand('%:p')) | Gread\"<cr>",   desc = "Git read" },
        { "<leader>gw",  "<cmd>execute\"call FugitiveDetect(expand('%:p')) | Gwrite\"<cr>",  desc = "Git write" },
        { "<leader>gdv", "<cmd>execute\"call FugitiveDetect(expand('%:p')) | Gvdiff\"<cr>",  desc = "Git diff-V" },
        { "<leader>gds", "<cmd>execute\"call FugitiveDetect(expand('%:p')) | Gdiff\"<cr>",   desc = "Git diff-S" },
        { "<leader>gt",  "<cmd>execute\"call FugitiveDetect(expand('%:p')) | tab Git\"<cr>", desc = "Git tab" },
        {
            "<leader>g<bs>",
            "<cmd>execute\"call FugitiveDetect(expand('%:p')) | Gread | Gwrite\"<cr>",
            desc = "Git Read|Write",
        },
    },
    init = function()
        vim.cmd([[ autocmd BufReadPost fugitive://* set bufhidden=delete ]])
        -- Fugitive Conflict Resolution
        -- nnoremap gdh :diffget //2<CR>
        -- nnoremap gdl :diffget //3<CR>
    end,
}
