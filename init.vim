if empty($TMUX)
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

" let $NNN_FIFO="/tmp/nnn.fifo"

" let $NNN_PLUG='f:finder;o:fzopen;p:mocplay;d:diffs;t:nmount;v:imgview'


let g:neo_tree_remove_legacy_commands=1

scriptencoding utf-8
set encoding=utf-8 nobomb
set termencoding=utf-8

" let mapleader = "\<space>"
" let g:mapleader = "\<space>"
" let localleader = "\\"
" let g:loaclleader = "\\"
"
lua require('impatient')
lua require('opts')
source ~/.config/nvim/func.vim
lua require('plugins')
lua require("user.winbar")
lua require("user.autocommands")
lua require('packer_compiled')
lua require('maps')
" lua require('configs/lspconfig')
"lua require('_completion-nvim')
source ~/.config/nvim/lua/maps.vim

au bufnewfile,bufread *.blade.php set filetype=blade

let g:indent_blankline_filetype_exclude = ['alpha', 'help']

let g:dashboard_default_executive ='telescope'

set virtualedit=all


autocmd User fugitive
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif


" au BufNew * if stridx(bufname(), 'term://') >=0 | set ft=term  | endif

" highlight text after 100 characters
highlight! WarnColor ctermbg=darkblue guibg=#E1340F guifg=#111111
let w:my_colorcol_hi_id = matchadd('WarnColor', '\%101v', 100)

highlight Whitespace guifg=#30334B

hi WinSeparator guifg=#3758A6

" Other configuration
if exists('g:nvui')
  source ~/.config/nvim/ginit.vim
  " Configure nvui
  NvuiCmdFontFamily Jetbrains Mono
  NvuiCmdFontSize 25.0
  NvuiScrollAnimationDuration 0.2
  set guifont=FiraCode\ Nerd\ Font:h18
  " NvuiCmdTopPos 0.4
  NvuiCmdCenterYPos 0.3
  NvuiCmdCenterYPos 0.3
  NvuiCmdPadding 10
endif





if exists('g:goneovim')
  set linespace=10
endif

if exists('g:neovide')

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
  vim.g.gui_font_face = "FiraCode Nerd Font TALL"

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



  "Map CMD-# to tabs
  for i in [1,2,3,4,5,6,7,8,9]
    execute "nnoremap <silent> <D-" . i . ">            :tabnext " . i . "<cr>"
    execute "vnoremap <silent> <D-" . i . ">       <c-u>:tabnext " . i . "<cr>"
    execute "tnoremap <silent> <D-" . i . "> <c-\\><c-n>:tabnext " . i . "<cr>"
  endfor

  let i = 0
  execute "nnoremap <silent> <D-" . i . ">            :tabnext 10<cr>"
  execute "vnoremap <silent> <D-" . i . ">       <c-u>:tabnext 10<cr>"
  execute "tnoremap <silent> <D-" . i . "> <c-\\><c-n>:tabnext 10<cr>"



  " au WinEnter * if(&ft=='httpResult') | execute "normal gg/^$\n{\zs" | endif
endif

