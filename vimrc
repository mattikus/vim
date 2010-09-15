set nocompatible
set ruler 
set mouse=a 
set showmatch
set backspace=indent,eol,start
set nowrap 
set t_md="" "turn off bold chars in terminal
set nohlsearch 
set incsearch 
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent 
set smartindent 
set ignorecase
set smartcase
set wrapscan
set title
set wildmenu
set wildmode=list:longest
set scrolloff=3
set shortmess=atTIs
set verbose=0
set textwidth=78
set laststatus=2 " always enable statusline
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"fix highlighting on some shell stuffs
let g:is_posix=1

"set leaders
let mapleader=','
let maplocalleader=';'

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·

"Don't leave .swp files littered about
set backupdir=~/tmp,/var/tmp,/tmp   
set directory=~/tmp,/var/tmp,/tmp

" No Help, please
nmap <F1> <Esc>

" Fix :W to be :w
command! W :w

"Match more than just braces
runtime macros/matchit.vim

"stuff for vim 7
if version > 700
  "set autochdir
  set completeopt=menuone,longest,preview
  set ve=onemore 

  "close the help preview window if moving in or leaving insert mode
  autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
  autocmd InsertLeave * if pumvisible() == 0|pclose|endif 

  "Fix problems created by previous command in command window
  autocmd CmdWinEnter * set ei+=CursorMovedI,InsertLeave
  autocmd CmdWinLeave * set ei-=CursorMovedI,InsertLeave

  autocmd Filetype *
      \   if &omnifunc == "" |
      \           setlocal omnifunc=syntaxcomplete#Complete |
      \   endif

  "set omnicomplete to be default for supertab
  let g:SuperTabDefaultCompletionType = "context"
  let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif


"turn off folds by default
set nofoldenable

if &t_Co > 16 || has('gui')
  colorscheme mustang
else
  colorscheme desert
endif

"turn on filetype matching
filetype plugin indent on

if &t_Co > 2
  "pretty colors
  syntax enable
endif

if has('gui')
  "Set font based on which gui we're running
  if has("gui_macvim")
    set gfn=Menlo:h13
    set antialias
  else
    set gfn=Terminus\ 12
    set noantialias
  endif
  set cul
  set nu
  set lines=56
  set guioptions-=r
  set guioptions-=T
  set guioptions-=m
  set cmdheight=2
endif

" Stretches the term window by the width of the number column width
let co=(&co + &nuw + 1)


nnoremap <silent> <leader>l :set list!<CR>

" Let :w!! gain sudo priveleges without closing and reopening the file
cmap w!! w !sudo tee % >/dev/null

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" NERDTree Options
nnoremap <leader>d :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\.pyc$', '\~$', '.svn', '.git', '.hg', 'CVSROOT']

" vim-fugitive related options
set statusline+=\ %{fugitive#statusline()}

" Enable some syntastic options
let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1
set statusline+=\ %#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*\ 
