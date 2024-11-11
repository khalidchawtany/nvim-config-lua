return {
    "benlubas/molten-nvim",
    -- version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ":UpdateRemotePlugins",
    ft = { "jpynb", "ipynb" },
    cond = os.getenv("VAR_IS_KITTY_TERM") == "true",
    init = function()
        -- these are examples, not defaults. Please see the readme
        vim.g.molten_image_provider = "image.nvim"
        vim.g.molten_output_win_max_height = 20
        vim.g.molten_auto_open_output = false
    end,
}

--[[
Usage:

- Show list of notebooks:
    jupyter notebook list

- Show runtime path:
    jupyter --runtime

- Connect Molten to an existing kernel:
    MoltenInit /Users/juju/Library/Jupyter/runtime/kernel-3c07c08f-da6f-4891-acb8-6381ac7a1f70.json

--]]
