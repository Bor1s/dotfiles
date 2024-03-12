let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
let NetrwTopLvlMenu = "Netrw."
let NetrwMenuPriority =  80 
silent only
silent tabonly
cd ~/Projects/on
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +6 app/models/account_surface.rb
badd +10 app/jobs/product_importer_job.rb
badd +1 app/services/spree/product_imports/importer.rb
badd +53 app/services/aggregators/feedonomics_variant_data.rb
badd +152 app/models/spree/product_decorator.rb
argglobal
%argdel
edit app/services/aggregators/feedonomics_variant_data.rb
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt app/services/spree/product_imports/importer.rb
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
4
normal! zo
5
normal! zo
45
normal! zo
46
normal! zo
let s:l = 53 - ((31 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 53
let s:c = 59 - ((55 * winwidth(0) + 40) / 80)
if s:c > 0
  exe 'normal! ' . s:c . '|zs' . 59 . '|'
else
  normal! 059|
endif
lcd ~/Projects/on/app/models
wincmd w
argglobal
if bufexists(fnamemodify("~/Projects/on/app/models/spree/product_decorator.rb", ":p")) | buffer ~/Projects/on/app/models/spree/product_decorator.rb | else | edit ~/Projects/on/app/models/spree/product_decorator.rb | endif
if &buftype ==# 'terminal'
  silent file ~/Projects/on/app/models/spree/product_decorator.rb
endif
balt ~/Projects/on/app/services/aggregators/feedonomics_variant_data.rb
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 112 - ((11 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 112
normal! 0
lcd ~/Projects/on/app/models
wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
