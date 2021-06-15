-- keep cursor colum when JK motion
vim.g.EasyMotion_startofline = 0
vim.g.EasyMotion_force_csapprox = 1

vim.cmd [[
   map <leader>s         <Plug>(easymotion-prefix)
   map <leader>s;        <Plug>(easymotion-s2)
   map <leader>ss;       <Plug>(easymotion-sn)

   map <leader>sl        <Plug>(easymotion-lineforward)
   map <leader>sh        <Plug>(easymotion-linebackward)
   map <leader>s<space>  <Plug>(easymotion-lineanywhere)

   map <leader>ssf       <Plug>(easymotion-bd-f)
   map <leader>sst       <Plug>(easymotion-bd-t)
   map <leader>ssw       <Plug>(easymotion-bd-w)
   map <leader>ssW       <Plug>(easymotion-bd-W)
   map <leader>ssw       <Plug>(easymotion-bd-e)
   map <leader>ssE       <Plug>(easymotion-bd-E)
   map <leader>ssj       <Plug>(easymotion-bd-jk)
   map <leader>ssk       <Plug>(easymotion-bd-jk)
   map <leader>ssl       <Plug>(easymotion-bd-jk)
   map <leader>ssn       <Plug>(easymotion-bd-n)
   map <leader>ssa       <Plug>(easymotion-jumptoanywhere)
   map <leader>s<cr>       <Plug>(easymotion-repeat)

   map <leader>ssL    <Plug>(easymotion-eol-bd-jk)
   map <leader>ssH    <Plug>(easymotion-sol-bd-jk)

   map <leader>sSF    <Plug>(easymotion-overwin-f)
   map <leader>sS;    <Plug>(easymotion-overwin-f2)
   map <leader>sSW    <Plug>(easymotion-overwin-w)
   map <leader>sSL    <Plug>(easymotion-overwin-line)

   map <leader>su    <Plug>(easymotion-segments-LF)
   map <leader>sU    <Plug>(easymotion-segments-LB)
   map <leader>sc    <Plug>(easymotion-segments-RF)
   map <leader>sC    <Plug>(easymotion-segments-RB)

      ]]

--   Default Mapping      | Details
--   ---------------------|----------------------------------------------
--   <Leader>f{char}      | Find {char} to the right. See |f|.
--   <Leader>F{char}      | Find {char} to the left. See |F|.
--   <Leader>t{char}      | Till before the {char} to the right. See |t|.
--   <Leader>T{char}      | Till after the {char} to the left. See |T|.
--   <Leader>w            | Beginning of word forward. See |w|.
--   <Leader>W            | Beginning of WORD forward. See |W|.
--   <Leader>b            | Beginning of word backward. See |b|.
--   <Leader>B            | Beginning of WORD backward. See |B|.
--   <Leader>e            | End of word forward. See |e|.
--   <Leader>E            | End of WORD forward. See |E|.
--   <Leader>ge           | End of word backward. See |ge|.
--   <Leader>gE           | End of WORD backward. See |gE|.
--   <Leader>j            | Line downward. See |j|.
--   <Leader>k            | Line upward. See |k|.
--   <Leader>n            | Jump to latest "/" or "?" forward. See |n|.
--   <Leader>N            | Jump to latest "/" or "?" backward. See |N|.
--   <Leader>s            | Find(Search) {char} forward and backward.
--                        | See |f| and |F|.
-- Unused Maps
--   More <Plug> Mapping Table         | (No assignment by default)
--   ----------------------------------|---------------------------------
--   <Plug>(easymotion-bd-f)           | See |<Plug>(easymotion-s)|
--   <Plug>(easymotion-bd-t)           | See |<Plug>(easymotion-bd-t)|
--   <Plug>(easymotion-bd-w)           | See |<Plug>(easymotion-bd-w)|
--   <Plug>(easymotion-bd-W)           | See |<Plug>(easymotion-bd-W)|
--   <Plug>(easymotion-bd-e)           | See |<Plug>(easymotion-bd-e)|
--   <Plug>(easymotion-bd-E)           | See |<Plug>(easymotion-bd-E)|
--   <Plug>(easymotion-bd-jk)          | See |<Plug>(easymotion-bd-jk)|
--   <Plug>(easymotion-bd-n)           | See |<Plug>(easymotion-bd-n)|
--   <Plug>(easymotion-jumptoanywhere) | See |<Plug>(easymotion-jumptoanywhere)|
--   <Plug>(easymotion-repeat)         | See |<Plug>(easymotion-repeat)|
--   <Plug>(easymotion-next)           | See |<Plug>(easymotion-next)|
--   <Plug>(easymotion-prev)           | See |<Plug>(easymotion-prev)|
--   <Plug>(easymotion-sol-j)          | See |<Plug>(easymotion-sol-j)|
--   <Plug>(easymotion-sol-k)          | See |<Plug>(easymotion-sol-k)|
--   <Plug>(easymotion-eol-j)          | See |<Plug>(easymotion-eol-j)|
--   <Plug>(easymotion-eol-k)          | See |<Plug>(easymotion-eol-k)|
--   <Plug>(easymotion-iskeyword-w)    | See |<Plug>(easymotion-iskeyword-w)|
--   <Plug>(easymotion-iskeyword-b)    | See |<Plug>(easymotion-iskeyword-b)|
--   <Plug>(easymotion-iskeyword-bd-w) | See |<Plug>(easymotion-iskeyword-bd-w)|
--   <Plug>(easymotion-iskeyword-e)    | See |<Plug>(easymotion-iskeyword-e)|
--   <Plug>(easymotion-iskeyword-ge)   | See |<Plug>(easymotion-iskeyword-ge)|
--   <Plug>(easymotion-iskeyword-bd-e) | See |<Plug>(easymotion-iskeyword-bd-e)|
--   <Plug>(easymotion-vim-n)          | See |<Plug>(easymotion-vim-n)|
--   <Plug>(easymotion-vim-N)          | See |<Plug>(easymotion-vim-N)|
--                                     |
--   Within Line Motion                | See |easymotion-within-line|
--   ----------------------------------|---------------------------------
--   <Plug>(easymotion-sl)             | See |<Plug>(easymotion-sl)|
--   <Plug>(easymotion-fl)             | See |<Plug>(easymotion-fl)|
--   <Plug>(easymotion-Fl)             | See |<Plug>(easymotion-Fl)|
--   <Plug>(easymotion-bd-fl)          | See |<Plug>(easymotion-sl)|
--   <Plug>(easymotion-tl)             | See |<Plug>(easymotion-tl)|
--   <Plug>(easymotion-Tl)             | See |<Plug>(easymotion-Tl)|
--   <Plug>(easymotion-bd-tl)          | See |<Plug>(easymotion-bd-tl)|
--   <Plug>(easymotion-wl)             | See |<Plug>(easymotion-wl)|
--   <Plug>(easymotion-bl)             | See |<Plug>(easymotion-bl)|
--   <Plug>(easymotion-bd-wl)          | See |<Plug>(easymotion-bd-wl)|
--   <Plug>(easymotion-el)             | See |<Plug>(easymotion-el)|
--   <Plug>(easymotion-gel)            | See |<Plug>(easymotion-gel)|
--   <Plug>(easymotion-bd-el)          | See |<Plug>(easymotion-bd-el)|
--   <Plug>(easymotion-lineforward)    | See |<Plug>(easymotion-lineforward)|
--   <Plug>(easymotion-linebackward)   | See |<Plug>(easymotion-linebackward)|
--   <Plug>(easymotion-lineanywhere)   | See |<Plug>(easymotion-lineanywhere)|
--                                     |
--   Multi Input Find Motion           | See |easymotion-multi-input|
--   ----------------------------------|---------------------------------
--   <Plug>(easymotion-s2)             | See |<Plug>(easymotion-s2)|
--   <Plug>(easymotion-f2)             | See |<Plug>(easymotion-f2)|
--   <Plug>(easymotion-F2)             | See |<Plug>(easymotion-F2)|
--   <Plug>(easymotion-bd-f2)          | See |<Plug>(easymotion-s2)|
--   <Plug>(easymotion-t2)             | See |<Plug>(easymotion-t2)|
--   <Plug>(easymotion-T2)             | See |<Plug>(easymotion-T2)|
--   <Plug>(easymotion-bd-t2)          | See |<Plug>(easymotion-bd-t2)|
--                                     |
--   <Plug>(easymotion-sl2)            | See |<Plug>(easymotion-sl2)|
--   <Plug>(easymotion-fl2)            | See |<Plug>(easymotion-fl2)|
--   <Plug>(easymotion-Fl2)            | See |<Plug>(easymotion-Fl2)|
--   <Plug>(easymotion-tl2)            | See |<Plug>(easymotion-tl2)|
--   <Plug>(easymotion-Tl2)            | See |<Plug>(easymotion-Tl2)|
--                                     |
--   <Plug>(easymotion-sn)             | See |<Plug>(easymotion-sn)|
--   <Plug>(easymotion-fn)             | See |<Plug>(easymotion-fn)|
--   <Plug>(easymotion-Fn)             | See |<Plug>(easymotion-Fn)|
--   <Plug>(easymotion-bd-fn)          | See |<Plug>(easymotion-sn)|
--   <Plug>(easymotion-tn)             | See |<Plug>(easymotion-tn)|
--   <Plug>(easymotion-Tn)             | See |<Plug>(easymotion-Tn)|
--   <Plug>(easymotion-bd-tn)          | See |<Plug>(easymotion-bd-tn)|
--                                     |
--   <Plug>(easymotion-sln)            | See |<Plug>(easymotion-sln)|
--   <Plug>(easymotion-fln)            | See |<Plug>(easymotion-fln)|
--   <Plug>(easymotion-Fln)            | See |<Plug>(easymotion-Fln)|
--   <Plug>(easymotion-bd-fln)         | See |<Plug>(easymotion-sln)|
--   <Plug>(easymotion-tln)            | See |<Plug>(easymotion-tln)|
--   <Plug>(easymotion-Tln)            | See |<Plug>(easymotion-Tln)|
--   <Plug>(easymotion-bd-tln)         | See |<Plug>(easymotion-bd-tln)|
--
--   Over Window Motion                | (No assignment by default)
--   ----------------------------------|---------------------------------
--   <Plug>(easymotion-overwin-f)      | See |<Plug>(easymotion-overwin-f)|
--   <Plug>(easymotion-overwin-f2)     | See |<Plug>(easymotion-overwin-f2)|
--   <Plug>(easymotion-overwin-line)   | See |<Plug>(easymotion-overwin-line)|
--   <Plug>(easymotion-overwin-w)      | See |<Plug>(easymotion-overwin-w)|
