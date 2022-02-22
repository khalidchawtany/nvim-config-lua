local path = require "plenary.path"
local os_sep = path.path.sep

_G.projects_maps = {
  ignite = {
    {
      desciption = "Components folder (IGN)",
      keys = "<leader><leader>",
      paths = {{"app", "components"}}
    },
    {
      desciption = "TEST",
      keys = "<leader>x",
      paths = {{"app", "components"}, {"app", "screens"}}
    }
  }
}

function MapProjectKeys()
  local project_type = ""
  local pwd = vim.loop.cwd()

  project_type = path:new(pwd .. os_sep .. "ignite"):exists() and "ignite" or project_type

  -- get the project_type specific maps
  local project_maps = _G.projects_maps[project_type]

  for _, i in pairs(project_maps) do
    -- get the paths for each map entry
    local i_paths = {}
    for _, ip in pairs(i.paths) do
      local i_path = path:new(vim.loop.cwd() .. os_sep .. table.concat(ip, os_sep)):absolute()
      table.insert(i_paths, i_path)
    end

    -- map the entry
    vim.keymap.set(
      "n",
      i.keys,
      function()
        require("telescope.builtin").find_files({search_dirs = i_paths})
      end
    )
  end
end
