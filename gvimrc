colorscheme mustang

if has("gui_macvim")
  set guifont=Menlo:h12
  set antialias
elseif has("gui_gtk2")
  set guifont=Envy\ Code\ R\ 9
  set noantialias
endif
"set cursorline
set colorcolumn=+1
"set relativenumber
"set lines=56
set guioptions-=r
set guioptions-=T
set guioptions-=m
set cmdheight=2
