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

" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu

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
set cursorline " 有人还会高亮当前列，可以通过 set cursorcolumn 开启，但有点过了，不推荐
" 显示光标当前位置
set ruler
" 显示窗口比较小的时候折行展示，不然需要水平翻页，推荐
set linebreak
"关闭自动换行
set nowrap
" 开启语法高亮
syntax enable
syntax on
" 开启自动识别文件类型，并根据文件类型加载不同的插件和缩进规则
filetype plugin indent on
"高亮查找    
set hlsearch
"粘贴插入
set paste
set clipboard+=unnamed,unnamedplus
 
"set shortcut for copy to clipboard of system 
"nmap <leader>c "+y
"nmap <leader>v "+gp
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

"新窗口在右侧打开
set splitright
"set splitbelow
"自动打开上次位置
autocmd BufReadPost * normal! g`"
" 基于缩进或语法进行代码折叠za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
Plug 'vim-scripts/phd'
Plug 'altercation/vim-colors-solarized'
Plug 'Lokaltog/vim-powerline'
"Plug 'vim-airline/vim-airline.git'
"Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'nathanaelkane/vim-indent-guides'  "显示缩进
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'https://github.com/ycm-core/YouCompleteMe'
Plug 'Raimondi/delimitMate'
Plug 'https://github.com/mileszs/ack.vim'
Plug 'https://github.com/dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/DrawIt'
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'https://github.com/vim-scripts/autoload_cscope.vim'
Plug 'https://github.com/vim-scripts/OmniCppComplete.git'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
"Plug 'ervandew/supertab'
"Plug 'xavierd/clang_complete'
"Plug 'ianva/vim-youdao-translater' "有道翻译
Plug 'https://github.com/voldikss/vim-translator.git'
Plug 'fholgado/minibufexpl.vim'
"Plug 'mbbill/echofunc'
Plug 'TaDaa/vimade' "更好的分辨当前分割窗口
"Plug 'mbbill/undotree'
Plug 'kshenoy/vim-signature'
Plug 'https://github.com/vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines.git'
call plug#end()

"配色
colorscheme molokai
let g:molokai_original = 1
set t_Co=256
"colorscheme solarized
"set background=dark
"colorscheme phd

"powerline
"let g:Powerline_symbols = 'fancy'
"let g:Powerline_symbols = 'unicode'
" normal 模式下使用 bl 列出 Buffer 列表
nnoremap <silent> bl :ls<CR>
" normal 模式下使用 bo 打开一个新 Buffer
nnoremap <silent> bo :enew<CR>
" normal 模式下使用 bn 切换到下一个 Buffer
nnoremap <silent> bn :bnext<CR>
" normal 模式下使用 bp 切换到上一个 Buffer
nnoremap <silent> bp :bprevious<CR>
" normal 模式下使用 bd 关闭当前 Buffer
nnoremap <silent> bd :bdelete<CR>
" 允许 airline 在顶部显示 Buffer 列表
"let g:airline#extensions#tabline#enabled=1
" 显示 buffer 编号，方便切换
"let g:airline#extensions#tabline#buffer_nr_show=1
"let g:airline_theme="molokai"
"这个是安装字体后 必须设置此项"
"let g:airline_powerline_fonts = 1

" indent 随 vim 自启动
"let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 v 开/关缩进可视化
:nmap <silent> <Leader>v <Plug>IndentGuidesToggle

"NERDTree 配置
map <F4> :NERDTreeToggle<CR>"F4快捷键打开
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let g:tagbar_left = 1
nmap <F3> :TagbarToggle<CR>
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1

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
let g:gutentags_ctags_extra_args += ['--c-kinds=+pxcdefgImnstuv']
let g:gutentags_ctags_extra_args += ['--c-kinds=+l']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+l']

nnoremap <C-]> :execute "vertical ptag " . expand("<cword>")<CR>
"set tags+=~/.cache/.tags
"" OmniCppComplete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
"let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
"let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
"let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"" 自动关闭补全窗口
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest

" ack.vim
" 使用 leader + a search
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

if executable('ag')
  let g:ackprg = 'ag --vimgrep --nogroup --column'
endif

" 高亮搜索关键词
let g:ackhighlight = 1

" Use the ack tool as the backend
let g:ctrlsf_backend = 'ack'
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
map <C-F> :CtrlSF<CR>

" 下，在注释分隔符后添加空格
let g:NERDSpaceDelims = 1
" 允许注释和反转空行（在注释区域时很有用）
let g:NERDCommentEmptyLines = 1
"needcomment使用
"    [count]<leader>cc |NERDCommenterComment|
"	注释掉在视觉模式下选定的当前行或文本。 对应我的 ;cc
"
"    [count]<leader>cn |NERDCommenterNested|
"	与cc相同，但强制嵌套。 （没试验过） 对应我的 ,cn
"
"    [count]<leader>c<space> |NERDCommenterToggle|
"	换选定行的注释状态。如果最上面的选定行被注释，则所有选定行都将被取消注释，反之亦然
"	对应我的 ,c<space> （注释与取消注释）  每一行都添加一组注释符
"	我目前使用 ,cm注释 使用 ,c<space>取消注释
"    [count]<leader>cm |NERDCommenterMinimal|
"	仅使用一组多部分分隔符注释给定行。 （这个也就是多行注释只用一个注释标签的意思 例如 /* sdfasdfdfds */ ） 对应我的 ;cm
"
"    [count]<leader>ci |NERDCommenterInvert|
"	分别切换选定行的注释状态。
"
"    [count]<leader>cs |NERDCommenterSexy|
"	用漂亮的块格式布局注释掉所选行。
"
"    [count]<leader>cy |NERDCommenterYank|
"	与cc相同，不同的是，注释行首先被拉伸
"
"    <leader>c$ |NERDCommenterToEOL|
"	注释光标到行尾的当前行

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
"let g:UltiSnipsSnippetDirectories=['UltiSnips']
"let g:UltiSnipsSnippetsDir = '~/.vim/plugged/vim-snippets/UltiSnips'
"let g:UltiSnipsExpandTrigger="<c-q>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"ycm配置
" YCM 补全菜单配色
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
"let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
"set tags+=/data/misc/software/misc./vim/stdcpp.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
"inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项，每次都重新生成匹配项
"let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
set completeopt=menu,menuone
"let g:ycm_min_num_identifier_candidate_chars = 2
"禁止代码检查
let g:ycm_show_diagnostics_ui = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "python":1,
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }

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
"let g:SuperTabRetainCompletionType=2 "记住上次的补全方式,直到按Esc退出插入模式位置
"let g:SuperTabDefaultCompletionType="<c-x><c-o>"  "按下tab后默认补全方式为<c-p>,现在改为<c-x><c-o>
"let g:SuperTabMappingForward = "<tab>"
"let g:SuperTabMappingBackward= "s-tab"

"git相关
set updatetime=500
"You can jump between hunks with [c and ]c.
"You can preview, stage, and undo hunks with <leader>hp, <leader>hs, and <leader>hu respectively.

"nnoremap <F7> :UndotreeToggle<CR>

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
"nmap <silent> <Leader>w <Plug>TranslateW
" 可视模式，<Leader>w 翻译光标下的文本，在窗口中显示翻译内容
"vmap <silent> <Leader>w <Plug>TranslateWV
" 普通模式，<Leader>r 替换光标下的文本为翻译内容
"nmap <silent> <Leader>r <Plug>TranslateR
" 可视模式，<Leader>r 替换光标下的文本为翻译内容
"vmap <silent> <Leader>r <Plug>TranslateRV

" 显示/隐藏 MiniBufExplorer 窗口
map <leader>bl :MBEToggle<cr>
" buffer 切换快捷键
"nmap bn :MBEbn<cr>
"nmap bp :MBEbp<cr>

"vim-signature
"  mx           Toggle mark 'x' and display it in the leftmost column
"  dmx          Remove mark 'x' where x is a-zA-Z
"
"  m,           Place the next available mark
"  m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
"  m-           Delete all marks from the current line
"  m<Space>     Delete all marks from the current buffer
"  ]`           Jump to next mark
"  [`           Jump to prev mark
"  ]'           Jump to start of next line containing a mark
"  ['           Jump to start of prev line containing a mark
"  `]           Jump by alphabetical order to next mark
"  `[           Jump by alphabetical order to prev mark
"  ']           Jump by alphabetical order to start of next line having a mark
"  '[           Jump by alphabetical order to start of prev line having a mark
"  m/           Open location list and display marks from current buffer
"
"  m[0-9]       Toggle the corresponding marker !@#$%^&*()
"  m<S-[0-9]>   Remove all markers of the same type
"  ]-           Jump to next line having a marker of the same type
"  [-           Jump to prev line having a marker of the same type
"  ]=           Jump to next line having a marker of any type
"  [=           Jump to prev line having a marker of any type
"  m?           Open location list and display markers from current buffer
"  m<BS>        Remove all markers
"BOOKMARKS--Mark-and-Highlight-Full-Lines USAGE:
"<F1>            Turn on/update highlighting for all lines with markers
"<F2>            Turn off highlighting for lines with markers
"<SHIFT-F2> Erase all markers [a-z]
"<F5>             Add a mark on the current line (and highlight)
"<SHIFT-F5> Remove the mark on the current line
