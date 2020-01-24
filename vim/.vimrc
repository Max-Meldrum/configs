" Disable file type for vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" General
Plugin 'vim-syntastic/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'klassegeljakt/vim-stealth'

" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'

" Theme/Style
Plugin 'flazz/vim-colorschemes'
Plugin 'KeitaNakamura/neodark.vim'
Plugin 'sbdchd/neoformat'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Start
set nocompatible
syntax on
set nowrap
set encoding=utf8
set cindent

" Show linenumbers
set number
set ruler

" Stolen from Klas
set undofile                    " Use persistent undo
set undodir=~/.vimundo          " Stored here
set undolevels=2000             " Max number of changes that can be undone

set incsearch                   " Highlight pattern while searching
set hlsearch                    " Highlight matches of search```

augroup MyAutocommands
  autocmd!
  autocmd FileType c,rust set shiftwidth=4 tabstop=4
  autocmd FileType scala set shiftwidth=2 tabstop=2
augroup END

" Keybindings

" Disable Backspace in Insert mode
inoremap <BS> <Nop>
" Disable HL
noremap h <NOP>
noremap l <NOP>
" Use cargo fmt with +
nnoremap <silent> + :Neoformat<CR>

" Set Proper Tabs
set tabstop=4
set shiftwidth=2
set smarttab
set expandtab

set cin "Use C-style indentation
set ai  "Autoindent

" Always display the status line
set laststatus=2

" Theme and Styling 
colorscheme neodark

let g:neodark#use_custom_terminal_theme = 1 " default: 0
let g:neodark#background = '#202020'
let g:neodark#terminal_transparent = 1 " default: 0
let g:neodark#solid_vertsplit = 1 " default: 0

map <C-n> :NERDTreeToggle<CR>
set updatetime=250

" Rust specific
let g:autofmt_autosave = 1
set hidden
let g:racer_cmd = "/usr/bin/racer"

hi Normal guibg=NONE ctermbg=NONE
hi StatusLine ctermbg=NONE cterm=NONE
let g:airline_powerline_fonts = 1
