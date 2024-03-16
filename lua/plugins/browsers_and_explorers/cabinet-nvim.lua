return {
    "smilhey/cabinet.nvim",
    event = "VeryLazy",
    cmd = { "DrawerListBuffers", "DrawerList", "DrawerNext", "DrawerPrevious" },
    keys = {
        {
            "-cc",
            function()
                -- require("cabinet").drawer_list_buffers()
                vim.cmd("DrawerListBuffers")
            end,
            desc = "Drawer Buffers",
        },
        {
            "-c-",
            function()
                require("cabinet").drawer_next()
            end,
            desc = "Drawer next",
        },
        {
            "-c=",
            function()
                require("cabinet").drawer_previous()
            end,
            desc = "Drawer prev",
        },
        {
            "-cp",
            function()
                vim.cmd("Telescope cabinet")
            end,
            desc = "Drawers Telescope ",
        },
        {
            "-cs",
            function()
                local save = require("cabinet.save")
                save.save_cmd()
            end,
            desc = "Drawer prev",
        },
        {
            "-cl",
            function()
                local save = require("cabinet.save")
                save.load_cmd()
            end,
            desc = "Drawer prev",
        },
    },

    config = function()
        local cabinet = require("cabinet")
        cabinet:setup({ initial_drawers = { "intial" }, usercmd = false })
        require("telescope").load_extension("cabinet")

        -- Switch to drawer on creation
        vim.api.nvim_create_autocmd("User", {
            nested = true,
            pattern = "DrawAdd",
            callback = function(event)
                -- This is the name of the new drawer
                local new_drawnm = event.data
                cabinet.drawer_select(new_drawnm)
            end,
        })

        -- Open a terminal when entering a new drawer
        -- vim.api.nvim_create_autocmd("User", {
        -- 	nested = true,
        -- 	pattern = "DrawNewEnter",
        -- 	callback = function(event)
        -- 		vim.cmd("term")
        -- 	end,
        -- })

        -- local save = require("cabinet.save")
        -- save.save_cmd()
        -- save.load_cmd()
    end,
}
