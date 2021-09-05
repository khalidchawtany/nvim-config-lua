map <D-UP> <C-UP>
map <D-DOWN> <C-DOWN>

map ¡ <M-1>
map ™ <M-2>
map £ <M-3>
map ¢ <M-4>
map ∞ <M-5>
map § <M-6>
map ¶ <M-7>
map • <M-8>
map ª <M-9>

map ∆ <M-j>
map ˚ <M-k>
map ¬ <M-l>
map ˙ <M-h>

map – <M-->
map ≠ <M-+>

map ‘ <M-]>
map “ <M-[>

nnoremap <silent> <c-h> <c-w><c-h>
nnoremap <silent> <c-j> <c-w><c-j>
nnoremap <silent> <c-k> <c-w><c-k>
nnoremap <silent> <c-l> <c-w><c-l>

" Maximize current split
nnoremap <c-w>M <C-w>_<C-w><Bar>

nnoremap <silent><nowait> <BS> :syntax sync minlines=1000<cr>:nohlsearch \| echo "" \|redraw! \| diffupdate \| normal \<Plug>(FastFoldUpdate) \| silent! call clever_f#reset()  <cr>


nnoremap <c-s><space> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

Map nox F     <Plug>(clever-f-F)
Map nox T     <Plug>(clever-f-T)
Map nox f     <Plug>(clever-f-f)
Map nox t     <Plug>(clever-f-t)

nnoremap cc 0C


nnoremap <leader>fp  :let @+=expand("%:p")<cr>:echo "Copied current file  path '".expand("%:p")."' to clipboard"<cr>
nnoremap <leader>fn  :let @+=expand("%:p:t")<cr>:echo "Copied current file  path '".expand("%:p:t")."' to clipboard"<cr>

nnoremap <c-w>O            :wincmd o\|tabonly\|BufOnly<cr>
nnoremap <c-;>wo           :tabonly \| BufOnly<cr>

nnoremap <c-;>wa           :BufOnly -1<cr>
nmap     <c-;>ww           <Plug>BW
nnoremap <silent> <c-;>wu  :silent! WipeoutUnmodified<cr>
nnoremap <c-;><c-;>wa      :tabonly \| BufOnly \| bufdo execute ":bw!"<cr>



nnoremap <leader>t<space>  :tabonly<cr>
nnoremap <leader>q<space>  :tabclose<cr>
nnoremap <leader>qq        :q<cr>
nnoremap <leader>qa        :qall<cr>
nnoremap <leader>qQ        :qall!<cr>

nnoremap <leader>wq        :wq<cr>
nnoremap <leader>ww        :w<cr>
nnoremap <leader>wa        :wall<cr>
nnoremap <leader>wu        :update<cr>

nnoremap <c-k><c-f> :lua vim.lsp.buf.formatting_seq_sync()<cr>

nnoremap <leader>ev :e ~/.config/nvim<cr>
Map N <leader>eg    :if has("nvim") \| tabe ~/.config/nvim/ginit.vim \| else \| tabe ~/.gvimrc \| endif<cr>


  "Shift-Enter is like ]<space>
  inoremap <silent> <s-cr> <esc>m`o<esc>``a

  map  ‰   <c-cr>
  map  ◊   <c-'>
  map  Ú   <c-;>
  map  Ą   <c-bs>
  map  ⌂   <M-cr>
  map  Ặ   <s-cr>
  map  ◊Ú  <C-'><C-;>


  nnoremap <leader>tl :tabs<cr>
  nnoremap <leader>tn :tabnew<cr>
  nnoremap <leader>td :tab split<cr>
  nnoremap <leader>tt :tabnew \| e term://zsh<cr>
  nnoremap <leader>th :tab help<space>
  nnoremap <leader>tm0 :tabmove 0<cr>


  inoremap <D-v> <c-r>+
  nnoremap <D-v> "+p
  "Use <Tab> and <S-Tab> to navigate through popup menu

  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  "imap <silent> <c-space> <Plug>(completion_trigger)
  " inoremap <silent><expr> <C-Space> compe#complete()
  " inoremap <silent><expr> <CR>      compe#confirm('<CR>')
  " inoremap <silent><expr> <C-e>     compe#close('<C-e>')
  " inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
  " inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
  imap <silent> <c-j> <c-n>
  imap <silent> <c-k> <c-p>


  " nnoremap <expr> n (v:searchforward ? 'nzz' : 'Nzz')
  " nnoremap <expr> N (v:searchforward ? 'Nzz' : 'nzz')
  nnoremap <expr> n  'Nn'[v:searchforward]
  xnoremap <expr> n  'Nn'[v:searchforward]
  onoremap <expr> n  'Nn'[v:searchforward]

  nnoremap <expr> N  'nN'[v:searchforward]
  xnoremap <expr> N  'nN'[v:searchforward]
  onoremap <expr> N  'nN'[v:searchforward]

  nnoremap c* *Ncgn

  nnoremap <nowait> <Leader><Leader> <c-^>

  vnoremap <c-d> "dyo<esc>"dp

  "Shift-Enter is like ]<space>
  inoremap <silent> <s-cr> <esc>m`o<esc>``a



  " vnoremap . :norm.<CR>

  " { and } skip over closed folds
  nnoremap <expr> } foldclosed(search('^$', 'Wn')) == -1 ? "}" : "}j}"
  nnoremap <expr> { foldclosed(search('^$', 'Wnb')) == -1 ? "{" : "{k{"

  " Jump to next/previous merge conflict marker
  nnoremap <silent> ]> /\v^(\<\|\=\|\>){7}([^=].+)?$<CR>
  nnoremap <silent> [> ?\v^(\<\|\=\|\>){7}([^=].+)\?$<CR>

  " Move visual lines
  nnoremap <silent> j gj
  nnoremap <silent> k gk

  noremap  H ^
  vnoremap H ^
  onoremap H ^
  noremap  L $
  vnoremap L g_
  onoremap L $


  nnoremap ; :
  nnoremap : ;
  vnoremap ; :
  vnoremap : ;

  "Make completion more comfortable
  inoremap <c-j> <c-n>
  inoremap <c-k> <c-p>

  inoremap <C-U> <C-G>u<C-U>

  " Close all folds except this
  nnoremap z<Space> zMzv
  nnoremap z0 :set foldlevel=0<cr>
  nnoremap z1 :set foldlevel=1<cr>
  nnoremap z2 :set foldlevel=2<cr>
  nnoremap z3 :set foldlevel=3<cr>
  nnoremap z4 :set foldlevel=4<cr>
  nnoremap z5 :set foldlevel=5<cr>
  nnoremap z6 :set foldlevel=6<cr>
  nnoremap z7 :set foldlevel=7<cr>
  nnoremap z8 :set foldlevel=8<cr>
  nnoremap z9 :set foldlevel=9<cr>


  tnoremap <c-o> <c-\><c-n>

  " Put empty line around (requires UnImpaired)
  nnoremap \<Space> :normal [ ] <cr>

  " Suck from below/above
  nnoremap <C-g>j i<Esc>+y$ddgi<c-r>0<Esc>
  nnoremap <C-g>k i<Esc>-y$ddgi<c-r>0<Esc>

  " Uppercase from insert mode while you are at the end of a word
  inoremap <C-u> <esc>mzgUiw`za


  nnoremap <leader>e<cr> :e ++ff=dos<cr>

  nnoremap <leader>e<Tab> :retab<cr>


  " underline the current line
  nnoremap <leader>u= :t.\|s/./=/g<cr>:nohls<cr>
  nnoremap <leader>u- :t.\|s/./-/g<cr>:nohls<cr>
  nnoremap <leader>u~ :t.\|s/./\\~/g<cr>:nohls<cr>


  cnoremap <D-v> <C-R>+
  tnoremap <D-v> <C-\><C-N>pi


  vmap > >gv
  vmap < <gv

  nnoremap <c-k><c-d> :silent! call Preserve("normal gg=G")<cr>

  " Move visual block
  vnoremap <c-j> :m '>+1<CR>gv=gv
  vnoremap <c-k> :m '<-2<CR>gv=gv



  " select last matched item
  nnoremap <c-g>/ //e<Enter>v??<Enter>
  nnoremap <c-g>sl //e<Enter>v??<Enter>

  " Reselect the text you just entered
  nnoremap gV `[v`]
  nnoremap <c-g>si `[v`]








  "CD into:
  "current buffer file dir
  nnoremap cdf :lcd %:p:h<cr>:pwd<cr>
  nnoremap cd. :lcd <c-r>=fnamemodify(expand('%:h'), ':h')<cr><cr>:pwd<cr>


  nnoremap cdp :lcd <c-r>=GetPluginPath()<cr><cr>:pwd<cr>

  fun! GetPluginPath()
    let dirs = split(expand('%:p'), '/')
    let idx = index(dirs, 'plugins')
    "  filter(split(expand('%:h'), '/'), 'v:val == "plugins"')
    if(idx == -1)
      return '.'
    endif

    let path = '/'.join(dirs[:idx + 2], '/')
    return path
  endf





  "current working dir
  nnoremap cdc :lcd <c-r>=expand("%:h")<cr>/
  "git dir ROOT
  nnoremap cdg :lcd <c-r>=FindGitDirOrRoot()<cr><cr>

  nnoremap cdd :lcd /Volumes/Home/.config/nvim/dein/repos/github.com/<cr>
  nnoremap cdv :lcd /Volumes/Home/.config/nvim/<cr>

  "Open current directory in Finder
  "nnoremap gof :silent !open .<cr>

  nnoremap ycd :!mkdir -p %:p:h<CR>

  "Go to alternate file
  nnoremap go <C-^>

  "toggle tabline
  nnoremap <silent> cot  :execute "set  showtabline=" . (&showtabline+2)%3<cr>

  "Toggle laststatus (statusline | statusbar)
  nnoremap <silent> co<space> :execute "set laststatus=" . (&laststatus+2)%3<cr>

  "Command-line Mode Key Mappings
  cnoremap <c-a> <home>
  cnoremap <c-e> <end>
  cnoremap <expr> <c-j> wildmenumode() ? "\<c-n>" : "\<down>"
  cnoremap <expr> <c-k> wildmenumode() ? "\<c-p>" : "\<up>"
  cnoremap <c-h> <left>
  cnoremap <c-l> <right>
  cnoremap <c-g>p <C-\>egetcwd()<CR>
  cnoremap <c-g>f <C-r>=expand("%")<CR>

  " source-selection or Vimrc
  nnoremap <Leader>S; "vyy:@v<CR>
  vnoremap <Leader>S; "vy:@v<CR>
  " nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
  " nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>
  " nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
  " nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>


  " Correct macros, use it like this <leader>m or "q<leader>m.

  nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
  nnoremap <leader>mc  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

  Map N <leader>tp :e <c-r>=FindGitDirOrRoot()<cr>/todo.org<cr>
  Map N <leader>to :e ~/org/todo.org<cr>
  Map N <leader>Tp :tabe <c-r>=FindGitDirOrRoot()<cr>/todo.org<cr>
  Map N <leader>To :tabe ~/org/todo.org<cr>

  Map N <leader>e<BS> :e! \| echo "changes discarded"<cr>

  nnoremap  coq :QFix<cr>
  command! QFix call QFixToggle()
  function! QFixToggle()
    for i in range(1, winnr('$'))
      let bnum = winbufnr(i)
      if getbufvar(bnum, '&buftype') == 'quickfix'
        cclose
        return
      endif
    endfor
    copen
  endfunction


  xnoremap [e  :<C-U>execute ":'<,'>normal \<Plug>unimpairedMoveSelectionUp"\|normal! gv<cr>
  " snoremap [e  :<C-U>execute ":'<,'>normal \<Plug>unimpairedMoveSelectionUp"\|normal! gv<cr>

  xnoremap ]e  :<C-U>execute ":'<,'>normal \<Plug>unimpairedMoveSelectionDown"\|normal! gv<cr>
  " snoremap [e  :<C-U>execute ":'<,'>normal \<Plug>unimpairedMoveSelectionUp"\|normal! gv<cr>
