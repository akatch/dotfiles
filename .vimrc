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
Plugin 'scrooloose/nerdtree'
Plugin 'dense-analysis/ale'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'lervag/vimtex'
Plugin 'akatch/vim-oceans'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-scripts/todo-txt.vim'
" had to also `go get golang.org/x/tools/gopls`
call vundle#end()

filetype plugin indent on

if has("syntax")
    syntax on
endif

colorscheme oceans
set background=dark
set laststatus=2
set shiftwidth=4
set tabstop=4
set backspace=indent,eol,start
set fileformats=unix
set nocompatible nohlsearch ttyfast expandtab autoindent number cursorline nocursorcolumn incsearch

" Insert cursor at previous position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" State directories
for dir in [ 'backup', 'swap', 'undo' ]
    if !isdirectory($HOME . '/.vim/' . dir)
        call mkdir($HOME . '/.vim/' . dir, 'p')
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
nmap <silent> <leader>t :NERDTreeToggle<CR>
nmap <silent> <leader>h :so $VIMRUNTIME/syntax/hitest.vim<CR>
nmap <silent> <A-j> :ALENextWrap<CR>
nmap <silent> <A-k> :ALEPreviousWrap<CR>
nmap <silent> <A-d> :ALEDetail<CR>
nmap <silent> <leader>d :r!date "+\%F"<CR>
nmap <silent> <leader>z :VimtexView<CR>

" pane separators like tmux
set fillchars+=vert:\│

" ctrlp
let g:ctrlp_map = '<s-f>'
let g:ctrlp_switch_buffer = 'Et'

" ale
let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_json_jq_options = '--indent 4'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'elixir': ['mix_format'],
\   'javascript': ['prettier'],
\   'json': ['jq'],
\   'terraform': ['terraform'],
\}

let g:ale_linters = {
\    'go': ['gofmt', 'golint', 'go vet', 'gopls', 'golangci-lint'],
\    'ansible': ['ansible-lint'],
\    'elixir': ['elixir-ls'],
\    'perl': ['perlcritic'],
\    'terraform': ['terraform'],
\    'ruby': ['rubocop'],
\    'javascript': ['eslint'],
\    'bicep': ['bicep'],
\}

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

let g:ale_elixir_elixir_ls_release = expand("~/code/elixir-lsp/elixir-ls/rel")

" needs latexmk
let g:vimtex_view_method = 'zathura_simple'

" completion
set wildmode=longest,list,full
set wildmenu
