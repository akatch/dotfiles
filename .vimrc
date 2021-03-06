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
Plugin 'airblade/vim-gitgutter'
Plugin 'chase/vim-ansible-yaml'
Plugin 'scrooloose/nerdtree'
Plugin 'dense-analysis/ale'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'
call vundle#end()

filetype plugin indent on
autocmd Filetype yaml,ansible,ruby setlocal shiftwidth=2 tabstop=2

if has("syntax")
    syntax on
endif

colorscheme oceans
set background=dark laststatus=2
set nocompatible ignorecase nohlsearch ttyfast expandtab autoindent number cursorline nocursorcolumn incsearch
set shiftwidth=4 tabstop=4
set backspace=indent,eol,start

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
nmap <silent> <C-p> :tabprevious<cr>
nmap <silent> <C-n> :tabnext<cr>
nmap <silent> <C-t> :tabnew<cr>

nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <silent> <leader>n :set number!<CR>
nmap <silent> <leader>p :set paste!<CR>
" show/hide nerdtree
nmap <silent> <leader>t :NERDTreeToggle<CR>
nmap <leader>r :so ~/.vimrc<CR>
nmap <silent> <leader>v :tabe ~/.vimrc<CR>
nmap <silent> <leader>W :StripWhitespace<CR>
nmap <silent> <leader>h :so $VIMRUNTIME/syntax/hitest.vim<CR>
nmap <silent> <leader>c :color oceans<CR>
nmap <silent> <A-j> :ALENextWrap<CR>
nmap <silent> <A-k> :ALEPreviousWrap<CR>
nmap <silent> <A-d> :ALEDetail<CR>

" pane separators like tmux
set fillchars+=vert:\│

" ctrlp
let g:ctrlp_map = '<s-f>'
let g:ctrlp_switch_buffer = 'Et'

" vim-better-whitespace
let g:better_whitespace_filetypes_blacklist=['mail']
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0
let g:strip_whitelines_at_eof=1
"let g:better_whitespace_ctermcolor='214'

" ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\}

" FIXME why doesn't this work?
let g:ale_linters = {'go': ['gofmt', 'golint', 'go vet', 'gopls'],}
" TODO j2-lint integration
" TODO new panes bottom / right
" TODO middle click = set paste/insert/set nopaste

"vim-go stuff
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_doc_url = "https://pkg.go.dev"

" completion
set wildmode=longest,list,full
set wildmenu
