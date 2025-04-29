return {
    "folke/todo-comments.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    cmd = {
        "TodoQuickFix",
        "TodoLocList",
        "TodoTrouble",
        "TodoTelescope"
    },
    keys = {
        { "<leader>pt", function() Snacks.picker.todo_comments() end,                                           desc = "Todo" },
        { "<leader>pT", function() Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end,  desc = "Todo/Fix/Fixme" },
    },
    config = function()
        require("todo-comments").setup {}
    end
}
