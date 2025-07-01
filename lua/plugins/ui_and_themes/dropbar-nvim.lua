return {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    -- enabled = false,

    dependencies = {
        "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    },
    keys = {
        {
            "-<cr>",
            function()
                require("dropbar.api").pick()
            end,
            desc = "Dropbar pick",
        },

        {
            "s<cr>",
            function()
                require("dropbar.api").pick()
            end,
            desc = "Dropbar pick",
        },

        {
            "s-",
            function()
                require("dropbar.api").pick()
            end,
            desc = "Dropbar pick",
        },
        {
            "-0",
            function()
                require("dropbar.api").goto_context_start()
            end,
            desc = "Dropbar: Go to start of current context",
        },
        {
            "-=",
            function()
                require("dropbar.api").select_next_context()
            end,
            desc = "Dropbar: Go to end of current context",
        },
    },
    opts = function()
        local utils = require('dropbar.utils')
        local bar_utils = require('dropbar.utils.bar')
        local api = require('dropbar.api')

        local open_item_and_close_menu = function()
            local menu = utils.menu.get_current()
            local cursor = vim.api.nvim_win_get_cursor(menu.win)
            local entry = menu.entries[cursor[1]]
            -- stolen from https://github.com/Bekaboo/dropbar.nvim/issues/66
            local component = entry:first_clickable(entry.padding.left + entry.components[1]:bytewidth())
            if component then
                menu:click_on(component, nil, 1, 'l')
            end
        end

        -- Bug: after pressing "next_breadcrumb", (if no "popup" is open) it goes back
        -- 1 more breadcrumb than it should
        local function prev_breadcrumb()
            local menu = utils.menu.get_current()
            if menu.prev_menu then
                menu:close()
            end
            local bar = bar_utils.get({ win = menu.prev_win })
            if not bar then
                return
            end
            local barComponents = bar.components
            for _, component in ipairs(barComponents) do
                if component.menu then
                    local idx = component._.bar_idx
                    if idx > 1 then -- Only move if not at the first item
                        menu:close()
                        api.pick(idx - 1)
                    end
                    break
                end
            end
        end


        -- Bug: only works once
        local function next_breadcrumb()
            local menu = utils.menu.get_current()
            if menu.prev_menu then
                menu:close()
            end
            local bar = bar_utils.get({ win = menu.prev_win })
            if not bar then
                return
            end
            local barComponents = bar.components
            local maxIdx = #barComponents
            for _, component in ipairs(barComponents) do
                if component.menu then
                    local idx = component._.bar_idx
                    if idx < maxIdx then
                        menu:close()
                        api.pick(idx + 1)
                    end
                    break
                end
            end
        end
        local expand_menu = function()
            local menu = utils.menu.get_current()
            if not menu then
                return
            end
            local cursor = vim.api.nvim_win_get_cursor(menu.win)
            local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
            if component then
                menu:click_on(component, nil, 1, 'l')
            end
        end
        return {
            menu = {
                keymaps = {
                    ["<LeftMouse>"] = function()
                        local api = require("dropbar.api")
                        local menu = api.get_current_dropbar_menu()
                        if not menu then
                            return
                        end
                        local mouse = vim.fn.getmousepos()
                        if mouse.winid ~= menu.win then
                            local prev_menu = api.get_dropbar_menu(mouse.winid)
                            if prev_menu and prev_menu.sub_menu then
                                prev_menu.sub_menu:close()
                            end
                            if vim.api.nvim_win_is_valid(mouse.winid) then
                                vim.api.nvim_set_current_win(mouse.winid)
                            end
                            return
                        end
                        menu:click_at({ mouse.line, mouse.column - 1 }, nil, 1, "l")
                    end,
                    ['<C-h>'] = function()
                        -- Move to previous breadcrumb
                        prev_breadcrumb()
                    end,
                    ['<C-l>'] = function()
                        -- Move to next breadcrumb
                        next_breadcrumb()
                    end,
                    ['h'] = function()
                        prev_breadcrumb()
                    end,
                    ['l'] = function()
                        expand_menu()
                    end,
                    ['<CR>'] = open_item_and_close_menu,
                    ['o'] = open_item_and_close_menu,
                    ["q"] = function()
                        local menu = require("dropbar.api").get_current_dropbar_menu()
                        if not menu then
                            return
                        end
                        menu:close()
                    end,
                    ['i'] = function()
                        local menu = require("dropbar.utils").menu.get_current()
                        if not menu then
                            return
                        end
                        menu:fuzzy_find_open()
                    end,
                },
            },
        }
    end
}
