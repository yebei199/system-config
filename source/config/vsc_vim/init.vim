call plug#begin()
Plug 'tpope/vim-surround'
Plug 'ggandor/leap.nvim'
call plug#end()

" 保证在 Vim 启动后注入 leap.nvim 的居中配置
autocmd VimEnter * lua require('leap').opts.post_jump = function() vim.cmd('normal! zz') end

let mapleader='  '
set incsearch
set ignorecase
set smartcase

map L $
map H ^
nnoremap <C-a> GVgg
nnoremap <C-c> y
nnoremap <C-v> p

" f键双向查找配置
nnoremap f <Plug>(leap)
nnoremap F <Plug>(leap-backward-to)

set clipboard=unnamedplus

