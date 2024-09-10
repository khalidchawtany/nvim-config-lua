return {
    "linrongbin16/fzfx.nvim",
    keys = {
        { "<M-p><M-p>",  "<cmd>FzfxFiles<cr>",             desc = "FzfxFiles" },
        { "<M-p>p",      "<cmd>FzfxFiles cwod<cr>",        desc = "FzfxFiles CWord" },
        { "<M-p>P",      "<cmd>FzfxFiles resume<cr>",      desc = "FzfxFiles Resume" },
        { "<leader>xpp", "<cmd>FzfxFiles<cr>",             desc = "FzfxFiles" },
        { "<leader>xpr", "<cmd>FzfxFiles cword<cr>",       desc = "FzfxFiles CWord" },
        { "<leader>xpw", "<cmd>FzfxFiles resume<cr>",      desc = "FzfxFiles Resume" },

        { "<M-p><M-j>",  "<cmd>FzfxLiveGrep<cr>",          desc = "FzfxLiveGrep" },
        { "<M-p>j",      "<cmd>FzfxLiveGrep cword<cr>",    desc = "FzfxLiveGrep CWord" },
        { "<M-p>J",      "<cmd>FzfxLiveGrep resume<cr>",   desc = "FzfxLiveGrep Resume" },

        { "<M-p><M-l>",  "<cmd>FzfxBufLiveGrep<cr>",       desc = "FzfxBufLiveGrep" },
        { "<M-p>l",      "<cmd>FzfxBufLiveGrep cword<cr>", desc = "FzfxBufLiveGrep CWord" },
        { "<M-p>L",      "<cmd>FzfxBufLiveGrep cword<cr>", desc = "FzfxBufLiveGrep Resume" },

        { "<M-p><M-b>",  "<cmd>FzfxGBranches<cr>",         desc = "Branches" },
        { "<M-p><M-o>",  "<cmd>FzfxBuffers<cr>",           desc = "Buffers" },
        { "<M-p><M-m>",  "<cmd>FzfxCommands<cr>",          desc = "Commands" },
    },
    cmd = { "FzfxFiles", "FzfxGBranches", "FzfxBuffers", "FzfxCommands", "FzfxLiveGrep" },
    dependencies = { "nvim-tree/nvim-web-devicons", "junegunn/fzf" },
    config = function()
        local parsers = require("fzfx.helper.parsers")
        local str = require("fzfx.commons.str")
        local actions = require("fzfx.helper.actions")
        local make_command = function(lines, cmd)
            local results = {}
            for i, line in ipairs(lines) do
                if str.not_empty(line) then
                    local parsed = parsers.parse_find(line)
                    table.insert(results, string.format(cmd .. " %s", parsed.filename))
                end
            end
            return results
        end

        local run_command = function(cmd)
            local fn = function(lines, context)
                local edits = make_command(lines, cmd)
                actions._confirm_discard_modified(context.bufnr, function()
                    for _, e in ipairs(edits) do
                        vim.cmd(e)
                    end
                end)
            end

            return fn
        end

        require("fzfx").setup({
            files = {
                actions = {
                    ["ctrl-t"] = run_command("tabedit!"),
                    ["ctrl-v"] = run_command("vsplit!"),
                    ["ctrl-s"] = run_command("split!"),
                },
            },
        })
    end,
}

-- vim.keymap.set({'n'}, '<space>f', '<cmd>FzfxFiles<cr>', {silent=true, noremap=true, desc="Search files"})
-- vim.keymap.set({'n'}, '<space>uf', '<cmd>FzfxUnrestrictedFiles<cr>', {silent=true, noremap=true, desc="Unrestricted search files"})
-- vim.keymap.set({'n'}, '<space>b', '<cmd>FzfxBuffers<cr>', {silent=true, noremap=true, desc="Search buffers"})
-- vim.keymap.set({'n', 'x'}, '<space>l', '<cmd>FzfxLiveGrep<cr>', {silent=true, noremap=true, desc="Live grep"})
-- vim.keymap.set({'n', 'x'}, '<space>ul', '<cmd>FzfxUnrestrictedLiveGrep<cr>', {silent=true, noremap=true, desc="Unrestricted live grep"})
-- vim.keymap.set({'n'}, '<space>w', '<cmd>FzfxGrepWord<cr>', {silent=true, noremap=true, desc="Grep word under cursor"})
-- vim.keymap.set({'n'}, '<space>uw', '<cmd>FzfxUnrestrictedGrepWord<cr>', {silent=true, noremap=true, desc="Unrestricted grep word under cursor"})
-- vim.keymap.set({'n'}, '<space>gb', '<cmd>FzfxBranches<cr>', {silent=true, noremap=true, desc="Search git branches"})
