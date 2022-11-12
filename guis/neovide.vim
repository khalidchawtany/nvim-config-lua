
  source ~/.config/nvim/ginit.vim
  " set noincsearch
  " set noinccommand
  set mouse=

  let g:neovide_input_use_logo=v:true

  " let g:neovide_remember_window_size = v:true

  let g:neovide_cursor_trail_length=5

  let g:neovide_cursor_animation_length=0.05

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


  let g:neovide_scroll_animation_length = 0.15


  let g:neovide_hide_mouse_when_typing = v:false


  let g:neovide_input_macos_alt_is_meta=v:false



  " set guifont=FiraCode\ Nerd\ Font:h18
 set guifont=FiraCode\ Nerd\ Font\ TALL:h18


lua << EOF
  vim.g.gui_font_default_size = 18
  vim.g.gui_font_size = vim.g.gui_font_default_size
  -- vim.g.gui_font_face = "FiraCode Nerd Font TALL"
  vim.g.gui_font_face = "Fira Code"

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
