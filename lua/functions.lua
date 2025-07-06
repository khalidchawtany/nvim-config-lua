_G.tmp = {}

_G.ListLazyPluginDirs = function()
    local plugin_dirs = {}
    local handle = vim.loop.fs_scandir(vim.fn.stdpath("config") .. "/lua/plugins")
    while handle do
        local name, typ = vim.loop.fs_scandir_next(handle)

        if not name then
            break
        end
        if typ == "directory" then
            table.insert(plugin_dirs, { import = "plugins." .. name })
        end
    end

    return plugin_dirs
end

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end

function LoadAllPlugins()
    local unloaded = ""
    for k, v in pairs(_G.packer_plugins) do
        if v.loaded == false then
            unloaded = unloaded .. " " .. k
        end
    end
    require("packer").loader(unloaded)
end

string.startswith = function(self, str)
    return self:find("^" .. str) ~= nil
end

function table_merge(...)
    local tables_to_merge = { ... }
    assert(#tables_to_merge > 1, "There should be at least two tables to merge them")

    for k, t in ipairs(tables_to_merge) do
        assert(type(t) == "table", string.format("Expected a table as function parameter %d", k))
    end

    local result = tables_to_merge[1]

    for i = 2, #tables_to_merge do
        local from = tables_to_merge[i]
        for k, v in pairs(from) do
            if type(k) == "number" then
                table.insert(result, v)
            elseif type(k) == "string" then
                if type(v) == "table" then
                    result[k] = result[k] or {}
                    result[k] = table_merge(result[k], v)
                else
                    result[k] = v
                end
            end
        end
    end

    return result
end

function table.removekey(table, key)
    local element = table[key]
    table[key] = nil
    return element
end

function table.isempty(t)
    return next(t) == nil
end

function table.length(t)
    local count = 0
    for _ in pairs(t) do
        count = count + 1
    end
    return count
end

function table.copy_except_key(t, key)
    local t2 = {}
    for k, v in pairs(t) do
        if type(v) == "table" then
            if type(k) == "number" then
                table.insert(t2, table.copy_except_key(v, key))
            else
                t2[k] = table.copy_except_key(v, key)
            end
        elseif v == key then
            -- ignore
        else
            if type(k) == "number" then
                table.insert(t2, v)
            else
                t2[k] = v
            end
        end
    end
    return t2
end

function table.copy(t)
    local t2 = {}
    for k, v in pairs(t) do
        if type(v) == "table" then
            t2[k] = table.copy(v)
        else
            t2[k] = v
        end
    end
    return t2
end

local function load(modulename)
    local errmsg = ""
    for _, path in ipairs({
        "/Users/juju/.config/nvim/lua/?.lua",
        "/Users/juju/.config/nvim/lua/configs/?.lua",
        "/Users/juju/.luarocks/lib/?.lua",
        "/Users/juju/.luarocks/lib/?/?.lua",
    }) do
        local filename = string.gsub(path, "%?", modulename)
        local file = io.open(filename, "rb")

        if file then
            -- Compile and return the module
            return assert(loadstring(assert(file:read("*a")), filename))
        end
        errmsg = errmsg .. "\n\tno file '" .. filename .. "' ( Config Loader)"
    end
    -- return package.loaders[1](modulename)
    -- return errmsg
end
-- _G.myrequire = load
-- table.insert(package.loaders, 2, load) -- this will run before the standard loader, if you want it to
-- run after you can call table.insert(package.loaders, load)

-- local function load(modulename)
--     local errmsg = ""
--     for path in string.gmatch(package.path, "([^;]+)") do
--         local filename = string.gsub(path, "%?", modulename)
--         local file = io.open(filename, "rb")
--         -- dump(filename)
--         if file then
--             -- Compile and return the module
--             return assert(loadstring(assert(file:read("*a")), filename))
--         end
--         errmsg = errmsg .. "\n\tno file '" .. filename .. "' ( Custom Loader)"
--     end
--     return errmsg
-- end
-- table.insert(package.loaders, 2, load) -- this will run before the standard loader, if you want it to
-- run after you can call table.insert(package.loaders, load)

----------------------------------
--  Custom Packer Use Function  --
----------------------------------

local M = {
    -- enabledPluginRange = nil,
    -- disabled = {from = 105, to = 105},
    -- disabled = {except = {1,2,3,4,5,105}},
    -- disabled = {only = {105}},
    index = 0,
}

M.setPackerUse = function(use)
    M.packer_use = use
end

M.exclude = function(pluginName)
    if M.disabled == nil then
        return false
    end

    M.index = M.index + 1
    -- disable by range
    -- disabled = {from = 105, to = 105},
    if M.disabled.from and M.disabled.to then
        if M.index >= M.disabled.from and M.index <= M.disabled.to then
            return true
        end
    end

    -- disable except what is in the whitelist dictionary
    -- disabled = {except = {105}},
    if M.disabled.except then
        if not vim.tbl_contains(M.disabled.except, M.index) then
            return true
        end
    end

    -- disable only whta is in the dictionary
    -- disabled = {only = {105}},
    if M.disabled.only then
        if vim.tbl_contains(M.disabled.only, M.index) then
            _G.dump("Disabled : " .. pluginName)
            return true
        end
    end

    return false
end

M.use = function(plug)
    -- load plugin configs from the config dir
    local pluginName = ""
    if type(plug) == "table" then
        pluginName = plug[1]
    end
    if type(plug) == "string" then
        pluginName = plug
    end

    if M.exclude(pluginName) then
        return
    end

    -- get the plugin name part
    local pluginNameSepIndex = string.find(pluginName, "/[^/]*$")
    pluginName = "configs/" .. string.sub(pluginName, pluginNameSepIndex + 1)
    -- dump(pluginName)

    local status, plugConfFile = pcall(require, pluginName)

    if status then
        if type(plugConfFile) == "table" then
            if type(plugConfFile.init) == "function" then
                plugConfFile.init()
            end
            if type(plugConfFile.config) == "function" then
                plugConfFile["config"] = plugConfFile.config
            end

            -- override keys in the plug with config files
            if type(plug) == "string" then
                plug = { plug }
            end
            for k, v in pairs(plugConfFile) do
                plug[k] = v
            end
        end
    end

    if type(plug) == "table" and #plug >= 1 then
        local init = plug["init"]
        if init ~= nil then
            if type(init) == "function" then
                init({})
            end
            if type(init) == "string" then
                local req = require(init)
                if type(req) == "table" then
                    if type(req.init) == "function" then
                        req.init()
                    end

                    if type(req.config) == "function" then
                        plug["config"] = req.config
                    end
                end
            end
        end

        local config = plug["config"]
        if config ~= nil then
            if type(config) == "string" then
                require(config)
                table.removekey(plug, "config")
            end
        end
    end
    M.packer_use(plug)
end

M.closeMsgbox = function()
    -- Get all window numbers in current tab
    local wins = vim.api.nvim_tabpage_list_wins(0)

    for _, win in ipairs(wins) do
        -- Get buffer attached to window
        local buf = vim.api.nvim_win_get_buf(win)
        -- Get filetype of buffer
        local ft = vim.api.nvim_buf_get_option(buf, 'filetype')


        -- If filetype is msgbox, close the window
        if ft == 'msgbox'
            or ft == 'notify'
            or ft == 'msg'
            or ft == 'cmd'
            or ft == 'pager'
            or ft == 'dialog'
            or ft == "snacks_notif"
            or ft == "fugitive"
        then
            vim.api.nvim_win_close(win, false)
        end
    end
end

M.BS = function()
    require("notify").dismiss({ silent = true })
    M.closeMsgbox()

    vim.cmd([[
    filetype on
    " syntax sync minlines=1000
    nohlsearch
    diffupdate
    redraw!
    ]])
end

M.to_relative_path = function(path)
    local cwd = vim.fn.getcwd()
    if path:startswith(cwd) then
        return path:sub(#cwd + 2)
    end
    return path


    -- local full_path = vim.fn.expand('%:p')
    -- -- get the project root directory
    -- local root_dir = vim.fn.getcwd()
    -- -- remove the root path from the full path to get a relative path
    -- local rel_path = string.gsub(full_path, "^" .. vim.pesc(root_dir) .. "/", "")
end

return M
