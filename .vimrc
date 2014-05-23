"
" ~/.vimrc
"

runtime! debian.vim

"""""" Vundle stuff """"""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" pathogen
"call pathogen#infect() 

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle "bling/vim-airline"
Bundle "chase/vim-ansible-yaml"

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"""""" End Vundle stuff """"""

" Vim5 and later versions support syntax highlighting. Uncommenting the following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Load indentation rules and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

"The following are commented out as they cause vim to behave a lot differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set hidden         " Hide buffers when they are abandoned
set autowrite		" Automatically save before commands like :next and :make
set showmatch		" Show matching brackets.
set mouse=r		    " Enable mouse usage (all modes)
set smartindent     " indent smartly yo
set tabstop=4	    " tabs are 4 chars wide
set shiftwidth=4    " shifts are 4 chars wide
set expandtab		" tabs become spaces so retain size
set background=dark " use color scheme appropriate for dark bg
set pastetoggle=<C-o>

" tab like irssi (and Chrome/Firefox)
:nmap <C-p> :tabprevious<cr>
:nmap <C-n> :tabnext<cr>
:nmap <C-t> :tabnew<cr>
:nmap <C-w> :tabclose<cr>

" use F6 for pastetoggle
set pastetoggle=<C-o>

" show line numbers
set number  

" Use favorite color scheme
colorscheme relaxedgreen

" Highlight chars that go over the 80-column limit for certain filetypes
au FileType cpp       match ErrorMsg '\%>80v.\+' 
au FileType py        match ErrorMsg '\%>80v.\+' 
au FileType yaml set tabstop=2|set shiftwidth=2|set expandtab

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

