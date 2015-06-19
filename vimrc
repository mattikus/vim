set nocompatible

" Let's use Vundle to manage our plugins
filetype off

call plug#begin('~/.vim/plugged')

" plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.sh
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" git
Plug 'tpope/vim-fugitive'

" indent
Plug 'hynek/vim-python-pep8-indent'

" syntax
Plug 'me-vlad/python-syntax.vim'
Plug 'rdunklau/Jinja.vim'
Plug 'vim-scripts/JSON.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'acustodioo/vim-tmux'
Plug 'kusnier/vim-mediawiki'
Plug 'mattikus/textgenshi.vim'
Plug 'fatih/vim-go'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'derekwyatt/vim-scala'

" colors
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
call plug#end()

syntax on
filetype plugin indent on

set background=light
if &t_Co > 16
  colorscheme solarized
else
  colorscheme desert
endif

set autoindent
set autoread
set backspace=indent,eol,start
set encoding=utf-8
set expandtab
set hidden
set ignorecase
set laststatus=2 " always enable statusline
set mouse=a
set modeline
set modelines=5
set ruler
set scrolloff=3
set shiftround
set shiftwidth=4
set shortmess=atTIs
set showcmd
set showmode
set smartcase
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
set textwidth=79
set timeoutlen=250
set title
set verbose=0
set wildmenu
set wildmode=list,longest
set wrap
set wrapscan

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪

"set leaders
let mapleader=','
let maplocalleader=';'

"search options
set hlsearch
set incsearch
set showmatch

" see fo-table for options
set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

" sets shell syntax to conform to posix std
let g:is_posix=1

" Set up a persistent dir for backups and undos for files
set nobackup
set backupdir=$HOME/tmp,/var/tmp,/tmp

set noswapfile
set directory=$HOME/tmp,/var/tmp,/tmp

if exists('+undofile')
  set undofile
  set undodir=$HOME/tmp/undo,/var/tmp,/tmp
endif

" Jump directly to insert mode with paste using F2 key
map <F2> :set paste<CR>i
imap <F2> <ESC>:set paste<CR>i<Right>

" disable paste mode when leaving insert mode
au InsertLeave * set nopaste

" No Help, please
nmap <F1> <Esc>
vmap <F1> <Esc>
imap <F1> <Esc>

" bind C-<hjkl> to move around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Open .[gv]imrc in a new vertical split
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>eg :split $MYGVIMRC<cr>

" Fix caps errors on some commands
command! W :w
command! Q :q

"Match more than just braces
runtime macros/matchit.vim

"stuff for vim 7
if version >= 700
  "set autochdir
  set completeopt+=preview
  set virtualedit=block

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

  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif

if exists('+colorcolumn') && &t_Co > 16
  set colorcolumn=+1
endif

"turn off folds by default
set nofoldenable

" bind <leader>W to remove all whitespace in a file
nnoremap <silent> <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Let :w!! gain sudo priveleges without closing and reopening the file
cmap w!! w !sudo tee % >/dev/null

if has("unix") && system("uname") == "Darwin\n"
    " Fun mac stuff can go here
    nnoremap <leader>M :silent !open -a Marked\ 2.app '%:p'<cr>
    " Changer iterm2 cursor shape when in insert mode
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

nnoremap <silent> <leader>h :set hlsearch! hlsearch?<CR>
nnoremap <silent> <leader>l :set list! list?<CR>
nnoremap <silent> <leader>n :set number! number?<CR>
nnoremap <silent> <leader>p :set paste! paste?<CR>
nnoremap <silent> <leader>w :set wrap! wrap?<CR>

" move down screen lines rather than actual lines
nnoremap j gj
nnoremap k gk

" change keybindings from tabs to buffers
map gt :bnext<CR>
map gT :bprev<CR>

" easy bind for :make
nnoremap <leader>m :make<cr>

" Plugin configuration

" supertab
let g:SuperTabDefaultCompletionType='context'
let g:SuperTabContextDefaultCompletionType='<c-x><c-o>'

" ctrlp
let g:ctrlp_working_path_mode='rw' "set working dir to nearest vcs dir

" airline
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_branch_prefix = ' '
"let g:airline_readonly_symbol = ''
"let g:airline_linecolumn_prefix = ' '
let g:airline#extensions#tabline#enabled = 1

" vim-go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>

if exists("$GOPATH")
    let g:go_bin_path = expand("$GOPATH/bin")
endif

"disable vim-go auto install. run :GoUpdateBinaries to get the required stuffs.
let g:go_disable_autoinstall = 1 


