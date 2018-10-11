
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
autocmd FileType perl set cinkeys=0{,0},0),0#,!<Tab>,;,:,o,O,e
autocmd FileType perl set indentkeys=!<Tab>,o,O
autocmd FileType perl map <Tab> i<Tab><Esc>^
autocmd FileType perl set cinoptions=:0,(0,u0,W1s
autocmd FileType perl nnoremap <M-j> i<TAB>print "\n";<ESC>$hhhi
autocmd FileType perl inoremap <M-j> <TAB>print "\n";<ESC>$hhhi
autocmd FileType perl vnoremap <M-j> <ESC>i<TAB>print "\n";<ESC>$hhhi
autocmd FileType perl set shiftwidth=2
autocmd FileType perl set softtabstop=2

if has('unix')
  autocmd FileType perl nnoremap j i<TAB>print "\n";<ESC>$hhhi
  autocmd FileType perl inoremap j <TAB>print "\n";<ESC>$hhhi
  autocmd FileType perl vnoremap j <ESC>i<TAB>print "\n";<ESC>$hhhi
endif

autocmd FileType python set autoindent nosmartindent
autocmd FileType python set smarttab
autocmd FileType python set expandtab
autocmd FileType python set shiftwidth=4
autocmd FileType python set softtabstop=4
