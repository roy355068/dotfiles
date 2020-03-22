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
