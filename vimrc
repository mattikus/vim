set nocompatible

"turn on filetype matching
filetype plugin indent on

set textwidth=79
set hidden
set showcmd
set showmode
set encoding=utf-8
set ruler
set mouse=a
set backspace=indent,eol,start
set wrap
set t_md="" "turn off bold chars in terminal
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
set laststatus=2 " always enable statusline
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

nnoremap j gj
nnoremap k gk

"set leaders
let mapleader=','
let maplocalleader=';'

"search options
set hlsearch
set incsearch
set showmatch

" see fo-table for options
set formatoptions=qrnl1

"fix highlighting on some shell stuffs
let g:is_posix=1

"
" Set up a persistent dir for backups and undos for files
set nobackup
set backupdir=$HOME/tmp,/var/tmp,/tmp

set noswapfile
set directory=$HOME/tmp,/var/tmp,/tmp

if version >= 703
  set undofile
  set undodir=$HOME/tmp/undo,/var/tmp,/tmp
endif

" No Help, please
nmap <F1> <Esc>
vmap <F1> <Esc>
imap <F1> <Esc>

"bind C-<hjkl> to move around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Open .[gv]imrc in a new vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>eg :vsplit $MYGVIMRC<cr>

" Fix :W to be :w
command! W :w

"Match more than just braces
runtime macros/matchit.vim

"stuff for vim 7
if version >= 700
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

if version >= 703 && &t_Co > 16
  set colorcolumn=+1
endif


"turn off folds by default
set nofoldenable

if &t_Co > 16
  colorscheme mustang
else
  colorscheme desert
endif

if &t_Co > 2
  syntax enable "pretty colors
endif

" bind <leader>W to remove all whitespace in a file
nnoremap <silent> <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-
nnoremap <leader>3 0i### <esc>j

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·
nnoremap <silent> <leader>l :set list!<CR>

" Hides highlighting from searches
nnoremap <leader><space> :nohlsearch<cr>

" Let :w!! gain sudo priveleges without closing and reopening the file
cmap w!! w !sudo tee % >/dev/null

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
if has("win32") || has("win64")
  set shellslash " helps pathogen's duplication check
  set runtimepath+=$USERPROFILE/vimfiles/bundle/pathogen
else
  set runtimepath+=$HOME/.vim/bundle/pathogen
end
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()

" NERDTree Options
nnoremap <leader>dd :NERDTreeToggle<CR>
nnoremap <leader>de :NERDTree 
nnoremap <leader>df :NERDTreeFind<cr>
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\.pyc$', '\~$', '.svn', '.git', '.hg', 'CVSROOT']

" Statusline functions and settings
function! GetCWD()
  return expand(":pwd")
endfunction

function! IsHelp()
  return &buftype=='help'?' (help) ':''
endfunction

function! GetName()
  return expand("%:t")==''?'<none>':expand("%:t")
endfunction

set statusline=%3*[%1*%{GetName()}%3*]%3*
set statusline+=%7*%{&modified?'\ (modified)':'\ '}%3*
set statusline+=%5*%{IsHelp()}%3*
set statusline+=%6*%{&readonly?'\ (read-only)\ ':'\ '}%3*
set statusline+=%3*fenc:%4*%{strlen(&fenc)?&fenc:'none'}%3*\ \ 
set statusline+=%3*ff:%4*%{&ff}%3*\ \ 
set statusline+=%3*ft:%4*%{strlen(&ft)?&ft:'<none>'}\ \ 
set statusline+=%3*tab:%4*%{&ts}
set statusline+=%3*,%4*%{&sts}
set statusline+=%3*,%4*%{&sw}
set statusline+=%3*,%4*%{&et?'et':'noet'}\ \ 
set statusline+=%<%3*pwd:%4*%{getcwd()}\ \ 
set statusline+=%9*%=
set statusline+=\ %{fugitive#statusline()}\ 
set statusline+=%3*col:%4*%c\ \ 
set statusline+=%3*line:%4*%l\ \ 
set statusline+=%3*total:%4*%L\ 

" gist options
let g:gist_detect_filetype = 1
if has("unix") && has("x11")
  let g:gist_clip_command = 'xclip'
end

" Powerline Options
let g:Powerline_symbols = 'fancy'
