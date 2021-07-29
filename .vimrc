" 定义快捷键的前缀，即<Leader>
let mapleader=";"

set number
set mouse=a
"为方便复制，用<F6>开启/关闭行号显示:
nnoremap <F6> :set nonumber!<CR>:set foldcolumn=0<CR>
"括号配对情况
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

"设置文内智能搜索提示
" 高亮search命中的文本。
set hlsearch
"nnoremap <esc> :noh<return><esc>
" 搜索时忽略大小写
set ignorecase
" 随着键入即时搜索
set incsearch
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 禁止生成 swap 恢复文件
set noswapfile
" vim 内部使用的编码，默认使用 latin1，改成通用的 utf8 编码，避免乱码
set encoding=utf-8
" 文件编码探测列表
" 所以探测一下 utf8 和 gbk 足以应付大多数情况了
set fileencodings=utf-8,gb18030
" 在插入模式按回车时 vim 会自动根据上一行的缩进级别缩进
set autoindent
" 修正 vim 删除/退格键行为
set backspace=eol,start,indent
" 高亮第 80 列，推荐
set colorcolumn=80
" vim 默认使用单行显示状态，但有些插件需要使用双行展示，不妨直接设成 2
set laststatus=2
" 高亮光标所在行
" set cursorline " 有人还会高亮当前列，可以通过 set cursorcolumn 开启，但有点过了，不推荐
" 显示窗口比较小的时候折行展示，不然需要水平翻页，推荐
set linebreak
" 开启语法高亮
syntax enable
syntax on
" 开启自动识别文件类型，并根据文件类型加载不同的插件和缩进规则
filetype plugin indent on
"高亮查找    
set hlsearch
"粘贴插入
set paste
set clipboard^=unnamed,unnamedplus
 
"set shortcut for copy to clipboard of system 
"nmap <leader>c "+y
"nmap <leader>v "+gp

"新窗口在右侧打开
set splitright
"set splitbelow
"自动打开上次位置
autocmd BufReadPost * normal! g`"
"关闭自动换行
set nowrap
"快速匹配
set incsearch
" 基于缩进或语法进行代码折叠za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'Lokaltog/vim-powerline'
Plug 'nathanaelkane/vim-indent-guides'  "显示缩进
Plug 'majutsushi/tagbar'
"Plug 'https://github.com/ycm-core/YouCompleteMe'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Raimondi/delimitMate'
Plug 'https://github.com/mileszs/ack.vim'
Plug 'https://github.com/dyng/ctrlsf.vim'
Plug 'https://github.com/vim-scripts/autoload_cscope.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
"Plug 'ervandew/supertab'
"Plug 'xavierd/clang_complete'
"Plug 'ianva/vim-youdao-translater' "有道翻译
Plug 'https://github.com/voldikss/vim-translator.git'
call plug#end()

"NERDTree 配置
map <C-n> :NERDTreeToggle<CR>"ctrl + n快捷键打开

"配色
colorscheme molokai
let g:molokai_original = 1
set t_Co=256
"colorscheme solarized
"set background=dark

"powerline
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'unicode'

" 随 vim 自启动
"let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 v 开/关缩进可视化
":nmap <silent> <Leader>v <Plug>IndentGuidesToggle

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_left = 1
nmap <F3> :TagbarToggle<CR>

" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+l']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+l']

nnoremap <C-]> :execute "vertical ptag " . expand("<cword>")<CR>

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
map <C-F> :CtrlSF<CR>

set nocst    "在cscope数据库添加成功的时候不在命令栏现实提示信息.
set cspc=6 "cscope的查找结果在格式上最多显示6层目录.
let g:autocscope_menus=0 "关闭autocscope插件的快捷健映射.防止和我们定义的快捷键冲突.
"cscope相关的快捷键映射
nmap ff <c-]>
nmap ss <c-t>
"s:查找即查找C语言符号出现的地方
nmap fs :cs find s <C-R>=expand("<cword>")<CR><CR>
"g:查找函数、宏、枚举等定义的位置
nmap fg :cs find g <C-R>=expand("<cword>")<CR><CR>
"c:查找光标下的函数被调用的地方
nmap fc :cs find c <C-R>=expand("<cword>")<CR><CR>
"t: 查找指定的字符串出现的地方
nmap ft :cs find t <C-R>=expand("<cword>")<CR><CR>
"e:egrep模式查找,相当于egrep功能
nmap fe :cs find e <C-R>=expand("<cword>")<CR><CR>
"f: 查找文件名,相当于lookupfile
nmap fn :cs find f <C-R>=expand("<cfile>")<CR><CR>
"i: 查找当前文件名出现过的地方
nmap fi :cs find i <C-R>=expand("<cfile>")<CR><CR>
"d: 查找本当前函数调用的函数
nmap fd :cs find d <C-R>=expand("<cword>")<CR><CR>


"let g:clang_complete_copen=1
"let g:clang_periodic_quickfix=1
"let g:clang_snippets=1
"let g:clang_close_preview=1
"let g:clang_use_library=1
"let g:clang_user_options='-stdlib=libc++ -std=c++11 -IIncludePath'
" path to directory where library can be found
"let g:clang_library_path='/usr/lib/llvm-3.4/lib'
" or path directly to the library file
"let g:clang_library_path='/usr/lib32/libstdc++.so.6'

"配置Supertab
let g:SuperTabRetainCompletionType=2 "记住上次的补全方式,直到按Esc退出插入模式位置
let g:SuperTabDefaultCompletionType="<c-x><c-o>"  "按下tab后默认补全方式为<c-p>,现在改为<c-x><c-o>
let g:SuperTabMappingForward = "<tab>"
let g:SuperTabMappingBackward= "s-tab"

"有道翻译
"vnoremap <silent> <C-T> :<C-u>Ydv<CR>
"nnoremap <silent> <C-T> :<C-u>Ydc<CR>
"noremap <leader>yd :<C-u>Yde<CR>
"翻译插件使用：https://www.joyk.com/dig/detail/1556571607176465
" 普通模式，<Leader>d 翻译光标下的文本，在命令行回显翻译内容
nmap <silent> <Leader>t <Plug>Translate
" 可视模式，<Leader>d 翻译光标下的文本，在命令行回显翻译内容
vmap <silent> <Leader>t <Plug>TranslateV
" 普通模式，<Leader>w 翻译光标下的文本，在窗口中显示翻译内容
nmap <silent> <Leader>w <Plug>TranslateW
" 可视模式，<Leader>w 翻译光标下的文本，在窗口中显示翻译内容
vmap <silent> <Leader>w <Plug>TranslateWV
" 普通模式，<Leader>r 替换光标下的文本为翻译内容
nmap <silent> <Leader>r <Plug>TranslateR
" 可视模式，<Leader>r 替换光标下的文本为翻译内容
vmap <silent> <Leader>r <Plug>TranslateRV
