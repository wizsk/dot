:set number
:set number relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
" Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
" Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/Mofiqul/dracula.nvim' " Drakula theme Which i Like hehe
set encoding=UTF-8

" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

call plug#end()


"" color sceme && the last lines are for transparency
:colorscheme dracula
highlight Normal guibg=none
highlight NonText guibg=none
