set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-endwise'
Plugin 'tomtom/tcomment_vim'
Plugin 'tmhedberg/matchit'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'
Plugin 'mileszs/ack.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'eugen0329/vim-esearch'
Plugin 'mhinz/vim-startify'
Plugin 'w0rp/ale'

" Ale auto correct for JS
let g:ale_fixers = {
\   'javascript': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop', 'remove_trailing_lines', 'trim_whitespace']
\}

let g:ale_fix_on_save = 0
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
syntax enable
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this linegg

runtime macros/matchit.vim

" Colorscheme
set background=light
colorscheme solarized
let g:solarized_diffmode="high"    "default value is normal

" NERDTree config
" autocmd vimenter * NERDTree
map <TAB> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1

" set guifont=Monaco:h14
set guifont=Roboto\ Mono\ Medium\ for\ Powerline:h14
set encoding=utf-8 nobomb

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Highlight current line
set cursorline

" Make tabs as wide as two spaces
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Enable line numbers
set relativenumber

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2

" Map annoying :Q to :q
" cmap Q q

" Fugitive Gdiff vertical split
set diffopt+=vertical

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'vendor\|tmp'

" Go specific setup
autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType go setlocal nolist

" Start esearch autofilled with a word under the cursor
" call esearch#map('<leader>fw', 'esearch-word-under-cursor')
noremap <Leader>a :Ack! <cword><cr>
" noremap <Leader>aa :Ack! <cr>
