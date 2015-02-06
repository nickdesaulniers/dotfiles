syntax on
"set background=dark
"" solarized options
"let g:solarized_termcolors = 256
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"colorscheme solarized
colorscheme vividchalk
"colorscheme jellybeans
"colorscheme lettuce
au BufRead,BufNewFile *.jsm setf javascript
au BufNewFile,BufRead *.r,*.R setf r
" require syntax files
au BufNewFile,BufRead *.vert,*.frag,*.glsl setf glsl
au BufNewFile,BufRead *.rs,*.rc setf rust

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
""<se<C-x><C-o>
"Bundle 'othree/html5.vim'
"Bundle 'jgallen23/sparkup'
"section<C-e>
Bundle 'nickdesaulniers/sparkup'
Bundle 'Rip-Rip/clang_complete'
Bundle 'xaizek/vim-inccomplete'
filetype plugin indent on     " required!

" Hotkeys
map <silent> <C-b> :CoffeeCompile<CR>
"imap <silent> <C-c> </<C-X><C-O> " hmm
let mapleader = ','
map cc <leader>c<space>

" For clang_complete
set completeopt-=preview

