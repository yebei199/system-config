
let mapleader=" "

call plug#begin()

Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'

call plug#end()

"设置Leade为空格
let g:clipboard = g:vscode_clipboard    " Use vscode clipboard API
" let g:EasyMotion_do_mapping = 0 " 禁用默认映射
let g:EasyMotion_use_incsearch = 1 " 启用增量搜索
let g:EasyMotion_smartcase = 1

" Other settings
" 映射 EasyMotion 命令
nmap f <Plug>(easymotion-s)
vmap f <Plug>(easymotion-s)
nmap F <Plug>(easymotion-s2)

" select all text in visual mode
nnoremap <C-a> GVgg
inoremap <C-a> <Esc>GVgg

inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

"nnoremap o o <Esc>
"nnoremap O O <Esc>
" nnoremap <C-k> 5k
"

" 定义一个全局变量来存储输入法状态但是
" let g:last_im_select = '2052'

" 在退出插入模式时保存当前输入法状态
" autocmd InsertLeave * let g:last_im_select = system('D:/OneDrive/im_select/im-select.exe'):

" 在进入插入模式时恢复输入法状态
" autocmd InsertEnter * if !empty(g:last_im_select) | silent execute '!D:/OneDrive/im_select/im-select.exe 1033'| endif
" autocmd InsertEnter * if !empty(g:last_im_select) | silent execute '!D:/OneDrive/im_select/im-select.exe ' . g:last_im_select | endif


" 定义一个函数来切换输入法
function! ToggleEnglish()
    silent !D:/OneDrive/im_select/im-select.exe 1033
endfunction

function! ToggleCn()
    silent !D:/OneDrive/im_select/im-select.exe 2052
endfunction


" 在退出插入模式时切换到英文输入法
autocmd InsertLeave * silent !D:/OneDrive/im_select/im-select.exe 1033
" 在退出 Vim 时切换到cn输入法
autocmd VimLeave * call ToggleCn()
autocmd VimEnter * call ToggleEnglish()

" 映射 Esc 键到这个函数
nnoremap <silent> <Esc> :call ToggleEnglish()<CR>



set ignorecase              " Ignore upper case or lower case when searching
set smartcase               " Override 'ignorecase' if there are upper case chars
set nohls                   " Don't highlight searching result
set fileformat=unix         " Set end of line style to LF
set clipboard+=unnamedplus  " Share system clipboard


