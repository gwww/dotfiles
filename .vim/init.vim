set nocompatible
set modeline

if has('nvim')
  set viminfo+=n~/.cache/neoviminfo
else
  set viminfo+=n~/.cache/viminfo
endif

"------------------------------------------------------------
" Plugins and most of their config {{{1
call plug#begin('~/.local/share/vim/plugged')
"call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'            " Status and tab line
  let g:airline_theme='glenn'
  let g:airline_powerline_fonts=1
  " let g:airline_section_x=''
  let g:airline_section_y=''
  let g:airline#extensions#whitespace#enabled=0
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#formatter='unique_tail_improved'
  set noshowmode
  set laststatus=2
  set cmdheight=2

Plug 'haya14busa/is.vim'
  set incsearch
  set hlsearch

Plug 'mileszs/ack.vim'
if executable("rg")
    "set grepprg=rg\ --vimgrep\ --no-heading
    let g:ackprg = 'rg --vimgrep'
endif

" f/t commands on steroids
Plug 'justinmk/vim-sneak'
  nmap f <Plug>Sneak_f
  nmap F <Plug>Sneak_F
  nmap t <Plug>Sneak_t
  nmap T <Plug>Sneak_T
  nmap s <Plug>Sneak_s
  nmap S <Plug>Sneak_S

map <expr> n sneak#is_sneaking() ? '<Plug>SneakNext' : '<Plug>(is-n)'
map <expr> N sneak#is_sneaking() ? '<Plug>SneakPrevious' : '<Plug>(is-N)'

" for writing, in particular in markdown
Plug 'reedes/vim-pencil'
"   augroup pencil
"     autocmd!
"     autocmd FileType markdown
"       \   call pencil#init({'wrap': 'hard', 'textwidth': 78})
"       \ | setlocal spell makeprg=atdtool\ %
"     autocmd FileType text
"       \   call pencil#init({'wrap': 'hard', 'textwidth': 78})
"   augroup END,

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-repeat'             " better '.' handling when repeated
Plug 'jiangmiao/auto-pairs'         " auto close quotes, brackets
Plug 'gwww/vim-bbye'                " delete buffer leaving window structure intact
Plug 'tpope/vim-commentary'         " toggle comments: <visual>gc, gc<motion>
Plug 'terryma/vim-expand-region'    " + to expand visual select; _ to shrink
Plug 'tpope/vim-endwise'            " auto close begin, do, ...
Plug 'tpope/vim-surround'           " add surround text objects e.g.: cs])
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'wellle/targets.vim'           " amped up text objects
Plug 'vim-scripts/matchit.zip'      " % command matches if/else/end and more
Plug 'mattn/emmet-vim'              " quick html/css editing

" Snippets support
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
" Plug 'honza/vim-snippets'

" Language support
Plug 'sheerun/vim-polyglot'
"   let g:markdown_syntax_conceal = 0

call plug#end()

filetype indent plugin on
syntax on

autocmd filetype crontab setlocal nobackup nowritebackup

"------------------------------------------------------------
" Must have options {{{1
set hidden                  " Allow to switch buffers without first saving
set wildmenu                " Better command-line completion
set wildmode=longest,list
set showcmd                 " Show partial commands in the last line of the screen
set showmatch
set matchtime=2
set scrolloff=5             " Keep at least 5 lines on screen when using j/k
set foldlevel=999
set noswapfile
set history=1000

"------------------------------------------------------------
" Usability options {{{1
set ignorecase
set smartcase
set backspace=eol,indent,start
set whichwrap+=<,>,[,]
set number
set nostartofline           " Stop certain movements from going to first char of line
set confirm                 " Raise dialogue instead of failing unsaved changes
set visualbell              " Use visual bell instead of beeping on error
set t_vb=                   " Don't flash either!
if has('mouse')
    set mouse=a             " Enable use of the mouse for all modes
endif
set formatoptions+=nj       " recognize numbered lists; smart comment joining
set listchars=tab:▸\ ,trail:· ",eol:¬
set list
set lazyredraw              " Don't redraw during macros

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=100

if has('gui_running')
    set guioptions-=rL
    set lines=40 columns=100
    if has('mac')
        set guifont=Inconsolata-dz\ for\ Powerline:h14
    elseif has('win32') || has('win64')
        set guifont=Consolas:h10:cANSI
    elseif has('unix')
        set guifont=Monospace\ 9
    endif
elseif &term =~ "xterm"
    " Set block/line cursor for regular/insert modes
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"------------------------------------------------------------
" Indentation options {{{1
set expandtab       " expand tabs into spaces
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=2
set linebreak       " break at nice spot rather than text width
set wrap            " Wrap lines
set textwidth=0
set autoindent
set smartindent

"------------------------------------------------------------
" Mappings {{{1
nnoremap ; :

let mapleader=","
let g:mapleader=","
map             <leader>1  <C-W>o
map             <leader>2  <C-W>s
map             <leader>3  <C-W>v
map     <silent><leader>c  :Bdelete<cr>
map     <silent><leader>e  :Files<cr>
map     <silent><leader>p  :setlocal paste!<cr>
nmap            <leader>P  "+P
map     <silent><leader>w  :call ToggleWrap()<cr>
noremap         <leader>y  "+y
noremap         <leader>Y  "+y$
nnoremap <silent> <leader>/ :execute 'Ack! ' . input('Rg/')<CR>

map Y y$

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Make j and k work the way you expect
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Keep the cursor in place while joining lines
" nnoremap J mzJ`z

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <Tab>         :bnext<cr>
nnoremap <S-Tab>       :bprev<cr>
nnoremap <leader><Tab> :bnext<CR>

" Fix page up and down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

"------------------------------------------------------------
" Colour {{{1
"colorscheme glenn
colorscheme jellybeans
hi link htmlLink NONE
hi link htmlItalic NONE
hi Search cterm=NONE ctermfg=251 ctermbg=31
hi cursorLine cterm=NONE ctermbg=238

"------------------------------------------------------------
" Functions {{{1
function! ToggleWrap()
  if &formatoptions =~ 'a'
    set fo-=a
    echo "Wrapping OFF"
  else
    set fo+=a
    echo "Wrapping ON"
  endif
endfunction
