set bg=light
colorscheme solarized

if has("gui_macvim")
  set guifont=Menlo:h12
  set antialias
elseif has("gui_gtk2")
  set guifont=montecarlo\ 9
  set noantialias
endif

set guioptions=egt
