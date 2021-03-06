call plug#begin()

"""""""""
" Tools "
"""""""""
Plug 'tpope/vim-surround'
Plug 'tmhedberg/matchit'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired' " mostly for ]n and [n for next conflict in scm diff
" Buffer explorer, 'be' (normal open) or 'bt' (toggle open / close)
" or 'bs' (force horizontal split open) or 'bv' (force vertical split open)
Plug 'jlanzarotta/bufexplorer'
Plug 'blindFS/vim-reveal'
Plug 'jremmen/vim-ripgrep'
Plug 'Yggdroot/indentLine'

"""""""""""
" Writing "
"""""""""""
Plug 'junegunn/goyo.vim'

""""""""""""""""""""""""
" linters & completion "
""""""""""""""""""""""""
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-go'
" Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

"""""""
" HCL "
"""""""
Plug 'jvirtanen/vim-hcl' " syntax highlight
Plug 'fatih/vim-hclfmt' " go get github.com/fatih/hclfmt

""""""""""""""""""""
" Typescript && JS "
""""""""""""""""""""
" REQUIRED: Add a syntax file. YATS is the best
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', { 'for': 'typescript', 'do': './install.sh'}
" Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'pangloss/vim-javascript', {'for': ['typescript', 'javascript']}
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'ianks/vim-tsx', {'for': ['react']}
Plug 'othree/yajs.vim', {'for': 'javascript'}

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
Plug 'ryanoasis/vim-devicons'
Plug 'godlygeek/tabular'


" Themes
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim'

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
Plug 'racer-rust/vim-racer', { 'for': 'rust' }

"""""""""
" Nginx "
"""""""""
Plug 'chr4/nginx.vim', {'for': 'nginx'}

""""""""""""
" Snippets "
""""""""""""
Plug 'SirVer/ultisnips' " engine
Plug 'honza/vim-snippets' " snippets

""""""
" Go "
""""""
Plug 'fatih/vim-go', { 'for' : 'go' }
Plug 'sebdah/vim-delve', { 'for' : 'go' } " requires go get -u github.com/derekparker/delve/cmd/dlv

""""""""
" Ruby "
""""""""
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'haml', 'eruby'] }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }

""""""""""
" Elixir "
""""""""""
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

""""""""
" TOML "
""""""""
Plug 'cespare/vim-toml', { 'for' : 'toml' }

""""""""""""
" Markdown "
""""""""""""
Plug 'plasticboy/vim-markdown'

call plug#end()

" deoplete
let g:deoplete#enable_at_startup = 1

" typescript
let g:nvim_typescript#default_mappings = 0
let g:nvim_typescript#type_info_on_hold = 1
" g:nvim_typescript#server_path = 'yarn tsserver'
let g:nvim_typescript#diagnostics_enable = 0

" Neovim things
let g:python3_host_prog = "/usr/bin/python3"

" Look & feel, truecolor and solarized colorscheme
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set guicursor=
set background=dark
" colorscheme solarized8_flat
colorscheme nord
syntax enable
highlight clear Comment
highlight Comment guifg=#5E5E5E
set scrolloff=8         "Start scrolling when we're 8 lines away from margins

" airline
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_theme='base16_nord'

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" General settings
set shell=/usr/local/bin/zsh
set history=700
set ruler
set number
filetype plugin on
filetype indent on
let mapleader = ","
set foldmethod=syntax " fold by syntax
set foldlevelstart=20

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
set cindent
set backspace=2
set laststatus=2

" Long lines => continue on next line on screen
set wrap
set linebreak
set showbreak=">"

" Remove trailing spaces on save (w)
autocmd BufWritePre * :%s/\s\+$//e

" spelling
set spelllang=en_us
hi SpellBad cterm=bold
" set spell

" File types and specific languages overrides
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType erlang setlocal shiftwidth=4 tabstop=4
autocmd FileType typescript nnoremap gd :TSDef <CR>
autocmd FileType typescript nnoremap gD :TSDefPreview <CR>
autocmd FileType typescript nnoremap gf :TSType <CR>
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
au BufRead,BufNewFile Dockerfile.* setfiletype dockerfile
au BufRead,BufNewFile *.bp setfiletype hcl
au BufRead,BufNewFile *.tsx setfiletype react

" ale linter
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver'],
\}

let g:ale_fix_on_save = 0

" Go
let g:go_highlight_types = 1 " This is part of vim-go
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_parameters = 1
let g:go_auto_sameids = 1 " highlight the variable when cursor is on it
let g:go_fmt_command = "goimports" " auto import packages
let g:go_auto_type_info = 1 " show type info on status line
let g:go_updatetime = 700
let g:go_addtags_transform = "snakecase"
let g:go_build_tags = 'release'
" let g:go_def_mode = 'godef'
let g:go_disable_autoinstall=0
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'goimports', 'errcheck']
let g:go_metalinter_deadline = "2s"
let g:go_metalinter_autosave = 1
let g:go_list_type = "quickfix"
let g:go_fmt_fail_silently = 1
let g:go_list_height=6 " suggestions/error list should be lower
let g:go_jump_to_error=0 " Don't jump to errors on save
let g:go_echo_command_info=0 " Don't show errors, for example gometalinter FAIL errors

" reveal.js
let g:reveal_config = { 'filename': 'index', 'theme': 'solarized' }

" Terraform
" call terraform fmt on save
let g:terraform_fmt_on_save = 1

" maps
map <C-n> :NERDTreeToggle<CR>

" NERDTree
let NERDTreeShowHidden=1

" git gutter
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_enabled = 1

" fuzzy
let g:fzf_action = { 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
let g:fzf_command_prefix = 'Fzf'
nnoremap <c-p> :FZF<cr>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" Rust
let g:racer_cmd = "/home/amit/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" Go delve mapping
map <leader>b :DlvToggleBreakpoint<CR>
map <leader>n :DlvToggleTracepoint<CR>

" JSON
" Command to tidy json formatted file
" this also sorts keys (alpha-numeric sort)
" Usage: :FormatJSON
com! FormatJSON %!python -m json.tool

" ack.vim => the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
