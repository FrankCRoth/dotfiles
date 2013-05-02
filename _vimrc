" Automatic relading of .vimrc
autocmd! bufwritepost .vimrc source %

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unamed

" Mouse and backspace
set mouse=a	" on OSX press Alt and click
set bs=2	" make backspace behave like normal again

" Rebind <Leader> key
let mapleader = ","

" Bind nohl
" Remove higlight of your last search
noremap <C-n> : nohl<CR>
inoremap <C-n> :nohl<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moveing between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv 	" better indentation
vnoremap > >gv	" better indentation
 
" Show whitespace
" Must be inserted BEFORE the colorschema command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" Showing line numbers on length
set number	" show line numbers
set tw=79	" widht of document (used by gd)
set nowrap	" don't automatically wrap on load
set fo-=t	" don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
vmap Q qq
nmap + gqap

" Useful settings
set history=700
set undolevels=700

" Real programmers son't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable suptid backup and swpa files - they trigger too many events
" for file system watchers
" set nobackup
" set nowritebackup
" set noswapfile

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~./vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autload/pathogen.vim
call pathogen#infect()

" ==========================
" Python IDE Setup
" ==========================

" Settings for vim-powerLine
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/powerline.git
" source ~/.vim/bundle/powerline/powerline/ext/vim/source_plugin.vim
set laststatus=2

" Settins for ctrlp
" cd ~./vim/bundle
" git clone git://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height=30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
