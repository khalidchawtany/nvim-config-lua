
nnoremap <leader>` <cmd>wincmd o<cr><cmd>lcd /Users/juju/Projects/OneWay/OneWay/WebApps/Admin/Modules<cr><cmd>e .<cr><cmd>vsp<cr><cmd>lcd /Users/juju/Projects/OneWay/OneWay/WebApps/TaxiAdmin<cr><cmd>e .<cr>
nnoremap  <leader>ej :call ExecuteJava()<cr>
nmap  <leader>e` ?java<cr>/{<cr>vi{y<c-w>lgg0/{<cr>lvi{p;w!<cr><leader>ej<cr>


function! ExecuteJava()
	write
	exe "tab term cd " . shellescape(expand("%:h")) . " && javac " . expand ("%:t") . " && java " . expand("%:t:r")
endfunction

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


map ≥ <M-\>>
map ≤ <M-\<>

nnoremap <silent> <c-h> <c-w><c-h>
nnoremap <silent> <c-j> <c-w><c-j>
nnoremap <silent> <c-k> <c-w><c-k>
nnoremap <silent> <c-l> <c-w><c-l>

command! SwithGui :lua os.execute('osascript ~/juju/.config/nvim/switch_nvim_qt_gui_window.scpt')<cr>
 " tell application "System Events" to ¬	perform action "AXRaise" of window 2 of ¬		application process "nvim-qt"-- tell application "nvim-qt" to activate
"winnr() !=# winnr('h')
" Maximize current split

nnoremap <c-w>M <C-w>_<C-w><Bar>

nnoremap <silent><nowait> <BS> <cmd>nohlsearch<cr><cmd>lua require('functions').BS()<cr>
                
nnoremap <silent><nowait> <leader><BS> <cmd>fclose<cr><cmd>syn clear<cr>

" nnoremap <c-s>c <cmd>echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
"       \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
"       \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


nnoremap <leader>ee :e ~/.config/nvim/lua/functions.lua<cr>

" open diff view of the commit hash
nnoremap <leader>dcc :DiffviewOpen <C-r>=expand('<cword>')<cr>..<C-r>=expand('<cword>')<cr>^<cr>

nnoremap <leader>yfp  <cmd>let @+=expand("%:p")<cr><cmd>lua vim.notify("Copied current file  path '"..vim.fn.expand("%:p").."' to clipboard")<cr>
nnoremap <leader>yfP  <cmd>let @+=expand("%:~:.")<cr><cmd>lua vim.notify("Copied current file  path '"..vim.fn.expand("%:~:.").."' to clipboard")<cr>
nnoremap <leader>yfn  <cmd>let @+=expand("%:p:t")<cr><cmd>lua vim.notify("Copied current file  path '"..vim.fn.expand("%:p:t").."' to clipboard")<cr>

nnoremap <c-w>O            <cmd>wincmd o\|tabonly\|BufOnly<cr>
nnoremap <leader>wo           <cmd>tabonly \| BufOnly<cr>

nnoremap <leader>bwo           <cmd>BufOnly -1<cr>
nnoremap <leader>bww           <cmd>bwipeout!<cr>
nnoremap <leader>bwW           <cmd>bwipeout!<cr>
nnoremap <leader>bwa           <cmd>tabonly \| BufOnly \| bufdo execute ":bw!"<cr>
nnoremap <silent> <leader>bwu  <cmd>silent! WipeoutUnmodified<cr>


nnoremap <leader>t<space>  <cmd>tabonly<cr>
nnoremap <leader>q<space>  <cmd>tabclose<cr>
nnoremap <leader>qq        <cmd>q<cr>
nnoremap <leader>qa        <cmd>qall<cr>
nnoremap <leader>qQ        <cmd>qall!<cr>

nnoremap <leader>wq        <cmd>wq<cr>
nnoremap <silent> <leader>ww  <cmd>silent! w<cr>
nnoremap <leader>wa        <cmd>wall<cr>
nnoremap <leader>wu        <cmd>update<cr>

" inoremap ;w <cmd>silent! w<cr>

nnoremap <c-k><c-d> <cmd>lua vim.lsp.buf.format({ timeout_ms = 5000 })<cr>
nnoremap <leader>cf <cmd>lua vim.lsp.buf.format({ timeout_ms = 5000 })<cr>
nnoremap <c-k><c-f> <cmd>Format<cr>
nnoremap <leader>cF <cmd>Format<cr>

nnoremap <silent> <leader>eV <cmd>e ~/.config/nvim/<cr>
nnoremap <silent> <leader>ev <cmd>e ~/.config/nvim/init.lua<cr>
nnoremap <silent> <leader>ep <cmd>e ~/.config/nvim/lua/plugins<cr>
nnoremap <silent> <leader>el <cmd>e ~/.config/nvim/lua<cr>
nnoremap <silent> <leader>ed <cmd>e ~/dotfiles/<cr>
nnoremap <silent> <leader>ez <cmd>e ~/dotfiles/zsh/<cr>
nnoremap <silent> <leader>eL <cmd>e ~/.local/share/nvim/lazy/<cr>
Map N <leader>eg    <cmd>if has("nvim") \| tabe ~/.config/nvim/ginit.vim \| else \| tabe ~/.gvimrc \| endif<cr>


"Shift-Enter is like ]<space>
inoremap <silent> <s-cr> <esc>m`o<esc>``a

  map  ‰   <c-cr>
  map  ◊   <c-'>
  map  Ú   <c-;>
  map  Ą   <c-bs>
  map  ⌂   <M-cr>
  map  Ặ   <s-cr>
  map  ◊Ú  <C-'><C-;>

  tmap <c-a> <HOME>
  tmap <c-e> <END>

  imap <c-a> <HOME>
  imap <c-e> <END>

  imap ;w <esc><cmd>silent! w<cr>

  nnoremap <leader>tl <cmd>tabs<cr>
  nnoremap <leader>tn <cmd>tabnew<cr>
  nnoremap <leader>td <cmd>tab split<cr>
  nnoremap <leader>tt <cmd>tabnew \| e term://zsh<cr>
  nnoremap <leader>th :tab help<space>
  nnoremap <leader>tm0 <cmd>tabmove 0<cr>



  nnoremap <D-d><D-d> "xyy"xp
  vnoremap <D-d><D-d> "xy`>"xpO
  inoremap <D-v> <c-r>+
  nnoremap <D-v> "+p
  nnoremap <D-p> <NOP>
  "Use <Tab> and <S-Tab> to navigate through popup menu

  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  "imap <silent> <c-space> <Plug>(completion_trigger)
  " inoremap <silent><expr> <C-Space> compe#complete()
  " inoremap <silent><expr> <CR>      compe#confirm('<CR>')
  " inoremap <silent><expr> <C-e>     compe#close('<C-e>')
  " inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
  " inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })


  " nnoremap <expr> n  'Nn'[v:searchforward]
  nnoremap <expr> n (v:searchforward ? 'nzz' : 'Nzz')
  xnoremap <expr> n  'Nn'[v:searchforward]
  onoremap <expr> n  'Nn'[v:searchforward]

  nnoremap <expr> N (v:searchforward ? 'Nzz' : 'nzz')
  " nnoremap <expr> N  'nN'[v:searchforward]
  xnoremap <expr> N  'nN'[v:searchforward]
  onoremap <expr> N  'nN'[v:searchforward]

  nnoremap c* *Ncgn

  nnoremap g. /\V<C-r>"<CR>cgn<C-a><Esc>

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
  imap <silent> <c-j> <c-n>
  imap <silent> <c-k> <c-p>

  inoremap <C-U> <C-G>u<C-U>

  " Close all folds except this
  nnoremap z<Space> zMzv
  nnoremap z0 <cmd>set foldlevel=99<cr>
  nnoremap z1 <cmd>set foldlevel=1<cr>
  nnoremap z2 <cmd>set foldlevel=2<cr>
  nnoremap z3 <cmd>set foldlevel=3<cr>
  nnoremap z4 <cmd>set foldlevel=4<cr>
  nnoremap z5 <cmd>set foldlevel=5<cr>
  nnoremap z6 <cmd>set foldlevel=6<cr>
  nnoremap z7 <cmd>set foldlevel=7<cr>
  nnoremap z8 <cmd>set foldlevel=8<cr>
  nnoremap z9 <cmd>set foldlevel=9<cr>


  tnoremap <c-o> <c-\><c-n>

  " Put empty line around (requires UnImpaired)
  nnoremap \<Space> <cmd>normal [ ] <cr>

  " Suck from below/above
  nnoremap <C-g>j i<Esc>+y$ddgi<c-r>0<Esc>
  nnoremap <C-g>k i<Esc>-y$ddgi<c-r>0<Esc>

  " Uppercase from insert mode while you are at the end of a word
  inoremap <C-u> <esc>mzgUiw`za


  nnoremap <leader>e<cr> <cmd>e ++ff=dos<cr><cmd>%s/\r//g<cr>
  nnoremap <leader>en    <cmd>enew<cr>

  nnoremap <silent> <leader>e<Tab>  <cmd>set expandtab \| retab!<cr>


  nnoremap <leader>e<space> <cmd>call StripWhitespace()<cr>

  " underline the current line
  nnoremap <leader>u= <cmd>t.\|s/./=/g<cr><cmd>nohls<cr>
  nnoremap <leader>u- <cmd>t.\|s/./-/g<cr><cmd>nohls<cr>
  nnoremap <leader>u~ <cmd>t.\|s/./\\~/g<cr><cmd>nohls<cr>


  cnoremap <D-v> <C-R>+
  tnoremap <D-v> <C-\><C-N>pi

  cabbrev w; w

  vmap > >gv
  vmap < <gv

  nnoremap <silent> <c-k><c-=> <cmd>silent! call Preserve("normal gg=G")<cr>


  " select last matched item
  nnoremap <c-g>/ //e<Enter>v??<Enter>
  nnoremap <c-g>sl //e<Enter>v??<Enter>

  " Reselect the text you just entered
  nnoremap gV `[v`]
  nnoremap <c-g>si `[v`]








  "CD into:
  "current buffer file dir

  " nnoremap cdf :cd %:p:h<cr>:pwd<cr>
  nnoremap cdf <cmd>cd %:p:h<cr><cmd>pwd<cr>
  " nnoremap cd. :cd <c-r>=fnamemodify(expand('%:h'), ':h')<cr><cr><cmd>pwd<cr>
  nnoremap cd. <cmd>execute "cd " . fnamemodify(expand('%:h'), ':h')<cr><cmd>pwd<cr>

  nnoremap cdh <cmd>execute "cd " . expand('%:h') . "/.."<cr><cmd>pwd<cr>
  nnoremap cdk <cmd>execute "cd " . getcwd() . "/.."<cr><cmd>pwd<cr>

  nnoremap cdp <cmd>execute "cd ". GetPluginPath()<cr><cmd>pwd<cr>

  nnoremap cdr <cmd>execute "lcd ". GetProjectRootPath()<cr><cmd>pwd<cr>
  nnoremap cdm <cmd>execute "lcd ". GetProjectRootPath() . "/Modules"<cr><cmd>pwd<cr>

  nnoremap <leader>er <cmd>execute "e ". GetProjectRootPath()<cr>
  nnoremap <leader>em <cmd>execute "e ". GetProjectRootPath() . "/Modules"<cr>


  "current working dir
  nnoremap cdc <cmd>execute"cd ". expand("%:h")<cr>
  "git dir ROOT
  nnoremap cdg <cmd>execute "cd " . FindGitDirOrRoot()<cr>

  nnoremap cdd <cmd> execute "cd /Volumes/Home/.local/share/nvim/"<cr>
  nnoremap cdv <cmd> execute "cd /Volumes/Home/.config/nvim/"<cr>


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


  fun! GetProjectRootPath()
        let l:current_dir = expand('%:p:h')
        let l:parent_dir = l:current_dir

        while l:parent_dir !=# ''
          let l:env_file = l:parent_dir . '/.env'
          if filereadable(l:env_file)
            return l:parent_dir
          endif

          let l:next_parent = fnamemodify(l:parent_dir, ':h')
          if l:next_parent ==# l:parent_dir
            break
          endif
          let l:parent_dir = l:next_parent
        endwhile

        return ''
  endf





    "Open current directory in Finder
    "nnoremap gof <cmd>silent !open .<cr>

    " allow replacing word under cursor
    nnoremap grW :%s/<c-r>=expand('<cWORD>')<cr>/<c-r>=expand('<cword>')<cr>/g<left><left>
    nnoremap graW :%s/<c-r>=expand('<cWORD>')<cr>/<c-r>=expand('<cword>')<cr>/g<left><left>
    nnoremap graw :bufdo :silent! %s/<c-r>=expand('<cword>')<cr>/<c-r>=expand('<cword>')<cr>/g<left><left>
    nnoremap graw :bufdo :silent! %s/<c-r>=expand('<cword>')<cr>/<c-r>=expand('<cword>')<cr>/g<left><left>

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



    Map N <leader>tp :e ~/notes/work/<c-r>=GetRootDirName()<cr>/index.norg<cr>
    Map N <leader>to :e ~/org/todo.norg<cr>
    Map N <leader>Tp :tabe <c-r>=FindGitDirOrRoot()<cr>/todo.norg<cr>
    Map N <leader>To :tabe ~/org/todo.norg<cr>

" tohtml runtime! syntax/2html.vim
    Map N <leader>e<BS> :e! \| lua require('snacks').notify.info("changes discarded")<cr>

    nnoremap  coq <cmd>QFix<cr>
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


    xnoremap [e  <cmd><C-U>execute ":'<,'>normal \<Plug>unimpairedMoveSelectionUp"\|normal! gv<cr>
    " snoremap [e  :<C-U>execute ":'<,'>normal \<Plug>unimpairedMoveSelectionUp"\|normal! gv<cr>

    xnoremap ]e  <cmd><C-U>execute ":'<,'>normal \<Plug>unimpairedMoveSelectionDown"\|normal! gv<cr>
    " snoremap [e  :<C-U>execute ":'<,'>normal \<Plug>unimpairedMoveSelectionUp"\|normal! gv<cr>

    function! FoldFunction(option)
      set foldmethod=manual
      normal zE
      if &ft == 'blade'
        if a:option == 'editor'
          execute "silent! g/editor: {/normal lma%zf'a"
          return
        endif
        execute "silent! g/<div\\|\<style/normal lma%zf'a"
        execute "silent! g/columns: \\[\\[/normal 0maf[%zf'a"
        execute "silent! g/function\\|.edatagrid({\\|{ field:\\|{field:/normal 0maf{%zf'a"
        endif
        if &ft == 'php'
          execute "silent! g/protected \\$fillable = \\[/normal 0f[zf%"
          execute "silent! g/protected \\$dates = \\[/normal 0f[zf%"
          execute "silent! g/public function/normal 0maf{%zf'a"
          execute "silent! g/public static function/normal 0maf{%zf'a"
          execute "silent! g/private static function/normal 0maf{%zf'a"
          execute "silent! g/protected function/normal 0maf{%zf'a"
          execute "silent! g/private function/normal 0maf{%zf'a"
          execute "silent! g/\\/\\*\\*/normal mazf%'a"
          normal zM
        endif
        if &ft == 'go'
          execute "silent! g/func/normal 0maf{%zf'a"
          execute "silent! g/type/normal 0maf{%zf'a"
          execute "silent! g/import/normal 0maf{%zf'a"
          normal zM
        endif
      endfunction

      Map n <leader>zff  <cmd>call FoldFunction('')<cr>
      Map n <leader>zfe  <cmd>call FoldFunction('editor')<cr>
      Map n <leader>zi  <cmd>set fdm=indent<cr><cmd>set fdm=manual<cr>
