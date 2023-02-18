local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
    {
      "git",
      "clone",
      "--filter=blob:none",
      "--single-branch",
      "https://github.com/folke/lazy.nvim.git",
      lazypath
    }
  )
end
vim.opt.runtimepath:prepend(lazypath)

vim.opt.shadafile = "NONE"
vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")
package.path = package.path .. ";/Users/juju/.config/nvim/lua"

-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct
vim.g.loaclleader = "\\"

require("functions")

require("lazy").setup(
  {
    spec = _G.ListLazyPluginDirs(),
    defaults = {},
    -- install = {colorscheme = {"tokyonight", "habamax"}},
    -- checker = {enabled = true}, -- automatically check for plugin updates
    performance = {
      rtp = {
        -- disable some rtp plugins
        disabled_plugins = {
          "gzip",
          "matchit",
          "matchparen",
          "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin"
        }
      }
    }
  }
)
vim.cmd.cd("~/.config/nvim")
vim.cmd.source("~/.config/nvim/func.vim")
require("user.winbar")
require("user.statuscolumn")
require("user.autocommands")
require("user.commands")
require("project_maps")
require("maps")
-- require('impatient')
require("opts")
vim.cmd.source("~/.config/nvim/lua/maps.vim")
vim.cmd [[autocmd User LazyReload source ~/.config/nvim/lua/maps.vim]]
vim.cmd[[TSEnable highlight]]

vim.cmd[[
" config for differnt guis
for gui in ['nvui', 'goneovim', 'neovide']
  if exists('g:' . gui)
    execute "source ~/.config/nvim/guis/" . gui . ".vim"
  endif
endfor
]]

vim.opt.shadafile = ""


-- test stc
-- set stc=%=%{v:wrap?'':v:relnum}⎥%s%C\ \
-- set cpo+=n
-- set number
-- set wrap
