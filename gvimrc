set bg=light
colorscheme solarized

if has("gui_macvim")
  set guifont=Source\ Code\ Pro\ Medium:h14
  set antialias
elseif has("gui_gtk2")
  set guifont=montecarlo\ 9
  set noantialias
endif

set colorcolumn=+1
set columns=120
set showtabline=1
set guioptions=gt
