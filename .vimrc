set number
set linebreak	
set showbreak=+++
set textwidth=100
set showmatch	
set visualbell
set nocp
set cursorline
set scrolloff=10

set nrformats+=alpha

set autoread
set hidden
 
set hlsearch
set smartcase
set ignorecase	
set incsearch
set nojoinspaces
set formatoptions+=j
set shortmess-=S
 
set autoindent	
set shiftwidth=4	
set smartindent	
set smarttab
set softtabstop=4
set expandtab
 
set ruler	
 
set history=1000
set undolevels=1000	
set backspace=indent,eol,start	
set showcmd
set wildmenu

let mapleader="\\"

" ctags
set tags+=./tags;$HOME
nmap <leader>] :tab split <CR><c-]>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()

" YouCompleteMe
filetype plugin indent on
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files=1

nmap <leader>f <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>d :YcmCompleter GoToDeclaration<CR>
com Hgo execute "split | YcmCompleter GoToDeclaration"
com Vgo execute "vsplit | YcmCompleter GoToDeclaration"
com Tgo execute "tab split | YcmCompleter GoToDeclaration"

" Quickfix
nmap <leader>m :make<CR>
nmap <leader>j :cnext<CR>
nmap <leader>k :cprev<CR>
nmap <leader>c :copen<CR>

" Global clipboard
vmap <leader>y :w! /tmp/globalclipboard<CR>
nmap <leader>p :r /tmp/globalclipboard<CR>

" Status line
set laststatus=2
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Folds
set foldmethod=indent
set foldlevel=999
set foldignore=

" Vimdiff
hi DiffChange ctermfg=NONE ctermbg=DarkGrey

" Generic commands
nmap <leader>h :noh<CR>
nmap <leader>w :%s/\s\+$//e<CR>
nmap <leader>t :tab split<CR>
com Te execute "tab split | Explore"
com Gdiff execute "w !git diff --color=always --no-index -- % - | tail -n +3 | less -R"
com Mypy execute "!clear; mypy --strict %"

" Python
autocmd FileType python let &makeprg='mypy %'
autocmd FileType python nmap <c-]> :YcmCompleter GoToDeclaration<CR>

" Perl
autocmd FileType perl map ]] j0[[%/{<CR>
autocmd FileType perl map [[ ?{<CR>w99[{
autocmd FileType perl set shiftwidth=2
autocmd FileType perl set softtabstop=2
autocmd FileType perl set tabstop=2
