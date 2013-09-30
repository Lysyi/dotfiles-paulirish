" Make vim more useful
set nocompatible

" I prefer dark background - but nice to switch

"set background = light

" Mmmhm solarized baby 
colorscheme solarized

" Syntax highlightin' - yes pls
syntax on

" Enabled later, after pathogen
filetype off
" Vundle stuff
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" syntax highlighting for javascript
Bundle 'jelera/vim-javascript-syntax'
" indent shit...
Bundle 'nathanaelkane/vim-indent-guides'
" closes brackets automatically
Bundle 'Raimondi/delimitMate'
" error checking
Bundle 'scrooloose/syntastic'
" auto completion
Bundle 'Valloric/YouCompleteMe'
Bundle 'marijnh/tern_for_vim'

" set line endings
filetype plugin indent on " end bundle

" ',' is much easier to hit
let mapleader=","

" My commonly used abbrevs 
iab fn function
iab afn function(){<CR><CR><up><bs><TAB><Tab><bs>
iab rt return
iab fori for(i =)<Esc>hi
iab log console.log()<Esc>i"

" Common fuck ups
iab Var var
iab VAR var

" movement maps
nmap L $
nmap H ^

" handy maps
inoremap jk <esc>


" Personal abbreviations
iab auth 
\<CR>/* 
\<CR>Author: Fabien O'Carroll
\<CR>/

" Local dirs
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo
" status line
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
" Set some junk
set autoindent " Copy indent from last line when starting new line.
set backspace=indent,eol,start
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set foldcolumn=4 " Column to show folds
set foldenable
set foldlevel=2
set foldlevelstart=0 "Sets `foldlevel` when editing a new buffer
set foldmethod=syntax " Markers are used to specify folds.
set foldminlines=0 " Allow folding single lines
set foldnestmax=3 " Set max fold nesting level
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set hidden " When a buffer is brought to foreground, remember undo history and marks.
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set incsearch " Highlight dynamically as pattern is typed.
set laststatus=2 " Always show status line
set magic " Enable extended regexes.
set nostartofline " Don't reset cursor to start of line when moving around.
set nowrap " Do not wrap lines.
set nu " Enable line numbers.
set ofu=syntaxcomplete#Complete " Set omni-completion method.
set report=0 " Show all changes.
set ruler " Show the cursor position
set shiftwidth=4 " The # of spaces for indenting
set showmode " Show the current mode.
set showtabline=2 " Always show tab bar.
set expandtab
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces.
set softtabstop=4 " Tab key results in 2 spaces
set tabstop=4
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set title " Show the filename in the window titlebar.
set undofile " Persistent Undo.
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/node_modules/*,*/.git/*,*/.svn/*,*/build/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line.
set wildmode=list:longest " Complete only until point of ambiguity.
set guifont=Droid\ Sans\ Mono:h12

let g:Powerline_symbols = 'fancy'

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" Easy .vimrc access
nnoremap <Leader>ev :vsplit $MYVIMRC<cr>

" Easy line removal
noremap <Leader>d dd

" Remap :W to :w
command W w

" Hard to type things
imap >> →
imap << ←
imap ^^ ↑
imap VV ↓

" Buffer navigation (,,) - switch (,ls) - list
map <Leader>, <C-^>
map <Leader>ls :buffers<CR>

" Toggle folds (<Space>)
nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Set relative line numbers
set relativenumber " Use relative line numbers. Current line is still in status bar.
au BufReadPost,BufNewFile * set relativenumber

" Emulate bundles, allow plugins to live independantly. Easier to manage.
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

"JSON
au BufRead,BufNewFile *.json set ft=json syntax=javascript



