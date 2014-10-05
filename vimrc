" Enable Vim settings
set nocompatible

" local settings
set autoindent
set autoread
set expandtab
set hlsearch
set incsearch
set list
set listchars=tab:>-,trail:-,nbsp:.
set noignorecase
set nu
set shiftwidth=2
set showcmd
set smartindent
set softtabstop=2
set tabstop=2
set tags=./tags,tags;/,./rtags,rtags;/
set whichwrap+=<,>

" enables indentation for open file type
filetype on
filetype plugin on
filetype indent on

" enables syntax highlights
syntax enable

" Tabs and Windows
nmap tn :tabnew<CR>:tag 
nmap ts :vsplit<CR>:tag 
nmap sp :vsplit 
nmap nt :NERDTree<CR>

" For easy code browsing
nmap  g
nmap qw :grep '\<<cword>\>'<CR><CR>:cw <CR>

set wildmenu
set wildmode=longest,list
set wildignore+=*.class
set wildignore+=*.o,*.out

" Enable status line
set laststatus=2

" Scrolling
set scrolloff=8

" swp directory
set dir=~/.vim/swpfiles//

" set vim path
set path=.,/usr/include,,**

" set code browsing shortcuts
imap <S-TAB> f,w
nmap <S-TAB> f,w
vmap <S-TAB> f,w

" pesistent undo for version >= 7.3
if version >= 703
    set undodir=~/.vim/undos
    set undofile
    set undoreload=150 "maximum number lines to save for undo on a buffer reload
    set undolevels=50 "maximum number of changes that can be undone
endif


" filename completion
set isfname=@,48-57,/,.,-,_,$,~
