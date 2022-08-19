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
Plug 'marko-cerovac/material.nvim'
Plug('fatih/vim-go', {['do'] = ':GoUpdateBinaries'})
Plug 'neoclide/coc.nvim'
Plug 'kyazdani42/nvim-tree.lua'

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

-- Material Vim colorscheme
vim.g.material_style = "oceanic"

require('material').setup({
  contrast = {
    sidebars = true, -- Enable contrast for sidebars, floating windows and popup menus like Nvim-Tree
    borders = true, -- Enable borders between verticaly split windows
  },

  popup_menu = "dark", -- Popup menu style ( can be: 'dark', 'light', 'colorful' or 'stealth' )

  italics = {
    comments = false, -- Enable italic comments
    keywords = false, -- Enable italic keywords
    functions = false, -- Enable italic functions
    strings = false, -- Enable italic strings
    variables = false -- Enable italic variables
  },

  contrast_windows = { -- Specify which windows get the contrasted (darker) background
    "terminal", -- Darker terminal background
    "packer", -- Darker packer background
    "qf" -- Darker qf list background
  },

  text_contrast = {
    lighter = true, -- Enable higher contrast text for lighter style
    darker = true-- Enable higher contrast text for darker style
  }
})

vim.cmd 'colorscheme material'

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

if has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
	endif

	inoremap <silent><expr> <c-space> coc#refresh()

	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
	autocmd CursorHold * silent call CocActionAsync('highlight')
]]