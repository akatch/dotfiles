"
" ~/.vimrc
"

" Automatically grab Vundle
if empty(glob('~/.vim/bundle/Vundle.vim'))
    silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    autocmd VimEnter * :PluginInstall
endif

"""""" Vundle stuff """"""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" My Plugins here:
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
"Plugin 'bling/vim-airline'
Plugin 'chase/vim-ansible-yaml'
Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-git'
Plugin 'airblade/vim-gitgutter'
Plugin 'plasticboy/vim-markdown'

call vundle#end()
filetype plugin indent on

" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"""""" End Vundle stuff """"""

if has("syntax")
    syntax on
endif

" Jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set autowrite
set background=dark
set cursorline nocursorcolumn
set expandtab
set hidden
set ignorecase
set incsearch
set mouse=r
set number
set scrolloff=2
set shiftwidth=4
set showcmd
set showmatch
set smartindent
set smartcase
set softtabstop=4
set tabstop=4
set ttyfast

" TODO: show full filename in statusline
" TODO: make commandline color6

" fix annoying search highlighting behavior
noremap <silent> <Space> :silent noh<Bar>echo<CR>

" tab like irssi
nmap <C-p> :tabprevious<cr>
nmap <C-n> :tabnext<cr>
nmap <C-t> :tabnew<cr>
nmap <A-p> :bufferprevious<cr>
nmap <A-n> :buffernext<cr>

" insert newline without entering insert mode
"nmap <silent> <S-Enter> O<esc><CR>
nmap <silent> <leader>o o<esc>

nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

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
set writebackup

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
colorscheme cyberpunklisafrank

" Highlight chars that go over the 80-column limit for certain filetypes
au FileType cpp match ErrorMsg '\%>80v.\+'
au FileType py match ErrorMsg '\%>80v.\+'
"au FileType yaml set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType yaml setlocal ai ts=2 sw=2 et

" Limit the line length for markdown
autocmd FileType markdown set tw=90 tabstop=2 softtabstop=2 shiftwidth=2 "or don't bc damn its annoying
autocmd FileType markdown setlocal spell
autocmd FileType sh set tabstop=4 softtabstop=4 shiftwidth=4

"
" Leader shortcuts
"

" source vimrc
nmap <leader>S :so $MYVIMRC<CR>

" Open Vimrc
nmap <leader>v :tabedit $MYVIMRC<CR>

" Toggle paste mode
set pastetoggle=<leader>p

" Open ScratchPad
nmap <leader>s :tabedit ~/SpiderOak\ Hive/scratchpad.md<cr>
nmap <leader>m :tabedit ~/documents/txt/notes.txt<cr>

" Toggle line numbers
nmap <leader>n :set number!<CR>

" Update Tags
if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        " Do Mac stuff here
        nnoremap <silent> <Leader>t :!/usr/local/bin/ctags -R -f ./.git/tags .<CR>
        " Yank text to OSX clipboard
        noremap <leader>y "*y
        noremap <leader>yy "*Y
        noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
    endif
else
    nnoremap <silent> <Leader>t :!ctags -R -f ./.git/tags .<CR>
endif

" Whitespace stuff
" Whitespace Highlight Toggle
"nnoremap <silent> <leader>w :AirlineToggleWhitespace<CR>
" And Strip it
nnoremap <silent> <leader>W :StripWhitespace<CR>

" Fix indentation
nnoremap <leader>= gg=G``

" Table Format (markdown files only)
"nnoremap <silent> <leader>T :TableFormat<CR>

" Toggle SemanticHighlighting
"nnoremap <silent> <Leader>h :SemanticHighlightToggle<CR>

" Tab align along = or :
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
    nmap <Leader>a> :Tabularize /=><CR>
    vmap <Leader>a> :Tabularize /=><CR>
endif

" TODO: statusbar - add git branch, full filename, current mode
