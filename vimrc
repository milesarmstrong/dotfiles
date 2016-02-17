" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Vim needs a POSIX-Compliant shell. Fish is not.
if $SHELL =~ '/usr/local/bin/fish'
set shell=/bin/sh
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized' " Colour scheme
Plugin 'tpope/vim-surround' " Easy bracketing / quoting
Plugin 'tpope/vim-commentary' " Easy commenting
Plugin 'kien/ctrlp.vim' " Fuzzy file finder
Plugin 'scrooloose/nerdtree' " File tree
Plugin 'vim-airline/vim-airline' " Status bar
Plugin 'vim-airline/vim-airline-themes' " Status bar
Plugin 'scrooloose/syntastic' " Syntax checking
Plugin 'tpope/vim-unimpaired' " Good key mappings

" All of your Plugins must be added before the following line
call vundle#end()            " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

set encoding=utf-8      " use utf-8 character set by default
syntax on               " turn on syntax highlighting
filetype plugin indent on

set number              " show line numbers
set showcmd             " display incomplete commands at the bottom
set scrolloff=5         " keep 5 lines visible around cursor (if possible)
set matchtime=3         " highlight matching parens for 3 seconds

set incsearch           " search incrementally as you type
set hlsearch            " highlight search matches
set ignorecase          " use case-insensitive search
set smartcase           " automatically decide to search with case or not
set gdefault            " global substitution by default

set autoread            " re-read an open file that has changed outside vim

set tabstop=4           " set hard tabstop size to 4
set softtabstop=4       " set soft tabstop size to 4
set shiftwidth=4        " set size of an 'indent' to 4
set autoindent          " automatically indent new lines
set expandtab           " use spaces instead of <tab>s
set smarttab            " make adding/removing tabs (spaces) smarter

set textwidth=100
set linebreak
set colorcolumn=+1

set noesckeys           " remove the delay when hitting esc in insert mode
set ttimeout
set ttimeoutlen=1


""""" TEMPORARY FILES """"""

set history=1000        " keep 1000 lines of command line history
set undofile            " save undo history to a file
set undoreload=10000    " save 10000 lines of undo history

set undodir=~/.vim/tmp/undo     " save undo files to ~/.vim/tmp/undo
set backupdir=~/.vim/tmp/backup " save backup files to ~/.vim/tmp/backup
set directory=~/.vim/tmp/swap   " save swap files to ~/.vim/tmp/swap

" Create temporary folders if they don't already exist
if !isdirectory( expand( &undodir ) )
    call mkdir( expand( &undodir ), "p" )
endif
if !isdirectory( expand( &backupdir ) )
    call mkdir( expand( &backupdir ), "p" )
endif
if !isdirectory( expand( &directory ) )
    call mkdir( expand( &directory ), "p" )
endif

""""" KEY BINDINGS """""

" Stop using the cursor keys once and for all! (Unbind them)
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Make j and k work on screen lines, not file lines
nnoremap j gj
nnoremap k gk

" Set leader keys
let mapleader=","

" Toggle line numbers
nnoremap <leader>n :setlocal number!<cr>

" Write to protected file (request sudo)
noremap <Leader>W :w sudo tee %<cr>

" Turn off search highlighting
nnoremap <leader>h :nohlsearch<cr>

" Open tree view
noremap <leader>t : NERDTreeToggle<cr>

" Toggle Paste
set pastetoggle=<leader>p

" Colours
set t_Co=16
set background=dark
colorscheme solarized

" Airline
set laststatus=2
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline_inactive_collapse=0
let g:airline_theme='solarized'
let g:airline#extensions#syntastic#enabled = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
noremap <leader>e :SyntasticToggleMode<CR>
noremap <leader>s :SyntasticCheck<CR>
