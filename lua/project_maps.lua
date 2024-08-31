local path = require("plenary.path")
local os_sep = path.path.sep

_G.APPLIED_PROJECT_MAPS = nil

_G.PROJECTS_MAPS = {
    october = {
        {
            desciption = "M-Lang (OCT)",
            keys = "<leader>ll",
            paths = { { "plugins" } },
            prompt = "lang",
            fd_opts = { "--full-path", "-g", "**/lox/**/lang/**/*.php" },
        },
        {
            desciption = "M-Yaml (OCT)",
            keys = "<leader>lyy",
            paths = { { "plugins" } },
            prompt = "yaml",
            fd_opts = { "--full-path", "-g", "**/lox/**/*.yaml" },
        },
        {
            desciption = "M-Yaml - Controller (OCT)",
            keys = "<leader>lyc",
            paths = { { "plugins" } },
            prompt = "yaml",
            fd_opts = { "--full-path", "-g", "**/lox/**/controllers/*/*.yaml" },
        },
        {
            desciption = "M-Yaml - Models (OCT)",
            keys = "<leader>lya",
            paths = { { "plugins" } },
            prompt = "yaml",
            fd_opts = { "--full-path", "-g", "**/lox/**/models/*/*.yaml" },
        },
        {
            desciption = "M-Migrations (OCT)",
            keys = "<leader>lm",
            paths = { { "plugins" } },
            prompt = "migrations",
            fd_opts = { "--full-path", "-g", "**/lox/**/updates/*" },
        },
        {
            desciption = "M-Componenets (OCT)",
            keys = "<leader>loo",
            paths = { { "plugins" } },
            prompt = "components",
            fd_opts = { "--full-path", "-g", "**/lox/**/components/*.php" },
        },
        {
            desciption = "M-Componenets (OCT)",
            keys = "<leader>lo",
            paths = { { "plugins" } },
            prompt = "components",
            fd_opts = { "--full-path", "-g", "**/lox/**/components/**" },
        },
        {
            desciption = "M-Pages (OCT)",
            keys = "<leader>lp",
            paths = { { "themes" } },
            prompt = "pages",
            fd_opts = { "--full-path", "-g", "**/pages/**" },
        },
        {
            desciption = "Controllers PHP (OCT)",
            keys = "<leader>lC",
            paths = { { "plugins" } },
            prompt = "controllers",
            fd_opts = { "--full-path", "-g", "**/controllers/*.php" },
        },
        {
            desciption = "M-Controllers PHP (OCT)",
            keys = "<leader>lc",
            paths = { { "plugins" } },
            prompt = "controllers",
            fd_opts = { "--full-path", "-g", "**/lox/**/controllers/*.php" },
        },
        {
            desciption = "Controllers (OCT)",
            keys = "<leader>lC",
            paths = { { "plugins" } },
            prompt = "controllers",
            fd_opts = { "--full-path", "-g", "**/controllers/**" },
        },
        {
            desciption = "M-Controllers (OCT)",
            keys = "<leader>lk",
            paths = { { "plugins" } },
            prompt = "controllers",
            fd_opts = { "--full-path", "-g", "**/lox/**/controllers/**" },
        },
        {
            desciption = "M-Classes (OCT)",
            keys = "<leader>lu",
            paths = { { "plugins" } },
            prompt = "Classes (Util)",
            fd_opts = { "--full-path", "-g", "**/lox/**/classes/**" },
        },
        {
            desciption = "M-Models (OCT)",
            keys = "<leader>la",
            paths = { { "plugins" } },
            prompt = "models",
            fd_opts = { "--full-path", "-g", "**/lox/**/models/*.php" },
        },
        {
            desciption = "M-Models (OCT)",
            keys = "<leader>ln",
            paths = { { "plugins" } },
            prompt = "models",
            fd_opts = { "--full-path", "-g", "**/lox/**/models/*/*" },
        },
        {
            desciption = "Models (OCT)",
            keys = "<leader>lA",
            paths = { { "plugins" } },
            prompt = "models",
            fd_opts = { "--full-path", "-g", "**/models/*.php" },
        },
        {
            desciption = "lox (OCT)",
            keys = "<leader>l<leader>",
            paths = { { "plugins" } },
            prompt = "all",
            fd_opts = { "--full-path", "-g", "**/lox/**/*" },
        },
        {
            desciption = "Themes (IGN)",
            keys = "<leader>lt",
            paths = { { "themes" } },
        },
    },
    laravel = {
        {
            desciption = "Components (LRVL-JS)",
            keys = "<leader>ljc",
            paths = { { "resources", "js", "components" } },
        },
        {
            desciption = "Pages (LRVL-JS)",
            keys = "<leader>ljp",
            paths = { { "resources", "js", "pages" } },
        },
        {
            desciption = "Layout (LRVL-JS)",
            keys = "<leader>ljl",
            paths = { { "resources", "js", "layouts" } },
        },
        {
            desciption = "Types (LRVL-JS)",
            keys = "<leader>ljl",
            paths = { { "resources", "js", "types" } },
        },
        {
            desciption = "JS (LRVL-JS)",
            keys = "<leader>ljj",
            paths = { { "resources", "js" } },
        },
        {
            desciption = "Controllers (LRVL)",
            keys = "<leader>lc",
            paths = { { "app", "Http", "Controllers" } },
        },
        {
            desciption = "Models (LRVL)",
            keys = "<leader>la",
            paths = { { "app" }, { "app", "Models" } },
            fd_opts = { "-d", "1", "-g", "*.php" },
        },
        {
            desciption = "Factories (LRVL)",
            keys = "<leader>lfa",
            paths = { { "database", "factories" } },
            fd_opts = { "-d", "1", "-g", "*.php" },
        },

        {
            desciption = "Filament Resources (LRVL)",
            keys = "<leader>lfr",
            paths = { { "app", "Filament" } },
            fd_opts = { "--full-path", "-g", "**/**/*" },
        },

        {
            desciption = "Filament Providers (LRVL)",
            keys = "<leader>lfp",
            paths = { { "app", "Providers", "Filament" } },
            fd_opts = { "-d", "1", "-g", "*.php" },
        },
        {
            desciption = "Seeders (LRVL)",
            keys = "<leader>ls",
            paths = { { "database", "seeders" } },
            fd_opts = { "-d", "1", "-g", "*.php" },
        },
        {
            desciption = "Traits (LRVL)",
            keys = "<leader>lt",
            paths = { { "app", "Traits" } },
            fd_opts = { "-d", "1", "-g", "*.php" },
        },
        {
            desciption = "App (LRVL)",
            keys = "<leader>lA",
            paths = { { "app" } },
            fd_opts = { "-g", "*.php" },
        },
        {
            desciption = "Migrations (LRVL)",
            keys = "<leader>lm",
            paths = { { "database", "migrations" } },
            fd_opts = { "-d", "1", "-g", "*.php" },
        },
        {
            desciption = "Views (LRVL)",
            keys = "<leader>lv",
            paths = { { "resources", "views" } },
        },
        {
            desciption = "Breads (LRVL)",
            keys = "<leader>lb",
            paths = { { "resources", "bread" } },
        },
        {
            desciption = "Routes (LRVL)",
            keys = "<leader>lw",
            paths = { { "routes" } },
        },
        {
            desciption = "Requests (LRVL)",
            keys = "<leader>lr",
            paths = { { "app", "Http", "Requests" } },
        },
    },
    ignite = {
        {
            desciption = "Components (IGN)",
            keys = "<leader>lc",
            paths = { { "app", "components" } },
        },
        {
            desciption = "Screens (IGN)",
            keys = "<leader>ls",
            paths = { { "app", "screens" } },
        },
        {
            desciption = "Models (IGN)",
            keys = "<leader>lm",
            paths = { { "app", "models" } },
        },
        {
            desciption = "API (IGN)",
            keys = "<leader>la",
            paths = { { "app", "services", "api" } },
        },
        {
            desciption = "DB (IGN)",
            keys = "<leader>ld",
            paths = { { "app", "services", "database" } },
        },
        {
            desciption = "Navigator (IGN)",
            keys = "<leader>ln",
            paths = { { "app", "navigators" } },
        },
    },
}

function MapProjectKeys()
    local project_type = ""
    local pwd = vim.loop.cwd()
    -- dump(pwd)

    project_type = path:new(pwd .. os_sep .. "ignite"):exists() and "ignite" or project_type
    project_type = path:new(pwd .. os_sep .. "composer.json"):exists() and "laravel" or project_type
    project_type = (
            path:new(pwd .. os_sep .. "composer.json"):exists() and path:new(pwd .. os_sep .. "plugins"):exists()
        )
        and "october"
        or project_type

    -- get the project_type specific maps
    local project_maps = PROJECTS_MAPS[project_type]

    if project_maps == nil then
        return ""
    end

    -- if APPLIED_PROJECT_MAPS == project_type then
    --   return nil
    -- else
    --   APPLIED_PROJECT_MAPS = project_type
    -- end

    local developer = "lox"
    if project_type == "october" then
        if path:new(pwd .. os_sep .. "plugins" .. os_sep .. "khalid"):exists() then
            developer = "khalid"
        end
    end

    for _, i in pairs(project_maps) do
        -- get the paths for each map entry
        local i_paths = {}
        for _, ip in pairs(i.paths) do
            local i_path = path:new(vim.loop.cwd() .. os_sep .. table.concat(ip, os_sep)):absolute()
            table.insert(i_paths, i_path)
        end

        local opts = {
            -- search_dirs = i_paths, -- moved downwards to allow --strip-cwd-prefix
            find_command = { "fd", "--type", "f" },
            -- opts["cwd"] = i_paths
        }

        -- if search paths is a single entry then strip cwd prefix unless strictly prohibbited
        if table.length(i_paths) < 2 then
            opts["cwd"] = i_paths[1]
            table.insert(opts.find_command, "--strip-cwd-prefix")
        else
            opts["search_dirs"] = i_paths
        end

        if i["desciption"] ~= nil then
            opts["prompt_title"] = i.desciption
        end

        if i["fd_opts"] ~= nil then
            for _, v in ipairs(i["fd_opts"]) do
                v = string.gsub(v, "lox", developer)
                table.insert(opts.find_command, v)
            end
        end

        -- dump(opts)

        -- map the entry
        vim.keymap.set("n", i.keys, function()
            require("telescope.builtin").find_files(table.copy(opts))
        end)
    end
end

vim.cmd([[ au DirChanged * lua MapProjectKeys() ]])
