function table.removekey(table, key)
    local element = table[key]
    table[key] = nil
    return element
end

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

local function load(modulename)
    local errmsg = ""
    for _, path in ipairs({'/Users/juju/.config/nvim/lua/?.lua', '/Users/juju/.config/nvim/lua/configs/?.lua'}) do
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
table.insert(package.loaders, 2, load) -- this will run before the standard loader, if you want it to
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

local M = {}
M.setPackerUse = function(use)
    M.packer_use = use
end
M.use = function(plug)

    -- load plugin configs from the config dir
    local pluginName = ''
    if (type(plug) == 'table') then pluginName = plug[1] end
    if (type(plug) == 'string') then pluginName = plug end

    -- get the plugin name part
    local pluginNameSepIndex = string.find(pluginName, '/')
    pluginName = 'configs/' .. string.sub(pluginName, pluginNameSepIndex + 1)
    -- dump(pluginName)

    local status, plugConfFile = pcall(require, pluginName)

    if (status) then
        if type(plugConfFile) == 'table' then
            if type(plugConfFile.init) == 'function' then plugConfFile.init() end
            if type(plugConfFile.config) == 'function' then plugConfFile['config'] = plugConfFile.config end

            -- override keys in the plug with config files
            if type(plug) == 'string' then plug = {plug} end
            for k, v in pairs(plugConfFile) do plug[k] = v end
        end
    end

    if type(plug) == 'table' and #plug >= 1 then
        local init = plug['init']
        if init ~= nil then
            if type(init) == 'function' then init {} end
            if type(init) == 'string' then
                local req = require(init)
                if type(req) == 'table' then

                    if type(req.init) == 'function' then req.init() end

                    if type(req.config) == 'function' then plug['config'] = req.config end
                end
            end
        end

        local config = plug['config']
        if config ~= nil then
            if type(config) == 'string' then
                require(config)
                table.removekey(plug, 'config')
            end
        end
    end
    M.packer_use(plug)
end

return M
