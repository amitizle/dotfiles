call plug#begin()
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'jacoborus/tender.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'itchyny/vim-haskell-indent', { 'for' : 'haskell' }
Plug 'elixir-lang/vim-elixir', { 'for' : 'elixir'}
Plug 'slashmili/alchemist.vim', { 'for' : 'elixir'}
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for' : 'erlang' }
Plug 'vim-erlang/vim-erlang-skeletons', { 'for' : 'erlang' }
Plug 'vim-erlang/vim-erlang-runtime', { 'for' : 'erlang' }
Plug 'tpope/vim-fugitive'
Plug 'lfe/vim-lfe'
Plug 'vim-ruby/vim-ruby', { 'for' : 'ruby'}
Plug 'vitalk/vim-simple-todo'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/matchit'
Plug 'fatih/vim-go', { 'for' : 'go' }
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'rust-lang/rust.vim', { 'for' : 'rust' }
Plug 'hashivim/vim-terraform', { 'for' : 'terraform' }
Plug 'roxma/nvim-completion-manager' " completion engine
Plug 'vim-airline/vim-airline' " airline
Plug 'vim-airline/vim-airline-themes'

autocmd! User vim-elixir echom 'vim-elxir loaded!'
autocmd! User vim-go echom 'vim-go loaded!'
autocmd! User rust.vim echom 'Rust plugin loaded!'
call plug#end()

" Look & feel, truecolor and solarized colorscheme
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=dark
colorscheme solarized8_dark_flat
syntax enable
set scrolloff=8         "Start scrolling when we're 8 lines away from margins

" airline
" AirlineTheme solarized_flood
let g:airline_symbols = {}
let g:airline_theme='base16_solarized'
let g:airline_powerline_fonts = 1

" General settings
set shell=/usr/local/bin/zsh
set history=700
set ruler
set number
filetype plugin on
filetype indent on
let mapleader = ","

" backup files (~) in a common location if possible
set backup
set backupdir=~/.vim/_backup/

set wildmenu
set cmdheight=2
set encoding=utf8
set ffs=unix,dos,mac
set noswapfile

" Search
set smartcase
set hlsearch
set incsearch
set showmatch

" Spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set backspace=2
set laststatus=2

" Long lines => continue on next line on screen
set wrap
set linebreak
set showbreak=">"

" Remove trailing spaces on save (w)
autocmd BufWritePre * :%s/\s\+$//e

" File types and specific languages overrides
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType erlang setlocal shiftwidth=4 tabstop=4
au BufRead,BufNewFile *.wiki setfiletype dokuwiki
au BufRead,BufNewFile *.config.script setfiletype erlang
au BufRead,BufNewFile *.config setfiletype erlang
au BufRead,BufNewFile *.app setfiletype erlang
au BufRead,BufNewFile *.app.src setfiletype erlang
au BufRead,BufNewFile *.app.src.script setfiletype erlang
au BufRead,BufNewFile *.xrl setfiletype erlang
au BufRead,BufNewFile *.yrl setfiletype erlang
au BufRead,BufNewFile *.ex setfiletype elixir
au BufRead,BufNewFile *.exs setfiletype elixir

" Go
let g:go_highlight_types = 1 " This is part of vim-go
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" Terraform
" call terraform fmt on save
let g:terraform_fmt_on_save = 1

" maps
map <C-n> :NERDTreeToggle<CR>
