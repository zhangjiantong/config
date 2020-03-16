set linespace=2
set undodir=path/to/dir
set synmaxcol=1000
set t_Co=256
" set termguicolors
set ttyfast " u got a fast terminal
set lazyredraw
" for paste mode toggle
set pastetoggle=<F6>
set cursorline " 高亮当前行
set ignorecase  " 忽略大小写
set smartcase  " 智能大小写
set shiftround "其作用是在你按>或<或者是在插入模式下按C-T或C-D时的缩进取整对齐
set noautochdir    " 注意这个自动切换目录会使rope找目录不正确，禁用，坑死我
set encoding=utf-8
" Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
autocmd BufWritePre * :%s/\s\+$//ge  "自动删除行尾空格
"退出insert快捷键
inoremap jj <Esc>`^
"设置行号
set number  "设置行号
"语法高亮
syntax on   "语法高亮
filetype plugin indent on
"映射load键
let mapleader=','
set ts=4
set sw=4
set expandtab
" Searching options
set hlsearch
exec "nohlsearch"
set incsearch
" 取消高亮：<LEADER>加回车
nnoremap <LEADER><CR> :nohlsearch<CR>

set scrolloff=5   "上下最少显示5行
let g:space_vim_transp_bg = 1
" set splitright
" set splitbelow

" Resize splits with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>


" set rtp+=~/.fzf

" if &compatible
"       set nocompatible
"   endif
"插件
call plug#begin('~/.config/nvim/plugged')
"主题
Plug 'tomasiser/vim-code-dark'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'kristijanhusak/vim-hybrid-material'
"打开vim，展示最近打开，展示名言 启动界面
Plug 'mhinz/vim-startify'
"修改状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"缩进线
Plug 'yggdroot/indentline'
"文件目录管理
" Plug 'scrooloose/nerdtree'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'  }
Plug 'kristijanhusak/defx-icons'
" Surround
Plug 'tpope/vim-surround'
"快速查找
" Plug 'kien/ctrlp.vim'

"快速跳转
Plug 'easymotion/vim-easymotion'
"浏览代码
Plug 'majutsushi/tagbar'
"python 补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
" Plug 'deoplete-plugins/deoplete-jedi'
""

""模糊搜索
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"搜索替换
Plug 'brooth/far.vim'
"快速浏览
Plug 'lfv89/vim-interestingwords'
"快速注释
Plug 'tpope/vim-commentary'
"auto pair
Plug 'jiangmiao/auto-pairs'
"vim 显示git文件变动
Plug 'airblade/vim-gitgutter'
" 调试
" Plug 'vim-vdebug/vdebug'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" vim git
Plug 'airblade/vim-gitgutter'
" vim tmux窗格切换
Plug 'christoomey/vim-tmux-navigator'
" 彩色括号
Plug 'frazrepo/vim-rainbow'
" Plug 'sillybun/vim-repl'
" 代码折叠
" Plug 'tmhedberg/SimpylFold'
call plug#end()

let g:python3_host_prog='/home/xupeng.cao/anaconda3/envs/python3.6/bin/python3'
" autocmd CursorHold * silent call CocActionAsync('highlight')
" vim-slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_python_ipython = 1
" defx
call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'botright',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1})
" 使用 ;e 切换显示文件浏览，使用 ;a 查找到当前文件位置
let g:maplocalleader=';'
nnoremap <silent> <LocalLeader>e
\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <LocalLeader>a
\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>

function! s:defx_mappings() abort
	" Defx window keyboard mappings
	setlocal signcolumn=no
	" 使用回车打开文件
	nnoremap <silent><buffer><expr> <CR> defx#do_action('multi', ['drop'])
endfunction

call defx#custom#option('_', {
	\ 'columns': 'indent:git:icons:filename',
	\ 'winwidth': 25,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'listed': 1,
	\ 'show_ignored_files': 0,
	\ 'root_marker': '≡ ',
	\ 'ignored_files':
	\     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
	\   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc,*.swp'
	\ })

autocmd FileType defx call s:defx_mappings()


if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

set background=dark
colorscheme hybrid_material
"vim-easymotion
nmap ss <PLug>(easymotion-s2)

"tagbar
nnoremap <leader>t :TagbarToggle<CR>

noremap <leader>e :vs<cr>
"关闭分屏
nnoremap <LEADER>c <C-w>c
"insert a newline
inoremap <C-o> <Esc>o
" inoremap <C-O> <Esc>O

""" Turn on all syntax highlighting options in 'vim-python/python-syntax'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=noinsert,menuone,noselect
" ncm2
" autocmd BufEnter * call ncm2#enable_for_buffer()
" au User Ncm2Plugin call ncm2#register_source({
            " \ 'name' : 'css',
            " \ 'priority': 9,
            " \ 'subscope_enable': 1,
            " \ 'scope': ['css','scss'],
            " \ 'mark': 'css',
            " \ 'word_pattern': '[\w\-]+',
            " \ 'complete_pattern': ':\s*',
            " \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
            " \})
autocmd BufNewFile *.py exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call setline(2, "\# -*- coding:utf-8 -*-")
        normal G
        normal o
        normal o
        call setline(5, "if __name__ == '__main__':")
        call setline(6, "    pass")
    endif
endfunc
" coc.nvim 设置
nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
let g:coc_global_extensions = ['coc-python', 'coc-json']

map <leader>b Oimport ipdb;ipdb.set_trace()<esc>
let g:rainbow_active = 1
" let g:SimpylFold_docstring_preview = 1
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)
