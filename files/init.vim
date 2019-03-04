" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" On-demand loading
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tomasr/molokai'

" Initialize plugin system
call plug#end()

" Common configuration
syntax on
set number
set cursorline
set shiftwidth=4
set softtabstop=4
set laststatus=2

" NERDTree
" autocmd vimenter * NERDTree
let g:NERDTreeWinPos = 'right'
map <C-n> :NERDTreeToggle<CR>

" Molokai
let g:molokai_original = 1
colorscheme molokai
