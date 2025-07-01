return {
    "ziontee113/syntax-tree-surfer",
    keys = {
        { "vD",    mode = "n" },
        { "vU",    mode = "n" },
        { "vd",    mode = "n" },
        { "vu",    mode = "n" },

        { "J",     mode = "x" },
        { "K",     mode = "x" },
        { "H",     mode = "x" },
        { "L",     mode = "x" },
        { "<D-l>", mode = "x" },
        { "<D-h>", mode = "x" },

        { "gjv",   mode = "n", desc = "Jump to variable_declarations" },
        { "gjf",   mode = "n", desc = "Jump to functions" },
        { "gjl",   mode = "n", desc = "Jump to for_statements" },
        { "gji",   mode = "n", desc = "Jump to if_statements" },
        { "gjj",   mode = "n", desc = "Jump to all" },

        { "gsh", mode ={ "x", "n" }},
    },

    config = function()
        -- Syntax Tree Surfer
        local opts = { noremap = true, silent = true }
        -- Holds a node, or swaps the held node
        vim.keymap.set("n", "gsh", "<cmd>STSSwapOrHold<cr>", opts)
        -- Same for visual
        vim.keymap.set("x", "gsh", "<cmd>STSSwapOrHoldVisual<cr>", opts)

        -- Normal Mode Swapping:
        -- Swap The Master Node relative to the cursor with it's siblings, Dot Repeatable
        vim.keymap.set("n", "vU", function()
            vim.opt.opfunc = "v:lua.STSSwapUpNormal_Dot"
            return "g@l"
        end, { silent = true, expr = true })

        vim.keymap.set("n", "vD", function()
            vim.opt.opfunc = "v:lua.STSSwapDownNormal_Dot"
            return "g@l"
        end, { silent = true, expr = true })

        -- Swap Current Node at the Cursor with it's siblings, Dot Repeatable
        vim.keymap.set("n", "vd", function()
            vim.opt.opfunc = "v:lua.STSSwapCurrentNodeNextNormal_Dot"
            return "g@l"
        end, { silent = true, expr = true })

        vim.keymap.set("n", "vu", function()
            vim.opt.opfunc = "v:lua.STSSwapCurrentNodePrevNormal_Dot"
            return "g@l"
        end, { silent = true, expr = true })

        --> If the mappings above don't work, use these instead (no dot repeatable)
        -- vim.keymap.set("n", "vd", '<cmd>STSSwapCurrentNodeNextNormal<cr>', opts)
        -- vim.keymap.set("n", "vu", '<cmd>STSSwapCurrentNodePrevNormal<cr>', opts)
        -- vim.keymap.set("n", "vD", '<cmd>STSSwapDownNormal<cr>', opts)
        -- vim.keymap.set("n", "vU", '<cmd>STSSwapUpNormal<cr>', opts)

        -- Visual Selection from Normal Mode
        vim.keymap.set("n", "vx", "<cmd>STSSelectMasterNode<cr>", opts)
        vim.keymap.set("n", "vn", "<cmd>STSSelectCurrentNode<cr>", opts)

        -- Select Nodes in Visual Mode
        vim.keymap.set("x", "J", "<cmd>STSSelectNextSiblingNode<cr>", opts)
        vim.keymap.set("x", "K", "<cmd>STSSelectPrevSiblingNode<cr>", opts)
        vim.keymap.set("x", "H", "<cmd>STSSelectParentNode<cr>", opts)
        vim.keymap.set("x", "L", "<cmd>STSSelectChildNode<cr>", opts)

        -- Swapping Nodes in Visual Mode
        vim.keymap.set("x", "<D-l>", "<cmd>STSSwapNextVisual<cr>", opts)
        vim.keymap.set("x", "<D-h>", "<cmd>STSSwapPrevVisual<cr>", opts)

        -- Syntax Tree Surfer V2 Mappings
        -- Targeted Jump with virtual_text
        local sts = require("syntax-tree-surfer")
        vim.keymap.set("n", "gjv", function() -- only jump to variable_declarations
            sts.targeted_jump({ "variable_declaration" })
        end, opts)
        vim.keymap.set("n", "gjf", function() -- only jump to functions
            sts.targeted_jump({ "function", "arrow_function", "function_definition" })
            --> In this example, the Lua language schema uses "function",
            --  when the Python language uses "function_definition"
            --  we include both, so this keymap will work on both languages
        end, opts)
        vim.keymap.set("n", "gji", function() -- only jump to if_statements
            sts.targeted_jump({ "if_statement" })
        end, opts)
        vim.keymap.set("n", "gjl", function() -- only jump to for_statements
            sts.targeted_jump({ "for_statement" })
        end, opts)
        vim.keymap.set("n", "gjj", function() -- jump to all that you specify
            sts.targeted_jump({
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
        end, opts)

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
