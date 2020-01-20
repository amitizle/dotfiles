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
Plug 'tomtom/tcomment_vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-unimpaired' " mostly for ]n and [n for next conflict in scm diff
" Buffer explorer, 'be' (normal open) or 'bt' (toggle open / close)
" or 'bs' (force horizontal split open) or 'bv' (force vertical split open)
Plug 'jlanzarotta/bufexplorer'
" DB client
Plug 'tpope/vim-dadbod'
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}

"""""""""""""""""""""""
" linters & structure "
"""""""""""""""""""""""
Plug 'w0rp/ale'

""""""""""""""""""""
" Typescript && JS "
""""""""""""""""""""
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}

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
Plug 'joshdick/onedark.vim'

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
" Markdown "
""""""""""""
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
  endif
endfunction

" Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer'), 'for': 'markdown' }

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

"""""""""
" LaTex "
"""""""""
Plug 'lervag/vimtex', { 'for' : ['tex', 'sty'] }

""""""""
" TOML "
""""""""
Plug 'cespare/vim-toml', { 'for' : 'toml' }

call plug#end()

" Neovim things
let g:python3_host_prog = "/usr/bin/python3"

" Look & feel, truecolor and solarized colorscheme
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set guicursor=
set background=dark
" colorscheme solarized8_flat
colorscheme onedark
syntax enable
highlight clear Comment
highlight Comment guifg=#5E5E5E
set scrolloff=8         "Start scrolling when we're 8 lines away from margins

" airline
let g:airline_symbols = {}
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

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
au BufRead,BufNewFile Dockerfile.* setfiletype dockerfile

" ale linter
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

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
let g:go_auto_type_info = 0 " don't show type info on status line
let g:go_updatetime = 700
let g:go_addtags_transform = "snakecase"
let g:go_build_tags = 'release'
let g:go_def_mode = 'godef'
let g:go_disable_autoinstall=0
" let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'goimports', 'errcheck']
let g:go_metalinter_deadline = "2s"
let g:go_metalinter_autosave = 1
let g:go_list_type = "quickfix"
let g:go_fmt_fail_silently = 1
let g:go_list_height=6 " suggestions/error list should be lower
let g:go_jump_to_error=0 " Don't jump to errors on save
let g:go_echo_command_info=0 " Don't show errors, for example gometalinter FAIL errors

" Terraform
" call terraform fmt on save
let g:terraform_fmt_on_save = 1

" maps
map <C-n> :NERDTreeToggle<CR>

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

" LaTex
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
      \ 'backend' : 'nvim',
      \ 'background' : 1,
      \ 'build_dir' : '',
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'options' : [
      \   '-shell-escape',
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \}

" ack.vim => the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
