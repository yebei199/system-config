call plug#begin()
Plug 'tpope/vim-surround'
Plug 'ggandor/leap.nvim'
call plug#end()

let mapleader=' '
set incsearch
set ignorecase
set smartcase

map L $
map H ^
nnoremap <C-a> GVgg

" f键双向查找配置
nnoremap f <Plug>(leap)
nnoremap F <Plug>(leap-backward-to)
