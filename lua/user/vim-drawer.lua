-- File: lua/vim-drawer/init.lua
local M = {}

-- Default configuration
M.config = {
    spaces = vim.g.vim_drawer_spaces or {}
}

-- Set up the plugin with user configuration
function M.setup(user_config)
    M.config = vim.tbl_deep_extend("force", M.config, user_config or {})

    -- Set up autocommands
    vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd" }, {
        callback = function(args)
            local buftype = vim.bo.buftype
            local filetype = vim.bo.filetype
            local excludeBuftype = { "quickfix", "terminal", "nowrite" }
            local excludeFiletype = { "oil", }
            if vim.tbl_contains(excludeBuftype, buftype) or vim.tbl_contains(excludeFiletype, filetype) then
                return
            end

            M.handle_buffer(args.buf)
        end,
    })

    -- Handle manual tab creation
    vim.api.nvim_create_autocmd("TabNew", {
        callback = function()
            -- Set project_name to "Other" for all existing tabs without a project_name
            for _, tabnr in ipairs(vim.api.nvim_list_tabpages()) do
                local success, _ = pcall(vim.api.nvim_tabpage_get_var, tabnr, "project_name")
                if not success then
                    vim.api.nvim_tabpage_set_var(tabnr, "project_name", "Other")
                end
            end
            -- Set project_name for the new tab if not already set
            local current_tab = vim.api.nvim_get_current_tabpage()
            local success, _ = pcall(vim.api.nvim_tabpage_get_var, current_tab, "project_name")
            if not success then
                vim.api.nvim_tabpage_set_var(current_tab, "project_name", "Other")
            end
        end,
    })
end

-- Get project name for a given file path
function M.get_project_name(filepath)
    for _, space in ipairs(M.config.spaces) do
        local project_name, pattern = space[1], space[2]
        if string.match(filepath, pattern) then
            return project_name
        end
    end
    return "Other" -- Default to "Other" if no match
end

-- Find or create a tab for a project
function M.find_or_create_tab(project_name)
    -- Check existing tabs
    local other_tabs = {}
    for _, tabnr in ipairs(vim.api.nvim_list_tabpages()) do
        local tab_project = "" -- Default value if var doesn't exist
        local success, value = pcall(vim.api.nvim_tabpage_get_var, tabnr, "project_name")
        if success then
            tab_project = value
        end
        -- Collect all "Other" tabs
        if tab_project == "Other" then
            table.insert(other_tabs, tabnr)
        end
        -- For non-"Other" projects, return matching tab
        if tab_project == project_name and project_name ~= "Other" then
            return tabnr
        end
    end

    -- If project_name is "Other" and there are "Other" tabs, return the last one
    if project_name == "Other" and #other_tabs > 0 then
        return other_tabs[#other_tabs]
    end

    -- Create new tab
    vim.cmd("tabnew")
    local new_tabnr = vim.api.nvim_get_current_tabpage()
    vim.api.nvim_tabpage_set_var(new_tabnr, "project_name", project_name)
    return new_tabnr
end

-- Handle new buffer
function M.handle_buffer(bufnr)
    if not vim.api.nvim_buf_is_valid(bufnr) then
        return
    end

    local filepath = vim.api.nvim_buf_get_name(bufnr)
    if filepath == "" then
        return
    end

    local project_name = M.get_project_name(filepath)
    local current_tab = vim.api.nvim_get_current_tabpage()
    local current_tab_project = ""
    local success, value = pcall(vim.api.nvim_tabpage_get_var, current_tab, "project_name")
    if success then
        current_tab_project = value
    end

    -- Collect all "Other" tabs
    local other_tabs = {}
    for _, tabnr in ipairs(vim.api.nvim_list_tabpages()) do
        local tab_project = ""
        local success, value = pcall(vim.api.nvim_tabpage_get_var, tabnr, "project_name")
        if success then
            tab_project = value
        end
        if tab_project == "Other" then
            table.insert(other_tabs, tabnr)
        end
    end

    local target_tab
    if project_name == "Other" and #other_tabs > 0 then
        -- For "Other" files, use the last "Other" tab
        target_tab = other_tabs[#other_tabs]
    else
        -- For project files, find or create the appropriate tab
        target_tab = M.find_or_create_tab(project_name)
    end

    -- Move the buffer to the target tab if we're not already there
    if vim.api.nvim_get_current_tabpage() ~= target_tab then
        vim.api.nvim_set_current_tabpage(target_tab)
        vim.api.nvim_win_set_buf(vim.api.nvim_get_current_win(), bufnr)
    end

    -- Close all "Other" tabs except the target tab
    for _, tabnr in ipairs(other_tabs) do
        if tabnr ~= target_tab and vim.api.nvim_tabpage_is_valid(tabnr) then
            pcall(vim.cmd, "tabclose " .. tabnr)
        end
    end
end

-- Custom tabline function
function M.get_tabline()
    local s = ""
    for _, tabnr in ipairs(vim.api.nvim_list_tabpages()) do
        local project_name = "Other"
        local success, value = pcall(vim.api.nvim_tabpage_get_var, tabnr, "project_name")
        if success then
            project_name = value
        end
        local is_current = vim.api.nvim_get_current_tabpage() == tabnr
        s = s .. (is_current and "%#TabLineSel#" or "%#TabLine#")
        s = s .. " " .. project_name .. " "
    end
    s = s .. "%#TabLineFill#"
    return s
end

-- Set up custom tabline
vim.o.tabline = "%!luaeval('require(\"user.vim-drawer\").get_tabline()')"

return M
