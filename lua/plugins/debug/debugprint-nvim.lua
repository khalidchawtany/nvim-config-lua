return {
    "andrewferrier/debugprint.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    keys = {
        { "<leader>cddj",    mode = "n",          desc = "DebugPrint Below" },
        { "<leader>cddk",    mode = "n",          desc = "DebugPrint Above" },
        { "<leader>cddp",    mode = { "n", "x" }, desc = "DebugPrint Var Above" },
        { "<leader>cddP",    mode = { "n", "x" }, desc = "DebugPrint Var Below" },
        { "<leader>cdda",    mode = "n",          desc = "DebugPrint Var Below Prompt" },
        { "<leader>cddA",    mode = "n",          desc = "DebugPrint Var Above Prompt" },
        { "<leader>cddo",    mode = "n",          desc = "DebugPrint Obj Below" },
        { "<leader>cddO",    mode = "n",          desc = "DebugPrint Obj Above" },
        { "<leader>cddt",    mode = "n",          desc = "DebugPrint Toggle" },
        { "<leader>cdd<bs>", mode = "n",          desc = "DebugPrint Delete" },
    },
    cmd = {
        "ToggleCommentDebugPrints",
        "DeleteDebugPrints",
    },
    config = function()
        local vue = {
            left = "console.log(`",
            right = "`)",
            mid_var = "${",
            right_var = "}`)",
        }

        local php = {
            left = "dd('",
            right = ")",
            mid_var = "', $",
            right_var = ");",
        }

        -- require("debugprint").add_custom_filetypes({vue})

        require("debugprint").setup({
            filetypes = { ["vue"] = vue, ["php"] = php },

            keymaps = {
                normal = {
                    plain_below = "<leader>cddj",
                    plain_above = "<leader>cddk",
                    variable_below = "<leader>cddp",
                    variable_above = "<leader>cddP",
                    variable_below_alwaysprompt = "<leader>cdda",
                    variable_above_alwaysprompt = "<leader>cddA",
                    textobj_below = "<leader>cddo",
                    textobj_above = "<leader>cddO",
                    toggle_comment_debug_prints = "<leader>cddt",
                    delete_debug_prints = "<leader>cdd<bs>",
                },
                visual = {
                    variable_below = "<leader>cddp",
                    variable_above = "<leader>cddP",
                },
            },
            commands = {
                toggle_comment_debug_prints = "ToggleCommentDebugPrints",
                delete_debug_prints = "DeleteDebugPrints",
            },
        })
    end,
}
