local tbl = {'wbthomason/packer.nvim', k = 1}

local pluginName = tbl[1]
local pluginNameSepIndex = string.find(pluginName, '/')
pluginName = string.sub(pluginName, pluginNameSepIndex + 1)

dump(pluginName)
