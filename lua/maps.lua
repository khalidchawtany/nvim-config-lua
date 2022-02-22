local path = require "plenary.path"
local os_sep = path.path.sep

_G.APPLIED_PROJECT_MAPS = nil

_G.PROJECTS_MAPS = {
  october = {
    {
      desciption = "Controllers (LRVL)",
      keys = "<leader>lp",
      paths = {{"plugins"}},
      prompt = "controllers",
      fd_opts = {"--full-path", "-g", "**/controllers/*.php"}
    }
  },
  laravel = {
    {
      desciption = "Controllers (LRVL)",
      keys = "<leader>lc",
      paths = {{"app", "Http", "Controllers"}}
    },
    {
      desciption = "Views (LRVL)",
      keys = "<leader>lv",
      paths = {{"resources", "views"}}
    }
  },
  ignite = {
    {
      desciption = "Components (IGN)",
      keys = "<leader>lc",
      paths = {{"app", "components"}}
    },
    {
      desciption = "Screens (IGN)",
      keys = "<leader>ls",
      paths = {{"app", "screens"}}
    },
    {
      desciption = "Models (IGN)",
      keys = "<leader>lm",
      paths = {{"app", "models"}}
    },
    {
      desciption = "API (IGN)",
      keys = "<leader>la",
      paths = {{"app", "services", "api"}}
    },
    {
      desciption = "DB (IGN)",
      keys = "<leader>ld",
      paths = {{"app", "services", "database"}}
    },
    {
      desciption = "Navigator (IGN)",
      keys = "<leader>ln",
      paths = {{"app", "navigators"}}
    }
  }
}

function MapProjectKeys()
  local project_type = ""
  local pwd = vim.loop.cwd()

  project_type = path:new(pwd .. os_sep .. "ignite"):exists() and "ignite" or project_type
  project_type = path:new(pwd .. os_sep .. "composer.json"):exists() and "laravel" or project_type
  project_type =
    (path:new(pwd .. os_sep .. "composer.json"):exists() and path:new(pwd .. os_sep .. "plugins"):exists()) and
    "october" or
    project_type

  -- get the project_type specific maps
  local project_maps = PROJECTS_MAPS[project_type]

  if project_maps == nil or APPLIED_PROJECT_MAPS == project_type then
    return ""
  end

  APPLIED_PROJECT_MAPS = project_type

  for _, i in pairs(project_maps) do
    -- get the paths for each map entry
    local i_paths = {}
    for _, ip in pairs(i.paths) do
      local i_path = path:new(vim.loop.cwd() .. os_sep .. table.concat(ip, os_sep)):absolute()
      table.insert(i_paths, i_path)
    end

    local opts = {
      search_dirs = i_paths,
      find_command = {"fd", "--type", "f"}
      -- opts["cwd"] = i_paths
    }

    if i["desciption"] ~= nil then
      opts["prompt_title"] = i.desciption
    end

    if i["fd_opts"] ~= nil then
      for _, v in ipairs(i["fd_opts"]) do
        table.insert(opts.find_command, v)
      end
    end

    -- map the entry
    vim.keymap.set(
      "n",
      i.keys,
      function()
        require("telescope.builtin").find_files(opts)
      end
    )
  end
end

vim.cmd [[ au DirChanged * lua MapProjectKeys() ]]
