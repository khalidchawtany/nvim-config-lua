inoremap <D-v> <c-r>+
nnoremap <D-v> "+p
"Use <Tab> and <S-Tab> to navigate through popup menu

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <silent> <c-space> <Plug>(completion_trigger)
imap <silent> <c-j> <c-n>
imap <silent> <c-k> <c-p>


nnoremap <expr> n (v:searchforward ? 'nzz' : 'Nzz')
nnoremap <expr> N (v:searchforward ? 'Nzz' : 'nzz')

nnoremap c* *Ncgn

nnoremap <nowait> <Leader><Leader> <c-^>

vnoremap <c-d> "dyo<esc>"dp

"Shift-Enter is like ]<space>
inoremap <silent> <s-cr> <esc>m`o<esc>``a



vnoremap . :norm.<CR>

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

" Move visual block
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv



" select last matched item
nnoremap <c-g>/ //e<Enter>v??<Enter>
nnoremap <c-g>sl //e<Enter>v??<Enter>

" Reselect the text you just entered
nnoremap gV `[v`]
nnoremap <c-g>si `[v`]






nnoremap <leader>t<space>  :tabonly<cr>
nnoremap <leader>q<space>  :tabclose<cr>
nnoremap <leader>qq        :q<cr>
nnoremap <leader>qa        :qall<cr>
nnoremap <leader>qQ        :qall!<cr>

nnoremap <leader>wq        :wq<cr>
nnoremap <leader>ww        :w<cr>
nnoremap <leader>wa        :wall<cr>
nnoremap <leader>wu        :update<cr>


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
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-h> <left>
cnoremap <c-l> <right>
cnoremap <c-g>p <C-\>egetcwd()<CR>
cnoremap <c-g>f <C-r>=expand("%")<CR>


