return {
    'Hashino/doing.nvim',
    cmd ={'Do', 'DoEdit', 'DoDone', 'DoToggle'},
    keys = {
        {
            "<leader>do",
            function()
                vim.cmd.Do()
            end,
            mode = { "n" },
            desc = "Do new doing",
        },
        {
            "<leader>de",
            function()
                require('doing').edit()
            end,
            mode = { "n" },
            desc = "[E]dit what tasks you`re [D]oing",
        },
        {
            "<leader>dn",
            function()
                require('doing').done()
            end,
            mode = { "n" },
            desc = "[D]o[n]e with current task",
        },
    },
    config = function()
        require('doing').setup {
            -- default options
            message_timeout = 2000,
            winbar = {
                enabled = false,
                -- ignores buffers that match filetype
                ignored_buffers = { 'NvimTree', 'oil', 'fugitive' }
            },

            doing_prefix = '',
            store = {
                -- automatically create a .tasks when calling :Do
                auto_create_file = true,
                file_name = '.tasks',
            },
        }
        -- example on how to change the winbar highlight
        vim.api.nvim_set_hl(0, 'WinBar', { link = 'Search' })
    end,
}
