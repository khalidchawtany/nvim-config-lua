local lower = function(w)
    return string.lower(w)
end
return {
    "khalidchawtany/telescope-alternate.nvim",
    -- "otavioschwanck/telescope-alternate",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
        {
            "<c-s><c-f>",
            function()
                -- require("telescope").extensions["telescope-alternate"].alternate_file({ previewer = false })
                require('telescope-alternate.snacks').alternate({})
            end,
            desc = "Telescope (Alternate)",
        },
        {
            "<leader>p[",
            function()
                -- require("telescope").extensions["telescope-alternate"].alternate_file({ previewer = false })
                require('telescope-alternate.snacks').alternate({})
            end,
            desc = "Snack (Alternate)",
        },
        {
            "<c-s><c-space>",
            function()
                require("telescope").extensions["telescope-alternate"].alternate_file({ previewer = false })
            end,
            desc = "Telescope (Alternate)",
        },
        {
            "<c-s>space",
            function()
                require("telescope").extensions["telescope-alternate"].alternate_file({ previewer = false })
            end,
            desc = "Telescope (Alternate)",
        },
    },

    config = function()
        require("telescope-alternate").setup({
            mappings = {

                -- Laravel l10
                {
                    "(.*)/Models/(.*).php",
                    {
                        -- {"[1]/Models/[2].php", "Model", true},
                        { "[1]/Http/Controllers/[2]Controller.php",               "Controller", true },
                        { "[1]/Http/Requests/[2:pluralize]/",                     "Request",    true },
                        { "[1]/../resources/views/[2:pluralize,camel_to_snake]/", "View",       true },
                    },
                },
                {
                    "(.*)/Http/Controllers/(.*).php",
                    {
                        { "[1]/Models/[2:strip_controller].php",                  "Model",   true },
                        -- {"[1]/Http/Controllers/[2].php", "Controller", true},
                        { "[1]/Http/Requests/[2:strip_controller,pluralize]/",    "Request", true },
                        { "[1]/../resources/views/[2:pluralize,camel_to_snake]/", "View",    true },
                        { "[1]/../resources/views/[2:pluralize,camel_to_snake]/", "View",    true },
                    },
                },
                {
                    "(.*)/Http/Requests/(.*)/(.*).php",
                    {
                        { "[1]/Models/[2:singularize].php",                       "Model",      true },
                        { "[1]/Http/Controllers/[2:singularize]Controller.php",   "Controller", true },
                        { "[1]/Http/Requests/[2]/",                               "Request",    true },
                        { "[1]/../resources/views/[2:pluralize,camel_to_snake]/", "View",       true },
                    },
                },
                {
                    -- "(.*)/resources/views/([^/])/(.*)",
                    "(.*)resources/views/(.*)/(.*).blade.php",
                    {
                        {
                            "[1]app/Models/[2:singularize,snake_to_pascal].php",
                            "Model",
                            true,
                        },
                        {
                            "[1]app/Http/Controllers/[2:singularize,snake_to_pascal]Controller.php",
                            "Controller",
                            true,
                        },
                        {
                            "[1]app/Http/Requests/[2:snake_to_pascal]/",
                            "Request",
                            true,
                        },
                        { "[1]resources/views/[2]/", "View", true },
                    },
                },

                -- OctoberCMS
                {
                    pattern = "(.*)/updates/create_table_(.*).php",
                    targets = {
                        { template = "[1]/models/[2:singularize].php",     label = "Model",         enable_new = false,  order = 1 },
                        { template = "[1]/controllers/[2].php",            label = "Controller",    enable_new = false,  order = 2 },
                        { template = "[1]/models/[2:singularize]/*fields.yaml",        label = "Fields",        enable_new = false,  order = 3 },
                        { template = "[1]/models/[2:singularize]/*columns.yaml",       label = "Columns",       enable_new = false,  order = 4 },
                        { template = "[1]/models/[2:singularize]/*.*",                 label = "Model-F",       enable_new = false,  order = 5 },
                        { template = "[1]/controllers/[2]/*.*",  label = "Controller-F",  enable_new = false,  order = 6 },
                    },
                },
                {
                    pattern = "(.*)/models/(.*).php",
                    targets = {
                        { template = "[1]/models/[2].php",                               label = "Model",        enable_new = false, order = 1 },
                        { template = "[1]/controllers/[2:pluralize].php",                label = "Controller",   enable_new = false, order = 2 },
                        { template = "[1]/models/[2:lower]/*fields.yaml",                label = "Fields",       enable_new = false, order = 3 },
                        { template = "[1]/models/[2:lower]/*columns.yaml",               label = "Columns",      enable_new = false, order = 4 },
                        { template = "[1]/models/[2:lower]/*.*",                         label = "Model-F",      enable_new = false, order = 5 },
                        { template = "[1]/controllers/[2:pluralize,lower]/*.*",          label = "Controller-F", enable_new = false, order = 6 },
                        { template = "[1]/updates/create_table_[2:pluralize,lower].php", label = "Migration",    enable_new = false, order = 7 },
                    },
                },
                {
                    "(.*)/controllers/(.*).php",
                    {
                        { "[1]/models/[2:singularize].php",                       "Model",         false, 1 },
                        { "[1]/controllers/[2:pluralize].php",                    "Controller",    false, 2 },
                        { "[1]/models/[2:singularize,lower]/_config_form.yaml",   "Config Form",   false, 3 },
                        { "[1]/models/[2:singularize,lower]/_config_list.yaml",   "Config List",   false, 4 },
                        { "[1]/models/[2:singularize,lower]/_config_filter.yaml", "Config Filter", false, 5 },
                        { "[1]/controllers/[2:pluralize,lower]/*.*",              "Controller-F",  false, 6 },
                        { "[1]/models/[2:singularize,lower]/*.*",                 "Model-F",       false, 7 },
                        { "[1]/updates/create_table_[2:singularize,lower].php",    "Migration",     false, 8 },
                    },
                },
                {
                    "(.*)/controllers/(.*)/(.*).[yaml\\|htm]",
                    {
                        { "[1]/models/[2:singularize].php",                "Model",        false, 1 },
                        { "[1]/controllers/[2:snake_to_pascal].php", "Controller",   false, 2 },
                        { "[1]/controllers/[2:lower]/*.*",                 "Controller-F", false, 3 },
                        { "[1]/models/[2:singularize,lower]/*.*",          "Model-F",      false, 4 },
                        { "[1]/updates/create_table_[2:lower].php",         "Migration",    false, 5 },
                    },
                },
                {
                    "(.*)/models/(.*)/(.*).[yaml\\|htm]",
                    {
                        { "[1]/models/[2].php",                    "Model",        false, 1 },
                        { "[1]/controllers/[2:pluralize,snake_to_pascal].php", "Controller",   false, 2 },
                        { "[1]/controllers/[2:pluralize]/*.*",                 "Controller-F", false, 3 },
                        { "[1]/models/[2:lower]/*.*",              "Model-F",      false, 4 },
                        { "[1]/updates/create_table_[2:pluralize,lower].php",             "Migration",    false, 5 },
                    },
                },
            },
            presets = {}, -- Telescope pre-defined mapping presets
            transformers = {

                lower = lower,

                lower_last = function(w)
                    local p1 = string.sub(w, 1, -3)
                    local last_char = string.sub(w, -2, -1)
                    last_char = last_char:lower()
                    return p1 .. last_char
                end,

                upper = function(w)
                    return string.upper(w)
                end,

                strip_controller = function(w)
                    return string.sub(w, 1, -11)
                end,

                camel_to_snake = function(inputString)
                    local pathParts = {}

                    inputString:gsub("%w+[^/]", function(str)
                        table.insert(pathParts, str)
                    end)

                    for i, part in pairs(pathParts) do
                        local camelParts = {}
                        part:gsub("%u%l+", function(str)
                            table.insert(camelParts, str:lower())
                        end)
                        pathParts[i] = table.concat(camelParts, "_")
                    end
                    return table.concat(pathParts, "/")
                end,

                snake_to_pascal = function(inputString)
                    inputString = inputString:gsub("^%l", string.upper)

                    local pathParts = {}

                    inputString:gsub("[%w-_]+[^/]", function(str)
                        table.insert(pathParts, str)
                    end)

                    for i, part in pairs(pathParts) do
                        local tmp = ""
                        for key in part:gmatch("[^_]+") do
                            tmp = tmp .. key:sub(1, 1):upper() .. key:sub(2)
                        end
                        pathParts[i] = tmp
                    end

                    return table.concat(pathParts, "/")
                end,
            },
        })

        -- On your telescope:
        require("telescope").load_extension("telescope-alternate")
    end,
}

--  {
--   "app/services/(.*)_services/(.*).rb",
--   {
--     -- alternate from services to contracts / models
--     {"app/contracts/[1]_contracts/[2].rb", "Contract"}, -- Adding label to switch
--     {"app/models/**/*[1].rb", "Model", true} -- Ignore create entry (with true)
--   }
-- },
-- {"app/contracts/(.*)_contracts/(.*).rb", {{"app/services/[1]_services/[2].rb", "Service"}}}, -- from contracts to services
-- -- Search anything on helper folder that contains pluralize version of model.
-- --Example: app/models/user.rb -> app/helpers/foo/bar/my_users_helper.rb
-- {"app/models/(.*).rb", {{"db/helpers/**/*[1:pluralize]*.rb", "Helper"}}},
-- {"app/**/*.rb", {{"spec/[1].rb", "Test"}}} -- Alternate between file and test

--  {
--   { "app/models/(.*).rb", {
--     { "app/controllers/**/*[1:pluralize]_controller.rb", "Controller" },
--     { "app/views/[1:pluralize]/*.html.erb", "View" },
--     { "app/helpers/[1]_helper.rb", "Helper" },
--     { "app/serializers/**/*[1]_serializer.rb", "Serializer" }
--   } },
--   { "app/controllers(.*)/(.*)_controller.rb", {
--     { "app/models/**/*[2:singularize].rb", "Model" },
--     { "app/views/[1][2]/*.html.erb", "View" },
--     { "app/helpers/**/*[2]_helper.rb", "Helper" },
--     { "app/serializers/**/*[2]_serializer.rb", "Serializer" }
--   } },
--   { "app/views/(.*)/(.*).html.(.*)", {
--     { "app/controllers/**/*[1]_controller.rb", "Controller" },
--     { "app/models/[1:singularize].rb", "Model" },
--     { "app/helpers/**/*[1]_helper.rb", "Helper" },
--   } },
-- }
