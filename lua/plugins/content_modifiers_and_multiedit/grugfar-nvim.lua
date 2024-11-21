return {
    "MagicDuck/grug-far.nvim",
    cmd = { "GrugFar" },

    keys = {
        {
            "<leader>rf",
            function() require('grug-far').grug_far({ prefills = { search = vim.fn.expand("<cword>") } }) end,
            desc = "GrugFar (CWord)"
        },
        {
            "<leader>rF",
            function() require('grug-far').grug_far({ prefills = { flags = vim.fn.expand("%") } }) end,
            desc = "GrugFar (%)"
        }
    },


    -- require('grug-far').grug_far({ prefills = { search = vim.fn.expand("<cword>") } })
    -- require('grug-far').grug_far({ prefills = { flags = vim.fn.expand("%") } })
    config = function()
        require('grug-far').setup({
            --- options, see Configuration section below ...
            --- there are no required options atm...
        });
    end
}
