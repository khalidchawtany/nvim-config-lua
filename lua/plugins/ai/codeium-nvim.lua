 return {
    "Exafunction/codeium.nvim",
    event = "BufEnter",
    -- commit = "937667b2cadc7905e6b9ba18ecf84694cf227567",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({ })
    end
}
