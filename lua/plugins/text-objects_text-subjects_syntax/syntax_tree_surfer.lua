local swap = "gS"
local select = "gs"
local jump = "gj"
return {
    "ziontee113/syntax-tree-surfer",
    keys = {
        { swap .. "h", "<cmd>STSSwapOrHold<cr>", mode = "n", desc = "Swap/Hold" }, -- gsh
        { swap .. "h", "<cmd>STSSwapOrHold<cr>", mode = "x", desc = "Swap/Hold" }, -- gsh

        { swap .. "u", function() vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot" return "g@l" end, expr = true, desc = "Swap Up Normal" }, -- vU
        { swap .. "d", function() vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot" return "g@l" end, expr = true, desc = "Swap Down Normal" }, -- vD

        { swap .. "n", function() vim.opt.opfunc = "v:lua.STSSwapCurrentNodeNextNormal_Dot" return "g@l" end, mode = "n", expr = true }, -- vd
        { swap .. "n", "<cmd>STSSwapNextVisual<cr>", mode = "x", desc = "Select Master" },

        { swap .. "p", function() vim.opt.opfunc = "v:lua.STSSwapCurrentNodePrevNormal_Dot" return "g@l" end, mode = "n", expr = true }, -- vu
        { swap .. "p", "<cmd>STSSwapPrevVisual<cr>", mode = "x", desc = "Select Current" },

        { select .. "m", "<cmd>STSSelectCurrentNode<cr>", mode = "n", desc = "Select Master" }, -- vM
        { select .. "c", "<cmd>STSSelectCurrentNode<cr>", mode = "n", desc = "Select Current" }, -- vC

        { select .. "n", "<cmd>STSSelectNextSiblingNode<cr>", mode = "x", desc = "Select Next Sibling" },
        { select .. "p", "<cmd>STSSelectPrevSiblingNode<cr>", mode = "x", desc = "Select Prev Sibling" },

        { "<c-l>", "<cmd>STSSelectNextSiblingNode<cr>", mode = "x", desc = "Select Next Sibling" },
        { "<c-h>", "<cmd>STSSelectPrevSiblingNode<cr>", mode = "x", desc = "Select Prev Sibling" },
        { "<c-k>", "<cmd>STSSelectParentNode<cr>", mode = "x", desc = "Select Parent" },
        { "<c-j>", "<cmd>STSSelectChildNode<cr>", mode = "x", desc = "Select Child" },

        { jump .. "v", function()
            require("syntax-tree-surfer").targeted_jump({ "variable_declaration" })
        end, desc = "Jump to variable_declarations" },

        { jump .. "f", function()
            require("syntax-tree-surfer").targeted_jump({ "function", "arrow_function", "function_definition" })
        end, desc = "Jump to functions" },

        { jump .. "i", function()
            require("syntax-tree-surfer").targeted_jump({ "if_statement"})
        end,desc = "Jump to If" },

        { jump .. "l", function()
            require("syntax-tree-surfer").targeted_jump({ "for_statement" })
        end, desc = "Jump to Loop" },

        { jump .. "j", function()
            require("syntax-tree-surfer").targeted_jump({
                "scoped_call_expression",
                "member_call_expression",
                "class_declaration",
                "method_declaration",
                "function",
                "if_statement",
                "else_clause",
                "else_statement",
                "elseif_statement",
                "for_statement",
                "while_statement",
                "switch_statement",
            })
        end, desc = "Jump to Loop" },

    },

    config = function()
        -- Syntax Tree Surfer
        -- local opts = { noremap = true, silent = true }
        -- local sts = require("syntax-tree-surfer")

        -- -------------------------------
        -- -- filtered_jump --
        -- -- "default" means that you jump to the default_desired_types or your lastest jump types
        -- vim.keymap.set("n", "<A-n>", function()
        -- 	sts.filtered_jump("default", true) --> true means jump forward
        -- end, opts)
        -- vim.keymap.set("n", "<A-p>", function()
        -- 	sts.filtered_jump("default", false) --> false means jump backwards
        -- end, opts)
        --
        -- -- non-default jump --> custom desired_types
        -- vim.keymap.set("n", "your_keymap", function()
        -- 	sts.filtered_jump({
        -- 		"if_statement",
        -- 		"else_clause",
        -- 		"else_statement",
        -- 	}, true) --> true means jump forward
        -- end, opts)
        -- vim.keymap.set("n", "your_keymap", function()
        -- 	sts.filtered_jump({
        -- 		"if_statement",
        -- 		"else_clause",
        -- 		"else_statement",
        -- 	}, false) --> false means jump backwards
        -- end, opts)
        --
        -- -------------------------------
        -- -- jump with limited targets --
        -- -- jump to sibling nodes only
        -- vim.keymap.set("n", "-", function()
        -- 	sts.filtered_jump({
        -- 		"if_statement",
        -- 		"else_clause",
        -- 		"else_statement",
        -- 	}, false, { destination = "siblings" })
        -- end, opts)
        -- vim.keymap.set("n", "=", function()
        -- 	sts.filtered_jump({ "if_statement", "else_clause", "else_statement" }, true, { destination = "siblings" })
        -- end, opts)
        --
        -- -- jump to parent or child nodes only
        -- vim.keymap.set("n", "_", function()
        -- 	sts.filtered_jump({
        -- 		"if_statement",
        -- 		"else_clause",
        -- 		"else_statement",
        -- 	}, false, { destination = "parent" })
        -- end, opts)
        -- vim.keymap.set("n", "+", function()
        -- 	sts.filtered_jump({
        -- 		"if_statement",
        -- 		"else_clause",
        -- 		"else_statement",
        -- 	}, true, { destination = "children" })
        -- end, opts)

        vim.cmd [[ hi STS_highlight guibg=darkgreen guifg=white]]
        -- Setup Function example:
        -- These are the default options:
        require("syntax-tree-surfer").setup({
            highlight_group = "STS_highlight",
            disable_no_instance_found_report = true,
            default_desired_types = {
                "function",
                "arrow_function",
                "function_definition",
                "if_statement",
                "else_clause",
                "else_statement",
                "elseif_statement",
                "for_statement",
                "while_statement",
                "switch_statement",
            },
            left_hand_side = "fdsawervcxqtzb",
            right_hand_side = "jkl;oiu.,mpy/n",
            icon_dictionary = {
                ["if_statement"] = "",
                ["else_clause"] = "",
                ["else_statement"] = "",
                ["elseif_statement"] = "",
                ["for_statement"] = "ﭜ",
                ["while_statement"] = "ﯩ",
                ["switch_statement"] = "ﳟ",
                ["function"] = "",
                ["function_definition"] = "",
                ["variable_declaration"] = "",
            },
        })
    end,
}
