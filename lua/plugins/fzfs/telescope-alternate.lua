local M = {
  "otavioschwanck/telescope-alternate",
  dependencies = {"nvim-telescope/telescope.nvim"},
  keys = {
    {
      "<c-s><c-f>",
      function()
        require("telescope").extensions["telescope-alternate"].alternate_file()
      end,
      desc = "Telescope (Alternate)"
    }
  }
}


M.config = function()
  require("telescope-alternate").setup(
    {
      mappings = {
        {
          "(.*)/models/(.*).php",
          {
            {"[1]/controllers/[2:pluralize].php", "Controller", true},
            {"[1]/controllers/[2:pluralize,lower]/*.*", "Controller-F", true},
            {"[1]/models/[2].php", "Model", true},
            {"[1]/models/[2:lower]/*.*", "Model-F", true}
          }
        },
        {
          "(.*)/controllers/(.*).php",
          {
            {"[1]/controllers/[2:pluralize].php", "Controller", true},
            {"[1]/controllers/[2:pluralize,lower]/*.*", "Controller-F", true},
            {"[1]/models/[2:singularize].php", "Model", true},
            {"[1]/models/[2:singularize,lower]/*.*", "Model-F", true}
          }
        }
      },
      presets = {}, -- Telescope pre-defined mapping presets
      transformers = {
        lower = function(w)
          return string.lower(w)
        end,
        upper = function(w)
          return string.upper(w)
        end
      }
    }
  )

  -- On your telescope:
  require("telescope").load_extension("telescope-alternate")
end

return M
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
