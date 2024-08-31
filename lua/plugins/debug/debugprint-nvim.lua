return {
    "andrewferrier/debugprint.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    keys = {
        { "<leader>dpj",    mode = "n",          desc = "DebugPrint Below" },
        { "<leader>dpk",    mode = "n",          desc = "DebugPrint Above" },
        { "<leader>dpp",    mode = { "n", "x" }, desc = "DebugPrint Var Above" },
        { "<leader>dpP",    mode = { "n", "x" }, desc = "DebugPrint Var Below" },
        { "<leader>dpa",    mode = "n",          desc = "DebugPrint Var Below Prompt" },
        { "<leader>dpA",    mode = "n",          desc = "DebugPrint Var Above Prompt" },
        { "<leader>dpo",    mode = "n",          desc = "DebugPrint Obj Below" },
        { "<leader>dpO",    mode = "n",          desc = "DebugPrint Obj Above" },
        { "<leader>dpt",    mode = "n",          desc = "DebugPrint Toggle" },
        { "<leader>dp<bs>", mode = "n",          desc = "DebugPrint Delete" },
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
                    plain_below = "<leader>dpj",
                    plain_above = "<leader>dpk",
                    variable_below = "<leader>dpp",
                    variable_above = "<leader>dpP",
                    variable_below_alwaysprompt = "<leader>dpa",
                    variable_above_alwaysprompt = "<leader>dpA",
                    textobj_below = "<leader>dpo",
                    textobj_above = "<leader>dpO",
                    toggle_comment_debug_prints = "<leader>dpt",
                    delete_debug_prints = "<leader>dp<bs>",
                },
                visual = {
                    variable_below = "<leader>dpp",
                    variable_above = "<leader>dpP",
                },
            },
            commands = {
                toggle_comment_debug_prints = "ToggleCommentDebugPrints",
                delete_debug_prints = "DeleteDebugPrints",
            },
        })
    end,
}
