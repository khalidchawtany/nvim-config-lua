local M = {
  module = "nnn"
}

local mapKeys = function()
  vim.cmd [[
  tnoremap f<C-n> <cmd>lua require("nnn").toggle("explorer")<CR>
  nnoremap f<C-n> <cmd>lua require("nnn").toggle("explorer")<CR>
  tnoremap f<C-p> <cmd>lua require("nnn").toggle("picker")<CR>
  nnoremap f<C-p> <cmd>lua require("nnn").toggle("picker")<CR>
  ]]
end

M.init = mapKeys

local function copy_to_clipboard(files)
  files = table.concat(files, "\n")
  vim.fn.setreg("+", files)
  print(files:gsub("\n", ", ") .. " copied to register")
end

local function cd_to_path(files)
  local dir = files[1]:match(".*/")
  local read = io.open(dir, "r")
  if read ~= nil then
    io.close(read)
    vim.fn.execute("cd " .. dir)
    print("working directory changed to: " .. dir)
  end
end

M.config = function()
  require("nnn").setup(
    {
      explorer = {
        cmd = "nnn", -- command overrride (-p and -F1 flags are implied, -a flag is invalid!)
        width = 30, -- width of the vertical split
        session = "" -- or global/local/shared
      },
      picker = {
        cmd = "nnn", -- command override (-p flag is implied)
        style = {
          width = 0.9, -- width in percentage of the viewport
          height = 0.8, -- height in percentage of the viewport
          xoffset = 0.5, -- xoffset in percentage
          yoffset = 0.5, -- yoffset in percentage
          border = "single" -- border decoration e.g. "rounded"(:h nvim_open_win)
        },
        session = "" -- or global/local/shared
      },
      -- replace_netrw = nil -- or explorer/picker

      replace_netrw = "picker",
      mappings = {"<C-t>", "tabedit"}, -- open file in tab
      {"<C-s>", "split"}, -- open file in split
      {"<C-v>", "vsplit"}, -- open file in vertical split
      {"<C-w>", cd_to_path}, -- cd to file directory
      {"<C-y>", {copy_to_clipboard, quit = false}}, -- copy file to clipboard
      {"<S-y>", {copy_to_clipboard, quit = true}}
    }
  )
  mapKeys()
end

return M
