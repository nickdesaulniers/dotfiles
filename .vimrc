syntax on
"set background=dark
"" solarized options
"let g:solarized_termcolors = 256
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"colorscheme solarized
colorscheme vividchalk
"colorscheme jellybeans
au BufRead,BufNewFile *.jsm setf javascript
au BufNewFile,BufRead *.r,*.R setf r
"au BufNewFile,BufRead *.rs,*.rc setf rust

set number
set laststatus=2
set noerrorbells
set cc=80
hi ColorColumn guibg=darkred ctermbg=darkred

set expandtab
set tabstop=2
set shiftwidth=2

highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
if version >= 702
  autocmd BufWinLeave * call clearmatches()
endif

" vundle
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'pangloss/vim-javascript'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
filetype plugin indent on     " required!

" Hotkeys
map <silent> <C-b> :CoffeeCompile<CR>
let mapleader = ','
map cc <leader>c<space>

