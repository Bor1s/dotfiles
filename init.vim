set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
set termguicolors

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-endwise'
Plugin 'tomtom/tcomment_vim'
Plugin 'tmhedberg/matchit'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'fatih/vim-go'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-rhubarb'
Plugin 'junegunn/fzf.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'lifepillar/vim-solarized8'

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
colorscheme solarized8
let g:solarized_diffmode="high"

" NERDTree config
" autocmd vimenter * NERDTree
map <TAB> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1

set encoding=utf-8 nobomb

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swaps
if exists("&undodir")
  set undodir=~/.config/nvim/undo
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

" Go specific setup
autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType go setlocal nolist

" Start esearch autofilled with a word under the cursor
" call esearch#map('<leader>fw', 'esearch-word-under-cursor')
noremap <Leader>a :Ack! <cword><cr>
" noremap <Leader>aa :Ack! <cr>

nnoremap ,c :let @* = expand("%:p").":".line('.')<cr>