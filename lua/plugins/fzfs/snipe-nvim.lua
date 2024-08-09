return {
    "leath-dub/snipe.nvim",
    keys = {
        {
            "<leader>bs",
            function()
                require("snipe").create_buffer_menu_toggler()
            end,
            mode = { "n" },
            desc = "Snipe Buffers",
        },
    },
    config = function()
        require("snipe").setup({
            ui = {
                max_width = -1, -- -1 means dynamic width
                -- Where to place the ui window
                -- Can be any of "topleft", "bottomleft", "topright", "bottomright", "center", "cursor" (sets under the current cursor pos)
                position = "center",
            },
            hints = {
                -- Charaters to use for hints (NOTE: make sure they don't collide with the navigation keymaps)
                dictionary = "sadflewcmpghio",
            },
            navigate = {
                -- When the list is too long it is split into pages
                -- `[next|prev]_page` options allow you to navigate
                -- this list
                next_page = "J",
                prev_page = "K",

                -- You can also just use normal navigation to go to the item you want
                -- this option just sets the keybind for selecting the item under the
                -- cursor
                under_cursor = "<cr>",

                -- In case you changed your mind, provide a keybind that lets you
                -- cancel the snipe and close the window.
                cancel_snipe = "q",
            },
            -- The default sort used for the buffers
            -- Can be any of "last", (sort buffers by last accessed) "default" (sort buffers by its number)
            sort = "default",
        })
        -- local function file_menu_toggler()
        --     local function file_producer()
        --         local uv = (vim.loop or vim.uv)
        --         local items = {}
        --
        --         for name, type in vim.fs.dir(uv.cwd()) do
        --             table.insert(items, { type, name })
        --         end
        --
        --         local items_display = vim.tbl_map(function(ent)
        --             return string.format("%s %s", (ent[1] == "file" and "F" or "D"), ent[2])
        --         end, items)
        --
        --         return items, items_display
        --     end
        --
        --     return require("snipe").create_menu_toggler(file_producer, function(meta, _)
        --         vim.cmd.edit(meta[2])
        --     end)
        -- end
        --
        -- vim.keymap.set("n", "<leader>f", file_menu_toggler())
        local explode_string = function(str, sep)
            local t = {}
            for s in str:gmatch("([^" .. sep .. "]+)") do
                table.insert(t, s)
            end
            return t
        end

        local get_buffer_name = function(bufnr, opts)
            local name = vim.fn.bufname(bufnr)
            if #name == 0 then
                return "[No Name]"
            end

            local res = name:gsub(vim.env.HOME, "~", 1)

            if opts.max_path_width ~= nil then
                local rem = name
                res = ""
                for _ = 1, opts.max_path_width do
                    if vim.fs.dirname(rem) == rem then
                        break
                    end
                    if res ~= "" then
                        res = "/" .. res
                    end
                    if rem == vim.env.HOME then
                        res = "~" .. res
                    else
                        res = vim.fs.basename(rem) .. res
                    end
                    rem = vim.fs.dirname(rem)
                end
            end

            return res
        end

        local function buffer_menu_toggler()
            local function buffer_producer()
                local bufnrs = {}
                local bufnames = {}

                local buffers = vim.api.nvim_exec2("ls t", { output = true })

                for _, buf in ipairs(explode_string(buffers["output"], "\n")) do
                    local bufnr = tonumber(string.match(buf, "%d+"))

                    if vim.fn.buflisted(bufnr) then
                        table.insert(bufnrs, bufnr)
                        table.insert(bufnames, get_buffer_name(bufnr, {}))
                    end
                end

                return bufnrs, bufnames
                -- local uv = (vim.loop or vim.uv)
                -- local items = {}
                -- for name, type in vim.fs.dir(uv.cwd()) do
                --     table.insert(items, { type, name })
                -- end
                --
                -- local items_display = vim.tbl_map(function(ent)
                --     return string.format("%s %s", (ent[1] == "file" and "F" or "D"), ent[2])
                -- end, items)
                --
                -- return items, items_display
            end

            return require("snipe").create_menu_toggler(buffer_producer, function(bufnr, _)
                vim.api.nvim_set_current_buf(bufnr)
            end)
        end

        vim.keymap.set("n", "<leader>bs", buffer_menu_toggler())
    end,
}
