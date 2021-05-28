vim.g.fzf_buffers_jump = 1

vim.g.fzf_layout = {window = {width = 0.9, height = 0.7}}

vim.cmd [[

    let $FZF_DEFAULT_OPTS=" --history=/Users/JuJu/.fzf_history --pointer=' ▶' --marker='◉' --reverse --bind 'ctrl-space:select-all,ctrl-l:jump'  --color=bg+:#cccccc,fg+:#444444,hl:#22aa44,hl+:#44ff44,gutter:#eeeeee,marker:#ff0000"

    au FileType fzf set nonu nornu

    nnoremap <silent> <c-p>p :silent! call fzf#vim#files(getcwd(), {'options': '--reverse -q '.shellescape(expand('<cword>'))}, 1)<cr>

]]
