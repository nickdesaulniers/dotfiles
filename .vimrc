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

" set language highlighting for certain file extensions
au BufNewFile,BufRead *.jsm setf javascript
au BufNewFile,BufRead *.r,*.R setf r
au BufNewFile,BufRead *.vert,*.frag,*.glsl setf glsl
au BufNewFile,BufRead *.rs,*.rc setf rust

set number
set laststatus=2
set noerrorbells
set expandtab
set tabstop=2
set shiftwidth=2

" highlight line 80 in red
set cc=80
hi ColorColumn ctermbg=darkred

" highlight trailing whitespace in red
hi ExtraWhitespace ctermbg=darkred
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/

" highlight tabs in yellow
hi Tabs ctermbg=yellow
call matchadd('Tabs', '\t')
au BufWinEnter * call matchadd('Tabs', '\t')

if version >= 702
  au BufWinLeave * call clearmatches()
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
"Bundle 'pangloss/vim-javascript'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
Bundle 'nickdesaulniers/sparkup'
Bundle 'Rip-Rip/clang_complete'
Bundle 'xaizek/vim-inccomplete'
Bundle 'leafgarland/typescript-vim'
Bundle 'jason0x43/vim-js-indent'
filetype plugin indent on     " required!

" Hotkeys
" `cc` to compile CoffeeScript and show in another buffer
map <silent> <C-b> :CoffeeCompile<CR>
let mapleader = ','
map cc <leader>c<space>

" For clang_complete
set completeopt-=preview
" found by running clang++ -x c++ -v -E /dev/null
" and clang++ -x c++ -v -E /dev/null -stdlib=libc++
let g:clang_user_options = '-I/usr/include/c++/4.2.1'
let g:clang_user_options .= ' -I/usr/include/c++/4.2.1/backward'
let g:clang_user_options .= ' -I/usr/local/include/c++/v1'
let g:clang_user_options .= ' -I/usr/local/include'
let g:clang_user_options .= ' -I/usr/local/lib/clang/3.7.0/include'
let g:clang_user_options .= ' -I/usr/include'
let g:clang_user_options .= ' -I/System/Library/Frameworks'
let g:clang_user_options .= ' -I/Library/Frameworks'

