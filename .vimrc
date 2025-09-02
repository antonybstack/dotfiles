" An example for a vimrc file.
"
" Maintainer:   The Vim Project <https://github.com/vim/vim>
" Last Change:  2023 Aug 10
" Former Maintainer:    Bram Moolenaar <Bram@vim.org>
"
" To use it, copy it to
"              for Unix:  ~/.vimrc
"             for Amiga:  s:.vimrc
"        for MS-Windows:  $VIM\_vimrc
"             for Haiku:  ~/config/settings/vim/vimrc
"           for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile        " keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" ========== General Settings ==========
set nocompatible        " Use Vim, not vi
set encoding=utf-8
set number              " Show line numbers
set relativenumber      " Relative line numbers (great for motions)
set cursorline          " Highlight current line
set showcmd             " Show command in status line
set wildmenu            " Better command completion
set hidden              " Allow switching buffers without saving

" ========== Indentation ==========
set tabstop=4           " Show existing tab with 4 spaces width
set shiftwidth=4        " When indenting with '>', use 4 spaces
set expandtab           " Use spaces instead of tabs
set autoindent
set smartindent

" Enable syntax highlighting (VSCode may override, but good for standalone Vim)
" syntax on

" For Angular/TypeScript (2 spaces instead of 4)
autocmd FileType javascript,typescript,html,css,scss,json setlocal shiftwidth=2 tabstop=2

" ========== Search ==========
set ignorecase          " Ignore case when searching
set smartcase           " Unless uppercase letters used
set incsearch           " Show search as you type
set hlsearch            " Highlight matches

" Map <leader><space> to clear search highlight
nnoremap <Esc> :nohlsearch<CR>

" ========== Clipboard ==========
set clipboard+=unnamed   " Use system clipboard

" ========== Splits ==========
set splitbelow          " Horizontal split below
set splitright          " Vertical split right

" ========== Useful Remaps ==========
let mapleader=" "       " Leader key as <Space>

" Easier save/quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Move between splits with Ctrl-h/j/k/l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quick window resizing
nnoremap <leader>= :resize +5<CR>
nnoremap <leader>- :resize -5<CR>
nnoremap <leader>> :vertical resize +5<CR>
nnoremap <leader>< :vertical resize -5<CR>

" Easier buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" ========== Quality of Life ==========
" Yank to end of line (like D & C work)
nnoremap Y y$

" Keep search matches centered
nnoremap n nzzzv
nnoremap N Nzzzv

" Move selected lines up/down
xnoremap J :move '>+1<CR>gv=gv
xnoremap K :move '<-2<CR>gv=gv

" Reselect last pasted text
nnoremap gp `[v`]

" Fast exit from insert mode. 'jk' is a common, ergonomic alternative to Escape.
inoremap jk <Esc>

" Yank to system clipboard with <leader>y
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Paste from system clipboard with <leader>p
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Always show status line
set laststatus=2

" ========== VSCode Specific ==========
" Some plugins won't work in VSCodeVim, but motions and remaps will
" This config emphasizes motions, splits, and editing comfort
