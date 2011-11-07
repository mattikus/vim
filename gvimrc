colorscheme mustang

if has("gui_macvim")
  set guifont=Ubuntu\ Mono:h13
  set antialias
elseif has("gui_gtk2")
  set guifont=montecarlo\ 9
  set noantialias
endif
set colorcolumn=+1
"set cursorline
"set relativenumber
"set lines=56
"set number
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=T
set guioptions-=m
set cmdheight=2
