local M = {
 "jayp0521/mason-null-ls.nvim",
  dependencies = {
    "null-ls.nvim",
    "mason.nvim"
  }
}
M.config = function()
  require("mason-null-ls").setup(
    {
      -- a list of all tools you want to ensure are installed upon
      -- start; they should be the names Mason uses for each tool
      ensure_installed = {
        -- you can pin a tool to a particular version
        -- {"golangci-lint", version = "1.47.0"},
        -- you can turn off/on auto_update per tool
        -- {"shellcheck", auto_update = true},
        -- "stylua",
        -- "shellcheck",
        -- "editorconfig-checker",
        -- "revive",
        -- "shellcheck",
        -- "shfmt",
        -- "staticcheck",
        -- "vint"
      },
      -- if set to true this will check each tool for updates. If updates
      -- are available the tool will be updated. This setting does not
      -- affect :MasonNullLsUpdate or :MasonNullLsInstall.
    -- Default: false
      auto_update = false,
      -- if set to true, the tool will check null-ls for the available sources,
      -- and then install the dependency(ies) if available in mason.
      -- Default: true
      -- automatic_installation = true
    }
  )
  -- require("mason-null-ls").check_install(true)
end
return M
