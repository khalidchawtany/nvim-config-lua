-- Check if 'hidden' option is enabled
if not vim.o.hidden then
    vim.notify("VimDrawer requires 'hidden' option enabled!", vim.log.levels.WARN)
    return
end

-- Module table
local M = {
    auto_classification = true,
}

-- Get spaces configuration
local function get_spaces()
    return vim.g.vim_drawer_spaces or {
        { "React",  "\\*MartReact\\*" },
        { "http", "\\*.http$" },
        { "Admin",  "\\*OneWayAdmin\\*" },
        { "Docs",  "\\*Docs_OneWay\\*" },
        { "Driver",  "\\*TaxiDriver\\*" },
        { "Rider",  "\\*TaxiRider\\*" },
        { "UserMart",  "\\*UserMart\\*" },
    }
end


-- Match drawer based on file path
local function match_drawer(file_path)
    local tabs = {}
    local tabpages = vim.api.nvim_list_tabpages()

    for i, tabpage in ipairs(tabpages) do
        local tab_id = i
        local ok, label = pcall(vim.api.nvim_tabpage_get_var, tabpage, "tablabel")
        tabs[tab_id] = ok and label or ""
    end

    for _, space in ipairs(get_spaces()) do
        if file_path:match(space[2]) then
            local tab_index = vim.fn.index(tabs, space[1]) + 1
            return { existing_drawer = true, tab_name = space[1], tab_id = tab_index }
        end
    end
    return { existing_drawer = false, tab_name = nil, tab_id = 0 }
end

-- Add buffer to tab's drawer list
local function add_tab_buffer()
    local tabnr = vim.api.nvim_get_current_tabpage()
    local buf = vim.api.nvim_get_current_buf()
    local buf_name = vim.api.nvim_buf_get_name(buf)

    -- Skip if buffer is unmodifiable, unlisted, or NERDTree
    if not vim.bo[buf].modifiable
        or not vim.bo[buf].buflisted
        or buf_name:match("NERD_tree_") then
        return
    end

    -- Handle auto-classification
    if not M.auto_classification then
        return
    end

    local match = match_drawer(buf_name)
    local current_tab = vim.api.nvim_get_current_tabpage()
    local is_first_buffer = buf == 1
    local prev_buf = vim.fn.bufnr("#")

    if match.existing_drawer and (match.tab_id == 0 or match.tab_id ~= current_tab) then
        if not is_first_buffer then
            vim.api.nvim_set_current_buf(prev_buf == buf and vim.api.nvim_create_buf(true, false) or prev_buf)
        end

        if match.tab_id == 0 then
            if not is_first_buffer then
                vim.cmd.tabedit({ args = { buf_name } })
            end
            vim.t[vim.api.nvim_get_current_tabpage()].tablabel = match.tab_name or ""
            vim.cmd.redraw()
        elseif match.tab_id ~= current_tab then
            vim.api.nvim_set_current_tabpage(match.tab_id)
            vim.api.nvim_set_current_buf(buf)
        end
    end
end

-- Toggle auto-classification
local function toggle_auto_classification()
    M.auto_classification = not M.auto_classification
    vim.notify("VimDrawer auto-classification " .. (M.auto_classification and "enabled" or "disabled"),
        vim.log.levels.INFO)
end

-- Tabline function
function M.vim_drawer_tabline()
    local tabline = ""
    local current_tab = vim.api.nvim_get_current_tabpage()
    local tabpages = vim.api.nvim_list_tabpages()
    for tab_id = 1, #tabpages do
        local ok, title = pcall(vim.api.nvim_tabpage_get_var, tab_id, "tablabel")
        title = ok and title or ""
        tabline = tabline .. "%" .. tab_id .. "T"
        tabline = tabline .. (tab_id == current_tab and "%#TabLineSel#" or "%#TabLine#")
        tabline = tabline .. " " .. tab_id .. " " .. title .. " "
    end
    tabline = tabline .. "%#TabLineFill#%T"
    if #tabpages > 1 then
        tabline = tabline .. "%=%#TabLine#%999XX"
    end
    return tabline
end

-- Setup tabline
if vim.o.showtabline > 0 then
    vim.o.tabline = "%!luaeval('require(\"user.vim-drawer\").vim_drawer_tabline()')"
end

-- Setup GUI tab label
if vim.fn.has("gui_running") == 1 and vim.o.guioptions:match("e") then
    vim.o.guitablabel = "%{luaeval('require(\"user.vim-drawer\").vim_drawer_tabline()')}"
    vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
            vim.o.guitablabel = "%{luaeval('require(\"user.vim-drawer\").vim_drawer_tabline()')}"
        end,
    })
end

-- Autocommands
local group = vim.api.nvim_create_augroup("VimDrawerGroup", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", { group = group, callback = add_tab_buffer })

-- Commands
vim.api.nvim_create_user_command("VimDrawerAutoClassificationToggle", toggle_auto_classification, {})

return M
