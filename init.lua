local set = vim.opt

vim.bo.filetype = 'off'

set.rtp = set.rtp + "~/.config/nvim/bundle/Vundle.vim"
set.rtp = set.rtp + "/usr/local/opt/fzf"
set.termguicolors = true

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-endwise'
Plug 'tomtom/tcomment_vim'
Plug 'tmhedberg/matchit'
Plug 'terryma/vim-multiple-cursors'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mustache/vim-mustache-handlebars'
Plug('fatih/vim-go', {['do'] = ':GoUpdateBinaries'})
Plug 'neoclide/coc.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ellisonleao/gruvbox.nvim'

vim.call('plug#end')

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.cmd [[
  syntax enable
  filetype plugin indent on
  runtime macros/matchit.vim
]]

-- Nvim tree
require("nvim-tree").setup()
map("n", "<Leader><Tab>", ":NvimTreeToggle<CR>")

vim.o.background = 'light'
vim.cmd.colorscheme "gruvbox"

-- Don’t add empty newlines at the end of files
vim.cmd[[
  set encoding=utf-8 nobomb
  set binary
  set noeol
]]

-- Centralize backups, swapfiles and undo history
vim.cmd [[
  set backupdir=~/.config/nvim/backups
  set directory=~/.config/nvim/swaps
  if exists("&undodir")
    set undodir=~/.config/nvim/undo
  endif
]]

-- Highlight current line
vim.cmd [[
  set cursorline
]]

-- Make tabs as wide as two spaces
vim.cmd [[
  set expandtab
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
]]

-- Enable line numbers
-- vim.cmd [[
--   set relativenumber
-- ]]
vim.cmd [[
  set number
]]

-- Show “invisible” characters
vim.cmd [[
  set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
  set list
]]

-- Highlight searches
vim.cmd [[
  set hlsearch
]]

-- Ignore case of searches
vim.cmd [[
  set ignorecase
]]

-- Highlight dynamically as pattern is typed
vim.cmd [[
  set incsearch
]]

-- Always show status line
vim.cmd [[
  set laststatus=2
]]

-- Fugitive Gdiff vertical split
vim.cmd [[
  set diffopt+=vertical
]]

-- Go specific setup
vim.cmd [[
  autocmd FileType go setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType go setlocal nolist
]]

-- Start esearch autofilled with a word under the cursor
vim.cmd [[
  noremap <Leader>a :Ack! <cword><cr>
]]

-- Copy full file path with line number under cursor
vim.cmd [[
  nnoremap ,c :let @* = expand("%:p").":".line('.')<cr>
]]

-- CoC Vim config
vim.cmd [[
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
set hidden

set nobackup
set nowritebackup

set cmdheight=1

set updatetime=200

set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
autocmd CursorHold * silent call CocActionAsync('highlight')
]]