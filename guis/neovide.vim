
  source ~/.config/nvim/ginit.vim
  " set noincsearch
  " set noinccommand
  set mouse=a

  let g:neovide_input_use_logo=v:true

  " let g:neovide_remember_window_size = v:true

  let g:neovide_confirm_quit = v:true

  let g:neovide_cursor_trail_length=5

  let g:neovide_cursor_animation_length=0.0

  let g:neovide_cursor_antialiasing=v:true

  let g:neovide_cursor_unfocused_outline_width=0.125

  let g:neovide_cursor_vfx_mode = "railgun"
  let g:neovide_cursor_vfx_opacity=100.0
  let g:neovide_cursor_vfx_particle_lifetime=1.2
  let g:neovide_cursor_vfx_particle_density=7.0
  let g:neovide_cursor_vfx_particle_speed=10.0
  let g:neovide_cursor_vfx_particle_phase=1.5
  let g:neovide_cursor_vfx_particle_curl=1.0


  " g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  " let g:neovide_transparency=0.0
  " let g:transparency = 0.8
  " let g:neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))


  let g:neovide_floating_blur_amount_x = 1.0
  let g:neovide_floating_blur_amount_y = 1.0

let g:neovide_floating_shadow = v:true
let g:neovide_floating_z_height = 1
let g:neovide_light_angle_degrees = 45
let g:neovide_light_radius = 1


  let g:neovide_scroll_animation_length = 0.15


  let g:neovide_hide_mouse_when_typing = v:false


  " let g:neovide_input_macos_alt_is_meta=v:true
 let g:neovide_input_macos_option_key_is_meta = 'only_left'

let g:neovide_confirm_quit = v:true


" Fix border and winbar scrolling glitches
let g:neovide_unlink_border_highlights = v:true



 " set guifont=FiraCode\ Nerd\ Font:h18
 " set guifont=FiraCode\ Nerd\ Font\ TALL:h18
 " set guifont=Thabit:b:h20


lua << EOF

 vim.schedule(function()
    vim.cmd "NeovideFocus"
  end)

  vim.g.gui_font_default_size = 17
  vim.g.gui_font_size = vim.g.gui_font_default_size
  -- vim.g.gui_font_face = "FiraCode Nerd Font TALL"
  -- vim.g.gui_font_face = "Fira Code"
  -- vim.g.gui_font_face = "Thabit:b"

  RefreshGuiFont = function()
  vim.opt.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
  end

  ResizeGuiFont = function(delta)
  vim.g.gui_font_size = vim.g.gui_font_size + delta
  RefreshGuiFont()
  end

  ResetGuiFont = function()
  vim.g.gui_font_size = vim.g.gui_font_default_size
  RefreshGuiFont()
  end

  -- Call function on startup to set default value
  ResetGuiFont()

  -- Keymaps

  local opts = { noremap = true, silent = true }

vim.keymap.set({'n', 'i'}, "<D-=>", function() ResizeGuiFont(1)  end, opts)
vim.keymap.set({'n', 'i'}, "<D-->", function() ResizeGuiFont(-1) end, opts)

vim.keymap.set({'n'}, '<BS>', function()
 require("notify").dismiss({ silent = true })
 vim.cmd([[
 filetype on
  syntax sync minlines=1000
  nohlsearch
  diffupdate
  redraw!
  fclose
  echo ""
 ]])
 end, { noremap = true, silent = true }  )


 vim.g.neovide_scale_factor = 1.0

 local change_scale_factor = function(delta)
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
 end

 vim.keymap.set("n", "<C-=>", function() change_scale_factor(1.025) end)
 vim.keymap.set("n", "<C-->", function() change_scale_factor(1/1.025) end)

 if vim.g.neovide then
	 vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
	 vim.keymap.set('v', '<D-c>', '"+y') -- Copy
	 vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
	 vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
	 vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
	 vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
-- vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})


--   -- Helper function for transparency formatting
-- local alpha = function()
--   return string.format("%x", math.floor(255 * vim.g.neovide_transparency_point or 0.8))
-- end
-- -- Set transparency and background color (title bar color)
-- vim.g.neovide_transparency = 0.0
-- vim.g.neovide_transparency_point = 1.0
-- vim.g.neovide_background_color = "#0f1117" .. alpha()
-- -- Add keybinds to change transparency
-- local change_transparency = function(delta)
--   vim.g.neovide_transparency_point = vim.g.neovide_transparency_point + delta
--   vim.g.neovide_background_color = "#0f1117" .. alpha()
-- end
-- vim.keymap.set({ "n", "v", "o" }, "<D-]>", function() change_transparency(0.01) end)
-- vim.keymap.set({ "n", "v", "o" }, "<D-[>", function() change_transparency(-0.01) end)


EOF



"  " Set transparency and background color (title bar color)
" let g:neovide_transparency=0.0
" let g:neovide_transparency_point=1
" let g:neovide_background_color = '#282D43'.printf('%x', float2nr(255 * g:neovide_transparency_point))
"
" " Add keybinds to change transparency
" function! ChangeTransparency(delta)
"   let g:neovide_transparency_point = g:neovide_transparency_point + a:delta
"   let g:neovide_background_color = '#282D43'.printf('%x', float2nr(255 * g:neovide_transparency_point))
" endfunction
" noremap <expr><D-]> ChangeTransparency(0.01)
" noremap <expr><D-[> ChangeTransparency(-0.01)



  " au WinEnter * if(&ft=='httpResult') | execute "normal gg/^$\n{\zs" | endif
