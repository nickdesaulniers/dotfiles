" syntax highlighting
syntax on
colorscheme vividchalk

" set language highlighting for certain file extensions
au BufNewFile,BufRead *.jsm setf javascript
au BufNewFile,BufRead *.r,*.R setf r
au BufNewFile,BufRead *.vert,*.frag,*.glsl setf glsl
au BufNewFile,BufRead *.rs,*.rc setf rust
au BufNewFile,BufRead *.md setf markdown

" spellcheck txt files
au BufNewFile,BufRead *.txt set spell
au BufNewFile,BufRead CMakeLists.txt set nospell

" use `:help key` to for more info
set number
" maybe obsolete with airline?
set laststatus=2
set visualbell
" convert tab key to spaces, otherwise use ctrl+v <tab>
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
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script.git'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rstacruz/sparkup'
Plugin 'xaizek/vim-inccomplete'
Plugin 'jason0x43/vim-js-indent'
Plugin 'majutsushi/tagbar'
call vundle#end()
filetype plugin indent on

" Hotkeys
" `ctrl b` to compile CoffeeScript and show in another buffer
"map <silent> <C-b> :CoffeeCompile<CR>

" nerd commenter, cc to comment out/in lines
let mapleader = ','
map cc <leader>c<space>

" speed up ctrl-p plugin using ag
set wildignore+=*.dylib,*.so,*.swp,*.zip
if executable("ag")
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ -g ""'
endif

" tagbar
" Open tagbar window with ,b
nmap <leader>b :TagbarToggle<CR>

"ctrlp
" Open ctrlp with ,v
nmap <leader>v :CtrlPTag<CR>

"movements
" jj to escape back from insert mode
inoremap jj <Esc>
" disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

