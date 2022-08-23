set number
set linebreak	
set showbreak=+++
set textwidth=100
set showmatch	
set visualbell
set nocp
 
set hlsearch
set smartcase
set ignorecase	
set incsearch
 
set autoindent	
set shiftwidth=4	
set smartindent	
set smarttab
set softtabstop=4
 
set ruler	
 
set undolevels=1000	
set backspace=indent,eol,start	

let mapleader="\\"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()
filetype plugin indent on
let g:ycm_autoclose_preview_window_after_completion=1

nmap <leader>f <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>d :YcmCompleter GoToDeclaration<CR>
set showcmd

nmap <leader>j :cnext<CR>
nmap <leader>k :cprev<CR>
nmap <leader>c :copen<CR>
vmap <leader>y :w! /tmp/vimclipboard<CR>
nmap <leader>p :r! cat /tmp/vimclipboard<CR>

set laststatus=2
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
com Gdiff execute "w !git diff --color=always --no-index -- % - | tail -n +3 | less -R"
com Hgo execute "split | YcmCompleter GoToDeclaration"
com Vgo execute "vsplit | YcmCompleter GoToDeclaration"
com Tgo execute "tab split | YcmCompleter GoToDeclaration"
com Mypy execute "!clear; mypy --strict %"

autocmd FileType python let &makeprg='mypy %'
nmap <leader>m :make<CR>
