return {
    "nvimtools/hydra.nvim",
    -- event = "VeryLazy",
    enabled = false,
    config = function()
        local handle = vim.loop.fs_scandir(vim.fn.stdpath("config") .. "/lua/plugins/util/hydras")
        while handle do
            local name, _ = vim.loop.fs_scandir_next(handle)

            if not name then
                break
            end

            name = name:match("(.+)%..+$")

            require('plugins/util/hydras/' .. name)
        end
    end
}
