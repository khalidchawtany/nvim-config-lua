vim.deprecate = function() end ---@diagnostic disable-line: duplicate-set-field


 local rocks_config = {
     rocks_path = "/Users/juju/.local/share/nvim/rocks",
     luarocks_binary = "/Users/juju/.local/share/nvim/rocks/bin/luarocks",
 }

 vim.g.rocks_nvim = rocks_config

 local luarocks_path = {
     vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
     vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
 }
 package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

 local luarocks_cpath = {
     vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dylib"),
     vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dylib"),
 }
 package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

 vim.opt.runtimepath:append(vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "rocks.nvim", "*"))


-- package.path = package.path .. ";/Users/juju/.local/share/nvim/lazy/luarocks.nvim/.rocks/share/lua/5.1/?/?.lua"
-- package.path = package.path .. ";/Users/juju/.local/share/nvim/lazy/luarocks.nvim/.rocks/share/lua/5.1/?.lua"

package.path = package.path .. ";/Users/juju/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";/Users/juju/.luarocks/share/lua/5.1/?.lua"
-- package.path = package.path .. ";/Users/juju/.config/nvim/lua"

vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")
vim.fn.setenv("DYLD_LIBRARY_PATH", "/usr/local/lib")

local links = {
    ["@lsp.type.namespace"] = "@namespace",
    ["@lsp.type.type"] = "@type",
    ["@lsp.type.class"] = "@type",
    ["@lsp.type.enum"] = "@type",
    ["@lsp.type.interface"] = "@type",
    ["@lsp.type.struct"] = "@structure",
    ["@lsp.type.parameter"] = "@parameter",
    ["@lsp.type.variable"] = "@variable",
    ["@lsp.type.property"] = "@property",
    ["@lsp.type.enumMember"] = "@constant",
    ["@lsp.type.function"] = "@function",
    ["@lsp.type.method"] = "@method",
    ["@lsp.type.macro"] = "@macro",
    ["@lsp.type.decorator"] = "@function",
}
for newgroup, oldgroup in pairs(links) do
  vim.api.nvim_set_hl(0, newgroup, { link = oldgroup, default = true })
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--single-branch",
      "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

vim.opt.shadafile = "NONE"

vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct
vim.g.localleader = "\\"

require("functions")

-- we need to symplink the plugin dirs to the lua dir of the config
-- ln -s /Users/juju/.local/share/nvim/lazy/macaltkey.nvim/lua/macaltkey /Users/juju/.config/nvim/lua/
-- keys = {{require"macaltkey".convert("<a-p>"), "<cmd>lua require'telescope'.extensions.project.project{}<CR>", desc = "Telescope (Projects)"}},
require("macaltkey").setup()

require("lazy").setup({
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
                "zipPlugin",
            },
        },
    },
    pkg = {
        enabled = true,
        cache = vim.fn.stdpath("state") .. "/lazy/pkg-cache.lua",
        -- the first package source that is found for a plugin will be used.
        sources = {
            "lazy",
            "rockspec",
            "packspec",
        },
    },
    rocks = {
        root = vim.fn.stdpath("data") .. "/lazy-rocks",
        server = "https://nvim-neorocks.github.io/rocks-binaries/",
    },

    concurrency = 20,
    git = {
        -- defaults for the `lazy log` command
        -- log = { "--since=3 days ago" }, -- show commits from the last 3 days
        log = { "-8" }, -- show the last 8 commits
        timeout = 360, -- kill processes that take more than 2 minutes
        url_format = "https://github.com/%s.git",
        -- lazy.nvim requires git >=2.19.0. if you really want to use lazy with an older version,
        -- then set the below to false. this should work, but is not supported and will
        -- increase downloads a lot.
        filter = true,
    },
})
if vim.fn.getcwd() == "/" then
    vim.cmd.cd("~/.config/nvim")
end
vim.cmd.source("~/.config/nvim/func.vim")
require("user.winbar")
require("user.autocommands")
require("user.commands")
require("project_maps")
require("maps")
require("opts")
vim.cmd.source("~/.config/nvim/lua/maps.vim")
vim.cmd([[autocmd user lazyreload source ~/.config/nvim/lua/maps.vim]])
vim.cmd([[TSEnable highlight]])

vim.cmd([[
" config for differnt guis
for gui in ['nvui', 'goneovim', 'neovide']
  if exists('g:' . gui)
    execute "source ~/.config/nvim/guis/" . gui . ".vim"
  endif
endfor
]])

vim.opt.shadafile = ""

-- test stc
-- set stc=%=%{v:wrap?'':v:relnum}⎥%s%C\ \
-- set cpo+=n
-- set number
-- set wrap


-- Shipman
-- \ :silent! %S/coc/shipman/g<cr>
-- \ :silent! %S/lox/khalid/g<cr>
-- \ :silent! %S/customer/client/g<cr>

vim.cmd([[
nnoremap <leader>r<leader>
\ :silent! %S/vehicle_document/cert_release_approval/g<cr>
\ :silent! %S/vehicledocument/certreleaseapproval/g<cr>
\ :silent! %S/vehicleDocument/certReleaseApproval/g<cr>
\ :silent! %S/inspection_request/certificate/g<cr>
\ :silent! %s/Vehicle/CertRelease/g<cr>
\ :silent! %s/vehicle_/certrelease_/gI<cr>
\ :silent! %s/vehicle/certrelease/gI<cr>
]])

-- \ :silent! %S/{I,i}nspection{R,_r,r, R}equest/{C,c}ert{R,_r,r, R}elease/g<cr>
-- \ :silent! %S/{V,v}ehicle{D,_d,d, D}ocument/{R,r}elease{A,_a,a, A}pproval/g<cr>
-- \ :silent! %S/vehicleDocument/certreleaseApproval/g<cr>
-- \ :silent! %S/{V,v}ehicle{s,}_/{R,r}elease{s,}_/g<cr>
-- \ :silent! %S/customer/client/g<cr>






-- \ :silent! %S/VehicleCategor{y,ies}/RegisteredGood{,s}/g<cr>
-- \ :silent! %S/certification/certificate/g<cr>
-- \ :silent! %S/CertificationPartial/CertRelease/g<cr>
-- \ :silent! %S/{V,v}ehicle/{R,r}elease/g<cr>
-- \ :silent! %S/{I,i}nspection{R,_r,r, R}equest/{R,r}eview/g<cr>
-- \ :silent! %S/vehicle/good/g<cr>
-- \ :silent! %S/VehicleCategor{y,ies}/GoodCategor{y,ies}/g<cr>
vim.cmd([[
nnoremap <leader>\l <cmd>SLoad tmp<cr>
nnoremap <leader>\s <cmd>SSave! tmp<cr>
]])

