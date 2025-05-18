 return {
  "echasnovski/mini.ai",
  event = "VeryLazy",
  -- keys = {
  --   { "a", mode = { "x", "o" } },
  --   { "i", mode = { "x", "o" } },
  -- },
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      init = function()
        -- no need to load the plugin, since we only need its queries
        require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
      end,
    },
  },
  opts = function()
    local ai = require("mini.ai")

    return {
      n_lines = 500,
      custom_textobjects = {
        o = ai.gen_spec.treesitter({
          a = { "@block.outer", "@conditional.outer", "@loop.outer" },
          i = { "@block.inner", "@conditional.inner", "@loop.inner" },
        }, {}),
        b = ai.gen_spec.treesitter({ a = "@block.outer", i = "@block.inner" }, {}),
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
        ['-'] = ai.gen_spec.function_call({name_pattern="[%:%w_%.]"}),
        c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
      },
    }
  end,
  config = function(_, opts)
    local ai = require("mini.ai")
    ai.setup(opts)
  end,
}
