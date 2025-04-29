return {
    "jake-stewart/multicursor.nvim",
    branch = "main",
    event = "BufEnter",
    -- enabled = false,
    config = function()
        local mc = require("multicursor-nvim")

        mc.setup({
            -- set to true if you want multicursor undo history
            -- to clear when clearing cursors
            shallowUndo = false,

            -- set to empty table to disable signs
            signs = { " ┆"," │", " ┃" },
        })

        -- Add or skip cursor above/below the main cursor.
        vim.keymap.set ( {"n" , "v"} , "<leader>sk" , function () mc.lineAddCursor  ( -1 ) end , {desc = "MC: add cursor above"} )
        vim.keymap.set ( {"n" , "v"} , "<leader>sj" , function () mc.lineAddCursor  ( 1  ) end , {desc = "MC: Add cursor below"} )
        vim.keymap.set ( {"n" , "v"} , "<leader>sJ" , function () mc.lineSkipCursor ( -1 ) end , {desc = "MC: Skip line above"}  )
        vim.keymap.set ( {"n" , "v"} , "<leader>sK" , function () mc.lineSkipCursor ( 1  ) end , {desc = "MC: Skip line below"}  )

        -- Add or skip adding a new cursor by matching the current word/selection
        vim.keymap.set ( {"n" , "v"} , "<leader>sn" , function () mc.matchAddCursor  ( 1  ) end , {desc = "MC: add match below"}  )
        vim.keymap.set ( {"n" , "v"} , "<leader>sN" , function () mc.matchSkipCursor ( 1  ) end , {desc = "MC: skip match below"} )
        vim.keymap.set ( {"n" , "v"} , "<leader>sp" , function () mc.matchAddCursor  ( -1 ) end , {desc = "MC: add match above"}  )
        vim.keymap.set ( {"n" , "v"} , "<leader>sP" , function () mc.matchSkipCursor ( -1 ) end , {desc = "MC: skip match above"} )

        -- Add cursor to operator gaip to add cursor to all lines of the paragraph
        vim.keymap.set("n", "ga", mc.addCursorOperator)


        -- Add cursor to all occurrences of the current word.
        vim.keymap.set({"n"}, "<leader>s/", mc.searchAllAddCursors)

        -- You can also add cursors with any motion you prefer:
        -- vim.keymap.set("n", "<right>", function() mc.addCursor("w") end)
        -- vim.keymap.set("n", "<leader><right>", function() mc.skipCursor("w") end)

        -- Add a cursor and jump to the next word under cursor.
        vim.keymap.set({"n", "v"}, "<leader>sa", function() mc.addCursor("*") end, {desc = "MC: add match *"})
        vim.keymap.set({"n", "v"}, "<c-n>", function() mc.addCursor("*") end, {desc = "MC: add match *"})
        -- vim.keymap.set({"n", "v"}, "<c-p>", function() mc.addCursor("#") end, {desc = "MC: add match #"})

        -- Jump to the next word under cursor but do not add a cursor.
        vim.keymap.set({"n", "v"}, "<leaer>sA", function() mc.skipCursor("*") end, {desc = "MC: skip match *"})

        -- Rotate the main cursor.
        vim.keymap.set({"n", "v"}, "<leader>s<left>", mc.nextCursor, {desc = "MC: next cursor"})
        vim.keymap.set({"n", "v"}, "<leader>s<right>", mc.prevCursor, {desc = "MC: prev cursor"})

        -- Delete the main cursor.
        vim.keymap.set({"n", "v"}, "<leader>s<bs>", mc.deleteCursor, {desc = "MC: delete cursor"})
        vim.keymap.set({"n", "v"}, "<leader>sd", mc.clearCursors, {desc = "MC: clear cursors"})

        -- Add and remove cursors with control + left click.
        vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)

        vim.keymap.set({"n", "v"}, "<leader>st", function()
            if mc.cursorsEnabled() then
                -- Stop other cursors from moving.
                -- This allows you to reposition the main cursor.
                mc.disableCursors()
            else
                mc.addCursor()
            end
        end, {desc = "MC: disable cursors"})

        -- clone every cursor and disable the originals
        vim.keymap.set({"n", "v"}, "<leader>sc", mc.duplicateCursors, {desc = "MC: duplicate cursors"})

        vim.keymap.set("n", "<esc>", function()
            if not mc.cursorsEnabled() then
                mc.enableCursors()
            elseif mc.hasCursors() then
                mc.clearCursors()
            else
                -- Default <esc> handler.
            end
        end, {desc = "MC: clear cursors"})

        -- Align cursor columns.
        vim.keymap.set("v", "<leader>a", mc.alignCursors, {desc = "MC: align cursors"})

        -- Split visual selections by regex.
        vim.keymap.set("v", "<leader>si", mc.splitCursors, {desc = "MC: split cursors"})

        -- Append/insert for each line of visual selections.
        vim.keymap.set("v", "I", mc.insertVisual, {desc = "MC: Insert cursors"})
        vim.keymap.set("v", "A", mc.appendVisual, {desc = "MC: Add cursors"})

        -- match new cursors within visual selections by regex.
        vim.keymap.set("v", "M", mc.matchCursors, {desc = "MC: match cursors"})

        -- Rotate visual selection contents.
        vim.keymap.set("v", "<leader>st", function() mc.transposeCursors(1) end, {desc = "MC: transpose+1 cursors"})
        vim.keymap.set("v", "<leader>sT", function() mc.transposeCursors(-1) end, {desc = "MC: transpose-1 cursors"})

        -- Customize how cursors look.
        vim.api.nvim_set_hl(0, "MultiCursorCursor", { link = "Cursor" })
        vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
        vim.api.nvim_set_hl(0, "MultiCursorSign", { link = "SignColumn"})
        vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
        vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
        vim.api.nvim_set_hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
    end,
}
