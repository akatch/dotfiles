"
" ~/.vimrc
"

" Vundle stuff
if empty(glob('~/.vim/bundle/Vundle.vim'))
    silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    autocmd VimEnter * :PluginInstall
endif

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'airblade/vim-gitgutter'
Plugin 'chase/vim-ansible-yaml'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/rbenv-ctags'
Plugin 'udalov/kotlin-vim'
call vundle#end()

filetype plugin indent on
autocmd Filetype yaml setlocal shiftwidth=2 tabstop=2
autocmd Filetype ansible setlocal shiftwidth=2 tabstop=2
autocmd Filetype ruby setlocal shiftwidth=2 tabstop=2
autocmd Filetype markdown setlocal shiftwidth=4 tabstop=4

if has("syntax")
    syntax on
endif

colorscheme oceans
set background=dark laststatus=2
set nocompatible ignorecase nohlsearch ttyfast expandtab autoindent number cursorline nocursorcolumn

" Insert cursor at previous position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" State directories
for dir in [ 'backup', 'swap', 'undo' ]
    if isdirectory($HOME . '/.vim/' . dir) == 0
        :silent !mkdir -p ~/.vim/{dir} >/dev/null 1>&1
    endif
endfor

set backupdir^=~/.vim/backup/
set directory^=~/.vim/swap/
set undodir^=~/.vim/undo/
set backup writebackup undofile

" Keybinds
nmap <C-p> :tabprevious<cr>
nmap <C-n> :tabnext<cr>
nmap <C-t> :tabnew<cr>

nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <silent> <leader>n :set number!<CR>
nmap <silent> <leader>p :set paste!<CR>
nmap <silent> <leader>t :0tabe ~/sync/todo.txt<CR>
nmap <silent> <leader>r :so ~/.vimrc<CR>
nmap <silent> <leader>v :tabe ~/.vimrc<CR>
nmap <silent> <leader>W :StripWhitespace<CR>
nmap <silent> <leader>h :so $VIMRUNTIME/syntax/hitest.vim<CR>
nmap <silent> <leader>c :color oceans<CR>
