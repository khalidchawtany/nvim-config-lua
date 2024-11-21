return {
    "dhruvasagar/vim-table-mode",
    cmd = { "TableModeEnable", "TableModeDisable" },
    init = function()
        vim.g.table_mode_update_time = 250
        vim.g.table_mode_map_prefix = '<localleader>t'
    end,
}
