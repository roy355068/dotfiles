"Remember the last editing line
au BufReadPost * if line("'\"") > 0|if line("'\"") <= 
\ line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

syntax enable
colorscheme monokai
set number
set relativenumber
set cindent
set autoindent
set smartindent
set showmode
set showcmd
set ruler
set backspace=2
set shiftwidth=4
set softtabstop=4
set expandtab
set hlsearch
"set smarttab
set nu
"highlight lines longer than 80 columns
"2mat ErrorMsg '\%80v.'
hi User1 ctermbg=blue ctermfg=yellow guibg=black guifg=white
set laststatus=2
set statusline=%1*%f%m%r\ line:\ %l\ /\ %L\ (%p%%),\ col:\ %c%=%y\ [%{&fenc!=''?&fenc:&enc}:%{&ff}]
"Hightlight the current line with shadows
"set cursorline
"hi cursorline ctermbg=Blue guibg=Red
"set spell

"For occasional use of Big5 encoding
"set encoding=big5
"set fileencoding=big5
"set termencoding=big5
"set fileencodings=big5
"set ambiwidth=double

" Map jk as escape key for exiting INSERT mode
inoremap jk <ESC>
" Use space as the leader key
let mapleader = " "
" Remap Capslock as Control key
filetype plugin indent on
syntax on
set encoding=utf-8
set clipboard=unnamedplus

" <Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <leader>c :nohl<CR>

"Mode Settings
"
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
"
""Cursor settings:

"  1 -> blinking block
"  "  2 -> solid block 
"  "  3 -> blinking underscore
"  "  4 -> solid underscore
"  "  5 -> blinking vertical bar
"  "  6 -> solid vertical bar
"
"
