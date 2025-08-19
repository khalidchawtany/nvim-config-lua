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
            M.handle_buffer(args.buf)
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
    return "No Project" -- Default to "No Project" if no match
end

-- Find or create a tab for a project
function M.find_or_create_tab(project_name)
    -- Check existing tabs
    local no_project_tab = nil
    for _, tabnr in ipairs(vim.api.nvim_list_tabpages()) do
        local tab_project = "" -- Default value if var doesn't exist
        local success, value = pcall(vim.api.nvim_tabpage_get_var, tabnr, "project_name")
        if success then
            tab_project = value
        end
        if tab_project == project_name then
            return tabnr
        end
        if tab_project == "No Project" then
            no_project_tab = tabnr
        end
    end

    -- For "No Project", reuse existing tab if available
    if project_name == "No Project" and no_project_tab then
        return no_project_tab
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
    local target_tab = M.find_or_create_tab(project_name)

    -- If we're not in the target tab, move the buffer
    if vim.api.nvim_get_current_tabpage() ~= target_tab then
        local win = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_buf(win, bufnr)
        vim.api.nvim_set_current_tabpage(target_tab)
    end
end

-- Custom tabline function
function M.get_tabline()
    local s = ""
    for _, tabnr in ipairs(vim.api.nvim_list_tabpages()) do
        local project_name = "No Project"
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
