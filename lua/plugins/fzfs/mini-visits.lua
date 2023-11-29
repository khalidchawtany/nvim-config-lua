local is_not_hidden = function(path_data)
    return not vim.startswith(vim.fn.fnamemodify(path_data.path, ":t"), ".")
end

local make_select_path = function(select_global, recency_weight)
    return function()
        local visits = require("mini.visits")
        local sort = visits.gen_sort.default({ recency_weight = recency_weight })
        local select_opts = { sort = sort }
        local cwd = select_global and "" or vim.fn.getcwd()
        visits.select_path(cwd, select_opts)
    end
end

local get_git_branch_name = function()
    local branch = vim.fn.system('git rev-parse --abbrev-ref HEAD')
    if vim.v.shell_error ~= 0 then return nil end
    return vim.trim(branch)
end

return {
    "echasnovski/mini.visits",
    event = "VeryLazy",
    depencencies = {
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { '<Leader>vr',  make_select_path(true,  1),     desc='Select recent (all)'},
        { '<Leader>vR',  make_select_path(false, 1),     desc='Select recent (cwd)'},
        { '<Leader>vy',  make_select_path(true,  0.5),   desc='Select frecent (all)'},
        { '<Leader>vY',  make_select_path(false, 0.5),   desc='Select frecent (cwd)'},
        { '<Leader>vf',  make_select_path(true,  0),     desc='Select frequent (all)'},
        { '<Leader>vF',  make_select_path(false, 0),     desc='Select frequent (cwd)'},
        { '<Leader>vv', function() require('mini.visits').add_label() end,          desc='Add label'},
        { '<Leader>vV', function() require('mini.visits').remove_label() end,       desc='Remove label'},
        { '<Leader>vl', function() require('mini.visits').select_label('', '') end, desc='Select label (all)'},
        { '<Leader>vL', function() require('mini.visits').select_label() end,       desc='Select label (cwd)'},
        { '<Leader>vb', function() require('mini.visits').add_label(get_git_branch_name()) end, desc='Add Branch Label'},
        { '<Leader>vB', function() require('mini.visits').remove_label(get_git_branch_name()) end, desc='Add Branch Label'},

    },
    config = function()
        require("mini.visits").setup()
    end,
}
