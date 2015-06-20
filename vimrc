" some neovim crap
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  runtime! plugin/python_setup.vim
endif

" let's use plug to manage our plugins
call plug#begin('~/.vim/plugged')

" plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'Valloric/YouCompleteMe'

" indent
Plug 'hynek/vim-python-pep8-indent'

" syntax
Plug 'me-vlad/python-syntax.vim'
Plug 'rdunklau/Jinja.vim'
Plug 'vim-scripts/JSON.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'acustodioo/vim-tmux'
Plug 'mattikus/textgenshi.vim'
Plug 'fatih/vim-go'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'derekwyatt/vim-scala'

" colors
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'

call plug#end()

" set up colorscheme
if &t_Co >= 16
  let g:airline_theme='base16'
  colorscheme base16-tomorrow
  set background=dark
endif

" options not defined in vim-sensible
set hidden
set ignorecase
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮,nbsp:␣
set modeline
set modelines=5
set nofoldenable
set shiftround
set shortmess=aftTIs
set showmatch
set smartcase
set timeoutlen=200
set wildmode=longest,full
set wrap
set wrapscan

" formatting options
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set textwidth=79

" remove comment added after o/O
set formatoptions-=o

" set up a persistent dir for backups and undos for files
set nobackup
set backupdir=$HOME/tmp,/var/tmp,/tmp
set noswapfile
set directory=$HOME/tmp,/var/tmp,/tmp
if exists('+undofile')
  set undofile
  set undodir=$HOME/tmp/undo,/var/tmp,/tmp
endif

" let virtual block selection go past end of text
if exists('+virtualedit')
  set virtualedit=block
endif

" show where where textwidth is by coloring in the background
if exists('+colorcolumn') && &t_Co >= 16
  set colorcolumn=+1
endif

" set leaders
let mapleader=','
let maplocalleader=';'

" sets shell syntax higlighting to conform to posix standards
let g:is_posix=1

" No Help, please
map <F1> <Esc>

" bind C-<hjkl> to move around splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" bind some common actions to leader
nnoremap <silent> <leader>h :set hlsearch! hlsearch?<CR>
nnoremap <silent> <leader>l :set list! list?<CR>
nnoremap <silent> <leader>n :set number! number?<CR>
nnoremap <silent> <leader>p :set paste! paste?<CR>
nnoremap <silent> <leader>w :set wrap! wrap?<CR>
nnoremap <silent> <leader>m :make<CR>
" remove all trailing whitespace
nnoremap <silent> <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" move down screen lines rather than actual lines
nnoremap j gj
nnoremap k gk

" change keybindings from tabs to buffers
nnoremap gt :bnext<CR>
nnoremap gT :bprev<CR>

" Fix caps errors on some commands
command! W :w
command! Q :q

" Let :w!! gain sudo priveleges without closing and reopening the file
cmap w!! w !sudo tee % >/dev/null
cmap W!! w !sudo tee % >/dev/null

" disable paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" 
" Plugin configuration
"

" supertab
let g:SuperTabDefaultCompletionType='context'
let g:SuperTabContextDefaultCompletionType='<c-x><c-o>'

" ctrlp
let g:ctrlp_working_path_mode='rw' "set working dir to nearest vcs dir

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" vim-go
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
autocmd Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>

if exists("$GOPATH")
    let g:go_bin_path = expand("$GOPATH/bin")
endif

" Disable vim-go auto install.
" run :GoUpdateBinaries to get the required stuffs.
let g:go_disable_autoinstall = 1
