" Skip initialization for vim-tiny or vim-small
if !1 | finish | endif


" ================ NeoBundle Config =====================

if has('vim_starting')
  set nocompatible

  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'moll/vim-node'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tomtom/tcomment_vim'
Plug 'dag/vim2hs'
Plug 'flazz/vim-colorschemes'
Plug 'tfnico/vim-gradle'
Plug 'guns/vim-clojure-static'
Plug 'ElmCast/elm-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'chase/vim-ansible-yaml'
Plug 'fatih/vim-go'
Plug 'eapache/rainbow_parentheses.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fireplace'
Plug 'SirVer/ultisnips'
Plug 'ahw/vim-pbcopy'
Plug 'jimenezrick/vimerl'
Plug 'suan/vim-instant-markdown'
Plug 'tpope/vim-markdown'
Plug 'eagletmt/neco-ghc'
Plug 'kchmck/vim-coffee-script'
Plug 'Shougo/neosnippet.vim'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet-snippets'

call plug#end()

" ================ General Config ====================

set number                      "Line numbers are good
set incsearch                   "Incremental search
set hlsearch                    "Highlight search
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

set ignorecase "Case insensitive search
set smartcase

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Gruvbox Theme Configuration
" colorscheme gruvbox
" set background=dark
" syntax on
"
" if !has("gui_running")
"  let g:gruvbox_italic=0
" endif

" colorscheme gruvbox
" colorscheme xterm16
" colorscheme inkpot
colorscheme up

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

let loaded_matchparen = 1 " Disable Highlighting of matching parens

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
" set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set wildignore+=*/bin/**
set wildignore+=*/gen/**
set wildignore+=*/target/**

" ================ Custom Mappings========================

" Disable arrow keys

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Bind leader-leader to tcomment
map <Leader><Leader> gc

" Toggle NerdTreeTabsToggle With /n
nmap <Leader>n :NERDTreeTabsToggle<CR>

" Leader-M to next window
nmap <Leader>m <c-w>w<c-d><c-w>W<CR>

" Leader-e to evaluate Clojure expression
map <Leader>e :Eval<CR>

" Leader-s to save files
map <Leader>s :w<CR>

" ================ Scrolling ================================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Custom Settings =========================

syntax enable

" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"Rainbow parentheses

let g:rbpt_colorpairs = [
    \ ['red',         'RoyalBlue3'],
    \ ['brown',       'SeaGreen3'],
    \ ['blue',        'DarkOrchid3'],
    \ ['gray',        'firebrick3'],
    \ ['green',       'RoyalBlue3'],
    \ ['magenta',     'SeaGreen3'],
    \ ['cyan',        'DarkOrchid3'],
    \ ['darkred',     'firebrick3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['darkblue',    'DarkOrchid3'],
    \ ['gray',        'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkmagenta', 'SeaGreen3'],
    \ ['darkcyan',    'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 15
let g:rbpt_loadcmd_toggle = 0
let g:bold_parentheses = 1  " Default on

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" vim-go 

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Elm

au FileType elm nmap <leader>b <Plug>(elm-make)
au FileType elm nmap <leader>m <Plug>(elm-make-main)
au FileType elm nmap <leader>t <Plug>(elm-test)
au FileType elm nmap <leader>r <Plug>(elm-repl)
au FileType elm nmap <leader>e <Plug>(elm-error-detail)
au FileType elm nmap <leader>d <Plug>(elm-show-docs)
au FileType elm nmap <leader>w <Plug>(elm-browse-docs)

let g:elm_jump_to_error = 1
let g:elm_make_output_file = "elm.html"
let g:elm_make_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0

hi SpecialKey ctermbg=NONE guibg=NONE

" Removes the annoying scratch window
set completeopt-=preview

" Supertab

let g:SuperTabDefaultCompletionType = "<c-n>"

" neco-gch
let g:necoghc_debug = 1

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Use deoplete.
let g:deoplete#enable_at_startup = 1
