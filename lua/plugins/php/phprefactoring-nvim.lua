return {
    'adibhanna/phprefactoring.nvim',
    dependencies = {
        'MunifTanjim/nui.nvim',
    },
    cmd = {
        "PHPExtractVariable",
        "PHPExtractMethod",
        "PHPExtractClass",
        "PHPExtractInterface",
        "PHPIntroduceConstant",
        "PHPIntroduceField",
        "PHPIntroduceParameter",
        "PHPChangeSignature",
        "PHPPullMembersUp",
    },
    ft = 'php',
    config = function()
        -- Example keymaps (add to your Neovim config)

        vim.api.nvim_create_autocmd({ "FileType" }, {
            pattern = "php",
            callback = function()
                vim.keymap.set('v', '<localleader>]ev', '<cmd>PHPExtractVariable<cr>',    {silent = true, buffer = true,desc = 'Extract variable' })
                vim.keymap.set('v', '<localleader>]em', '<cmd>PHPExtractMethod<cr>',      {silent = true, buffer = true,desc = 'Extract method' })
                vim.keymap.set('v', '<localleader>]ec', '<cmd>PHPExtractClass<cr>',       {silent = true, buffer = true,desc = 'Extract class' })
                vim.keymap.set('n', '<localleader>]ei', '<cmd>PHPExtractInterface<cr>',   {silent = true, buffer = true,desc = 'Extract interface' })
                vim.keymap.set('n', '<localleader>]ic', '<cmd>PHPIntroduceConstant<cr>',  {silent = true, buffer = true,desc = 'Introduce constant' })
                vim.keymap.set('n', '<localleader>]if', '<cmd>PHPIntroduceField<cr>',     {silent = true, buffer = true,desc = 'Introduce field' })
                vim.keymap.set('n', '<localleader>]ip', '<cmd>PHPIntroduceParameter<cr>', {silent = true, buffer = true,desc = 'Introduce parameter' })
                vim.keymap.set('n', '<localleader>]cs', '<cmd>PHPChangeSignature<cr>',    {silent = true, buffer = true,desc = 'Change signature' })
                vim.keymap.set('n', '<localleader>]rl', '<cmd>PHPPullMembersUp<cr>',      {silent = true, buffer = true,desc = 'Pull members up' })
            end,
        })


        require('phprefactoring').setup({
            -- UI Configuration
            ui = {
                use_floating_menu = true, -- Use floating windows for dialogs
                border = 'rounded',       -- Border style: 'rounded', 'single', 'double'
                width = 40,               -- Dialog width
                height = nil,             -- Auto-calculated height
                highlights = {
                    menu_title = 'Title',
                    menu_border = 'FloatBorder',
                    menu_item = 'Normal',
                    menu_selected = 'PmenuSel',
                    menu_shortcut = 'Comment',
                }
            },

            -- Refactoring Options
            refactor = {
                auto_format = true, -- Auto-format after refactoring
            },
        })
    end,
}
