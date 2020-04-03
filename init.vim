"gf go file
"gi 跳转到上次编辑位置 haha
"ctrl+o 移动到上次光标的位置 haha
"ZZ 保存退出

"           _             _                    
"__  __ ___| |__   __   _(_)_ __ ___  _ __ ___ 
"\ \/ /|_  / '_ \  \ \ / / | '_ ` _ \| '__/ __|
" >  <  / /| |_) |  \ V /| | | | | | | | | (__ 
"/_/\_\/___|_.__/    \_/ |_|_| |_| |_|_|  \___|
"                                              

" Author: @xiezhibin


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
let &t_ut=''
set autochdir
set fileencodings=utf8,cp936,gb18030,big5 

set nocompatible 
syntax on
set mouse=a
set encoding=utf-8
set t_Co=256
filetype off


" ===
" === Editor behavior
" ===
set number
set relativenumber
"set cursorcolumn
set cursorline
set colorcolumn=80
set noshowmode
set nobackup
set ttimeoutlen=0
set notimeout
set noswapfile
set wildmenu
set showcmd
set undofile
set clipboard^=unnamed,unnamedplus

" ===高级
set regexpengine=1
"在执行宏命令时，不进行显示重绘；在宏命令执行完成后，一次性重绘，以便提高性能。
set lazyredraw
set ttyfast "should make scrolling faster
set noerrorbells "关闭错误信息响铃 
set visualbell "使用可视响铃代替呼叫

silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 搜索
set hlsearch
set incsearch
set ignorecase
set smartcase

" 自动缩进
set autoindent

" 将ΤΑΒ转换成空格
set expandtab

" 在 insert 模式下，一个 TAB 键按下后，展示成几个空格
set softtabstop=4

"tabstop 有两个作用: 1.识别多少个空格形成一个TAB/ 2.显示既有文件时，将 TAB 显示成多个个空格
set tabstop=4

" >> 缩进的空格数
set shiftwidth=4

" 将ΤΑΒ显示为 | ，空格显示为▫
set listchars=tab:\|\ ,trail:▫
set list

" 自动换行
set nowrap

" 只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行
set linebreak

" 指定折行处与编辑窗口的右边缘之间空出的字符数
set wrapmargin=2

" 垂直滚动时，光标距离顶部/底部的位置（单位：行）
set scrolloff=5

" 水平滚动时，光标距离行首或行尾的位置（单位：字符）。该配置在不折行时比较有用
set sidescrolloff=15



" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   o >
"     e
"     v
noremap <silent> u k
noremap <silent> n h
noremap <silent> e j
noremap <silent> o l
noremap <silent> k o
noremap <silent> K O

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> U 15k
noremap <silent> E 15j
noremap <c-u> 3k
noremap <c-e> 3j

" Faster in-line navigation
noremap W 5w
noremap B 5b
noremap <c-o> 2w
noremap <c-n> 2b
noremap <silent> N 0
noremap <silent> O $

noremap = n
noremap - N


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
"noremap ; :

" Save & quit
nnoremap qq :q<CR>
nnoremap ss :w<CR>
inoremap uu <ESC>
inoremap aa <ESC>A

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>
noremap <LEADER>src :source ~/.config/nvim/init.vim<CR>

" Open Startify
noremap <LEADER>st :Startify<CR>

" Undo operations
noremap l u
noremap L <C-r>

" sudo to write
cnoremap w!! w !sudo tee % >/dev/null


" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>



" ===
" === Other useful stuff
" ===
" 切换buffer
nnoremap ] :bn<CR>
nnoremap [ :bp<CR>

" \p to show the current buffer file path
nnoremap \p 1<C-G>

" Opening a terminal window
noremap <LEADER>/ :set splitbelow<CR>:sp<CR>:term<CR>


" 大小写转换 change case 
noremap ` ~

" 括号自动补全
" inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap ) ()
inoremap [ []<ESC>i
inoremap < <><ESC>i
inoremap { {<CR>}<ESC>O
inoremap } {}

"??????????????????? Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>u <C-w>k
noremap <LEADER>e <C-w>j
noremap <LEADER>n <C-w>h
noremap <LEADER>o <C-w>l

" Disable the default s key
noremap s <nop>
noremap S <nop>
noremap D <nop>
noremap j <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap se :set splitbelow<CR>:split<CR>
noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap so :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sh <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H


" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap to :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmo :+tabmove<CR>



" ===================== Start of Plugin Settings =====================
" ===
" === Install Plugins with Vim-Plug
" ===
call plug#begin('~/.config/nvim/plugged')

Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'yggdroot/indentline'
Plug 'morhetz/gruvbox'
Plug 'vim-nerdtree/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround' 
Plug 'neoclide/coc.nvim',{'branch':'release'}
Plug 'lilydjwg/fcitx.vim'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
call plug#end()
" ===================== End of Plugin Settings =====================

" theme
colorscheme gruvbox
set background=dark
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
let g:bufferline_echo = 0

" ==
" == NERDTree
" ==
noremap tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = "N"
let NERDTreeMapUpdirKeepOpen = "n"
let NERDTreeMapOpenSplit = ""
let NERDTreeMapOpenVSplit = "O"
let NERDTreeMapActivateNode = "o"
let NERDTreeMapOpenInTab = "I"
let NERDTreeMapOpenInTabSilent = "i"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = ""
let NERDTreeMapChangeRoot = "l"
let NERDTreeMapMenu = ","
let NERDTreeMapToggleHidden = "zh"


" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
			\ "Modified"	: "✹",
			\ "Staged"		: "✚",
			\ "Untracked" : "✭",
			\ "Renamed"	 : "➜",
			\ "Unmerged"	: "═",
			\ "Deleted"	 : "✖",
			\ "Dirty"		 : "✗",
			\ "Clean"		 : "✔︎",
			\ "Unknown"	 : "?"
			\ }


" ==
" == easymotion 
" ==
nmap f <Plug>(easymotion-overwin-f)


" ===
" === suda.vim
" ===
"cnoreabbrev sw w suda://%
nnoremap <LEADER>sudo :w suda://%<CR>


" ===
" === coc
" ===
" fix the most annoying bug that coc has
"silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
"let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-gitignore', 'coc-vimlsp', 'coc-tailwindcss', 'coc-stylelint', 'coc-tslint', 'coc-lists', 'coc-git', 'coc-explorer', 'coc-pyright', 'coc-sourcekit', 'coc-translator', 'coc-flutter']
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()

" Open up coc-commands
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>
" coc-translator
nmap <LEADER>t <Plug>(coc-translator-p)
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Use D to show documentation in preview window
nnoremap <silent> D :call <SID>show_documentation()<CR>

