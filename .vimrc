
set whichwrap+=<,>,h,l,[,]
set ignorecase
set smartcase
set hlsearch
set magic
set showmatch
set mat=2
syntax enable
colorscheme desert
set background=dark
set encoding=utf8
set ffs=unix,dos,mac
set expandtab
set ai
set wrap
set nu
set hidden
nmap <S-Up> V
nmap <S-Down> V
vmap <S-Up> k
vmap <S-Down> j
imap <S-Up> <Esc> v <Up>
imap <S-Down> <Esc> v <Down>

if has("gui_running")
	inoremap <Esc> <Esc> `n
endif

set iskeyword+=$

