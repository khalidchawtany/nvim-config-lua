local M = {
    requires = { "nvim-neo-tree/neo-tree.nvim" },
    branch = "v1.1"
}

M.config = function()
    require("netman")
end
return M
