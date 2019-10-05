"  ____            __
" |  _ \ _ __ ___ / _| ___ _ __ ___ _ __   ___ ___  ___
" | |_) | '__/ _ \ |_ / _ \ '__/ _ \ '_ \ / __/ _ \/ __|
" |  __/| | |  __/  _|  __/ | |  __/ | | | (_|  __/\__ \
" |_|   |_|  \___|_|  \___|_|  \___|_| |_|\___\___||___/

" Syntax hilighting
syntax on

" 4 spaces for tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Show linenumbers
set number
" set relativenumber

" Colorscheme
colors zenburn

" Highlight the 80th column
set cursorline
set cc=80
highlight ColorColumn ctermbg=darkblue

"Highlight tabs and extra whitespace
highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s /
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

let @w = ':%s/\s\+$//e'

" Disable .swp and backup files
set nobackup
set nowritebackup
set noswapfile

" vim-sensible changes I liked
set laststatus=0
set backspace=indent,eol,start
set incsearch
set scrolloff=2
set smarttab

" macros
map <F1> :setf kpl<CR>:set shiftwidth=2<CR>:set tabstop=2<CR>:set expandtab<CR>
