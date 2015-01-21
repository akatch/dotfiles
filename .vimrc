"
" ~/.vimrc
"

"""""" Vundle stuff """"""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'mtth/scratch.vim'
Bundle 'godlygeek/tabular'
Bundle 'bling/vim-airline'
Bundle 'chase/vim-ansible-yaml'
Bundle 'ntpeters/vim-better-whitespace'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'airblade/vim-gitgutter'
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-sensible'

filetype plugin indent on

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"""""" End Vundle stuff """"""

if has("syntax")
  syntax on
endif

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"set hidden         " Hide buffers when they are abandoned
set autowrite
set showmatch
set smartindent
set background=dark
set showcmd
set ignorecase
set smartcase
set incsearch
set scrolloff=2
set number
set undofile
set backup
set writebackup
set ttyfast
set mouse=r
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set breakindent

" tab like irssi
nmap <C-p> :tabprevious<cr>
nmap <C-n> :tabnext<cr>
nmap <C-t> :tabnew<cr>

" insert newline without entering insert mode
nmap <S-Enter> O<esc>

" Save backup to first available of:
" ./.vim-backup/
" ~/.vim/backup/
" ./
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 1>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save swpfiles to first available of:
" ./.vim-swap/
" ~/.vim/swap/
" ~/tmp/
" .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" Use favorite color scheme
colorscheme relaxedgreen

" Highlight chars that go over the 80-column limit for certain filetypes
au FileType cpp       match ErrorMsg '\%>80v.\+'
au FileType py        match ErrorMsg '\%>80v.\+'
au FileType yaml set tabstop=2|set shiftwidth=2|set expandtab

" Limit the line length for markdown
autocmd FileType markdown set tw=80
autocmd FileType markdown setlocal spell
autocmd FileType markdown set tabstop=2
autocmd FileType markdown set softtabstop=2
autocmd FileType markdown set shiftwidth=2
autocmd FileType markdown set expandtab

"
" Leader shortcuts
"

" Open Vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" Toggle paste mode
set pastetoggle=<leader>p

" Open ScratchPad
nmap <leader>s :tabedit ~/documents/Dropbox/Scratchpad.md<cr>

" Turn off and on numbers
nmap <leader>n :set number!<CR>

" Update Tags
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    nnoremap <silent> <Leader>t :!/usr/local/bin/ctags -R -f ./.git/tags .<CR>
  endif
else
  nnoremap <silent> <Leader>t :!ctags -R -f ./.git/tags .<CR>
endif

" Whitespace stuff
" Whitespace Highlight Toggle
nnoremap <silent> <leader>w :AirlineToggleWhitespace<CR>
" And Strip it
nnoremap <silent> <leader>W :StripWhitespace<CR>

" prettify
nnoremap <leader>= gg=G``

" Table Format (markdown files only)
nnoremap <silent> <leader>T :TableFormat<CR>

" Toggle SemanticHighlighting
nnoremap <silent> <Leader>h :SemanticHighlightToggle<CR>

" Tab align along = or :
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
  nmap <Leader>a> :Tabularize /=><CR>
  vmap <Leader>a> :Tabularize /=><CR>
endif

"vim-airline stuff
let g:airline_theme = 'murmur'
let g:airline_powerline_fonts = 1
set laststatus=2

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

"" powerline symbols
" To get these to work in debian you must:
    " 1. acquire powerline fonts:
    "    git clone https://github.com/powerline/fonts.git
    "    cp fonts/* ~/.fonts/
    " 2. disable bitmap fonts:
    "    sudo dpkg-reconfigure fontconfig-config
    "    answer "yes" to the third question
    "    restart X

"" these are the defaults
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
