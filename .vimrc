
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

filetype indent on
autocmd filetype perl set cinkeys=0{,0},0),0#,!<Tab>,;,:,o,O,e
autocmd FileType perl set indentkeys=!<Tab>,o,O
autocmd FileType perl map <Tab> i<Tab><Esc>^
autocmd FileType perl set cinoptions=:0,(0,u0,W1s

autocmd filetype python set autoindent nosmartindent
autocmd filetype python set smarttab
autocmd filetype python set expandtab
autocmd filetype python set shiftwidth=4
autocmd filetype python set softtabstop=4
