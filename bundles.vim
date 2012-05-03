set nocompatible
filetype off

set runtimepath+=$HOME/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

" plugins
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'scrooloose/nerdcommenter'
Bundle 'sjl/gundo.vim'
Bundle 'tsaleh/vim-align'

Bundle 'scrooloose/nerdtree'
nnoremap <leader>dd :NERDTreeToggle<CR>
nnoremap <leader>de :NERDTree
nnoremap <leader>df :NERDTreeFind<cr>
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\.pyc$', '\~$', '.svn', '.git', '.hg', 'CVSROOT']

Bundle 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

Bundle 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 2 "set working dir to nearest vcs dir

Bundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'fancy'
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" git
Bundle 'tpope/vim-fugitive'
Bundle 'int3/vim-extradite'

" indent
Bundle 'gg/python.vim'

" syntax
Bundle 'me-vlad/python-syntax.vim'
Bundle 'rdunklau/Jinja.vim'
Bundle 'vim-scripts/JSON.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'acustodioo/vim-tmux'
Bundle 'kusnier/vim-mediawiki'
Bundle 'mattikus/textgenshi.vim'

" colors
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'altercation/vim-colors-solarized'
Bundle 'sjl/badwolf'
