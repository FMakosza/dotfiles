set number
set linebreak
set showbreak=+++
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
set timeoutlen=5000

" ctags
set tags+=./tags;$HOME
nmap <leader>] :vsplit <CR><c-w>p<c-]>

if isdirectory(expand('~')..'/.vim/bundle')
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'
  Plugin 'ycm-core/YouCompleteMe'
  Plugin 'ap/vim-buftabline'

  call vundle#end()
endif

" YouCompleteMe
filetype plugin indent on
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files=1

nmap <leader>f <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>d :YcmCompleter GoToDeclaration<CR>
" Ctrl-w z to close
com Doc execute "YcmCompleter GetDoc"
com Hgo execute "split | wincmd p | YcmCompleter GoToDeclaration"
com Vgo execute "vsplit | wincmd p | YcmCompleter GoToDeclaration"
com Tgo execute "tab split | YcmCompleter GoToDeclaration"

" tmux
vmap <leader>yt :w !tmux load-buffer -<CR>

" Quickfix
nmap <leader>m :make<CR>
nmap <leader>cj :cnext<CR>
nmap <leader>ck :cprev<CR>
nmap <leader>co :copen<CR>

" Global clipboard
vmap <leader>yg :w! /tmp/globalclipboard<CR>
nmap <leader>pg :r /tmp/globalclipboard<CR>

" Status line
set laststatus=2
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Folds
set foldmethod=indent
set foldlevel=999
set foldignore=

" Vimdiff
hi DiffChange ctermfg=NONE ctermbg=LightGrey

if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif

" Buffers
nmap <leader>b :b#<CR>
nmap <leader>t :bnext<CR>
nmap <leader>T :bprevious<CR>
com Bd execute "bprevious | bdelete #"

" Generic commands
" write successfully on both :w and :W
com W execute "w"
com Q execute "q"
" disable highlighting
nmap <leader>h :noh<CR>
" strip trailing whitespace
nmap <leader>w :%s/\s\+$//e<CR>
nmap <leader>cc :set cursorcolumn!<CR>

com Te execute "tab split | Explore"
com Gdiff execute "w !git diff --color=always --no-index -- % - | tail -n +3 | less -R"
com Mypy execute "!clear; mypy --strict %"

" Python
autocmd FileType python let &makeprg='mypy %'

" Perl
autocmd FileType perl map ]] j0[[%/{<CR>
autocmd FileType perl map [[ ?{<CR>w99[{
autocmd FileType perl set shiftwidth=2
autocmd FileType perl set softtabstop=2
autocmd FileType perl set tabstop=2
