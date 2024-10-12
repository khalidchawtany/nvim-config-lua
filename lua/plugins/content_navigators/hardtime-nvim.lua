return {
   "m4xshen/hardtime.nvim",
   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
   cmd = {"Hardtime"},
   keys = {
       {
           "coh",
           function()
               vim.cmd[[Hardtime toggle]]
           end,
           mode={"n"},
           desc = "Toggle Hardtime"
       },
   },
   opts = {
       disabled_filetypes = {
           "qf",
           "minifiles",
           "netrw",
           "NvimTree",
           "lazy",
           "mason",
           "oil",
           "fugitive",
       },
   },
}
