call plug#begin()

"""""""""
" Tools "
"""""""""
Plug 'tpope/vim-surround'
Plug 'tmhedberg/matchit'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'

""""""""""""""
" todo lists "
""""""""""""""
Plug 'vitalk/vim-simple-todo', { 'for': 'todo' }

"""""""""""""""
" Look & feel "
"""""""""""""""
Plug 'vim-airline/vim-airline' " airline
Plug 'vim-airline/vim-airline-themes'
Plug 'lifepillar/vim-solarized8'

"""""""""""""
" Terraform "
"""""""""""""
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

"""""""""""
" Haskell "
"""""""""""
Plug 'itchyny/vim-haskell-indent', { 'for': 'haskell' }

"""""""
" LFE "
"""""""
Plug 'lfe-support/vim-lfe', {'for': 'lfe'}

""""""""""
" Erlang "
""""""""""
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-skeletons', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }

""""""""
" Rust "
""""""""
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

""""""""""""
" Markdown "
""""""""""""
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer'), 'for': 'markdown' }

""""""""""""""""
" Autocomplete "
""""""""""""""""
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

""""""""""""
" Snippets "
""""""""""""
Plug 'SirVer/ultisnips' " engine
Plug 'honza/vim-snippets' " snippets

""""""
" Go "
""""""
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go'} " requires go get -u github.com/nsf/gocode
Plug 'fatih/vim-go', { 'for' : 'go' }
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'sebdah/vim-delve', { 'for' : 'go' } " requires go get -u github.com/derekparker/delve/cmd/dlv

"""""""""
" Scala "
"""""""""
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins', 'for' : 'scala' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala'}

""""""""
" Ruby "
""""""""
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'haml', 'eruby'] }
Plug 'fishbullet/deoplete-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }

""""""""""
" Elixir "
""""""""""
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir'}
Plug 'slashmili/alchemist.vim', { 'for': 'elixir'}

call plug#end()

" Look & feel, truecolor and solarized colorscheme
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=dark
colorscheme solarized8_dark_flat
syntax enable
highlight clear Comment
highlight Comment guifg=#5E5E5E
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
au BufRead,BufNewFile *.lfe setfiletype lfe
au BufRead,BufNewFile *.todo setfiletype todo
" Run python -m json.tool after saving json files
autocmd BufWritePost *.json %!python -m json.tool

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

" git gutter
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_enabled = 1

" autocomplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const'] " Go
let g:deoplete#sources#go#pointer = 1

" fuzzy
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
let g:fzf_command_prefix = 'Fzf'
if executable('fzf')
  nnoremap <leader>v :FzfFiles<cr>
  nnoremap <leader>u :FzfTags<cr>
  nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'))<cr>
endif

" snippets
let g:UltiSnipsExpandTrigger="<tab>"

" Go delve mapping
map <leader>b :DlvToggleBreakpoint<CR>
map <leader>n :DlvToggleTracepoint<CR>
