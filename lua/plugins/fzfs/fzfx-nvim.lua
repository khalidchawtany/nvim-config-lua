return {
    "linrongbin16/fzfx.nvim",
    keys = {
        { "<M-D-p><M-D-p>",  "<cmd>FzfxFiles<cr>",      desc = "FzfxFiles" },
        { "<M-D-p><M-D-b>",  "<cmd>FzfxGBranches<cr>",    desc = "Branches" },
        { "<M-D-p><M-D-o>",  "<cmd>FzfxBuffers<cr>",     desc = "Buffers" },
        { "<M-D-p><M-D-m>",  "<cmd>FzfxCommands<cr>",    desc = "Commands" },
    },
    dependencies = { "nvim-tree/nvim-web-devicons", "junegunn/fzf" },
    config = function()
        require("fzfx").setup()
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
