"テーマ設定
"autocmd ColorScheme * highlight Comment ctermfg=22 guifg=#008800
syntax enable
"set background=dark
"let  g:hybrid_use_Xresources = 1
"colorscheme solarized
"colorscheme hybrid
"colorscheme jellybeans
colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1                                 

if !has('gui_running')
  set t_Co=256
endif

"set wildmenu wildmode=list:full


"個人的文章設定 あとに書いたコピペ部分と若干かぶる
" 自動インデント
set autoindent
" 改行前の行の書体に合わせてインデント
set smartindent
" 新しいウィンドウを右に開く
set splitright
" カーソルライン
"set cursorline
" コマンド部分の高さ
set cmdheight=1
" タブ文字の占める幅
set tabstop=4
" タブ文字が実際に入力された時の文字数(shiftwidthの倍数でなければspaceがはいる)
set softtabstop=4
" タブキーで移動する幅
set shiftwidth=4
" タブをスペースに展開
set expandtab
" ???
set noshowmode
" エンコーディング
set encoding=utf8
" ファイルエンコード
set fileencoding=utf-8
" スクロールする時に下が見えるようにする
set scrolloff=5
" .swapファイルを作らない
set noswapfile
" バックアップファイルを作らない
set nowritebackup
" undofile を作らない?
set noundofile
" バックアップをしない
set nobackup
" バックスペースで各種消せるようにする
set backspace=indent,eol,start
" ビープ音を消す
set vb t_vb=
set novisualbell
" OSのクリップボードを使う
"set clipboard+=unnamed
set clipboard=unnamedplus,autoselect
" 不可視文字を表示
set list
" 行番号を表示
set number
" 右下に表示される行・列の番号を表示する
set ruler
" compatibleオプションをオフにする
set nocompatible
" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" 対応括弧をハイライト表示する
set showmatch
" 対応括弧の表示秒数を2秒にする
set matchtime=2
" ウィンドウの幅より長い行は折り返され、次の行に続けて表示される
set wrap
" 入力されているテキストの最大幅を無効にする
set textwidth=0
" 不可視文字を表示
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
"set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%,eol:↲
" インデントをshiftwidthの倍数に丸める
set shiftround
" 補完の際の大文字小文字の区別しない
set infercase
" 文字がない場所にもカーソルを移動できるようにする
set virtualedit=all
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" 新しく開く代わりにすでに開いてあるバッファを開く
set switchbuf=useopen
" /gオプションデフォルトで用いる。便利？
"set gdefault
" 小文字の検索でも大文字も見つかるようにする
set ignorecase
" ただし大文字も含めた検索の場合はその通りに検索する
set smartcase
" インクリメンタルサーチを行う
set incsearch
" 検索結果をハイライト表示
set nohlsearch
" コマンド、検索パターンを10000個まで履歴に残す
set history=10000
" マウスモード有効
"set mouse=a
" xtermとscreen対応
set ttymouse=xterm2
" コマンドを画面最下部に表示する
set showcmd
" ステータスラインの設定
set statusline=%F%r%h%=
" タブ(タブ文字ではない)の占める幅
set showtabline=2
" ウィンドウのタイトル
set title
"set cmdheight=1
set laststatus=2
" コマンド表示
set showcmd

filetype off

"プラグインの闇
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
  \ 'build' : {
  \   'windows' : 'tools\\update-dll-mingw',
  \   'cygwin' : 'make -f make_cygwin.mak',
  \   'mac' : 'make',
  \   'linux' : 'make',
  \   'unix' : 'gmake',
  \ },
\ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
"NeoBundle 'https://bitbucket.org/kovisoft/slimv'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'airblade/vim-gitgutter'
"NeoBundle 'alpaca-tc/alpaca_powertabline'
"NeoBundle 'Lokaltog/powerline',{'rtp':'powerline/bindings/vim'}
NeoBundle 'losingkeys/vim-niji'
NeoBundle 'kana/vim-submode'
NeoBundle 'ujihisa/unite-colorscheme'
"NeoBundle 'kurocode25/mdforvim'
"NeoBundle 'plasticboy/vim-markdown'
"NeoBundle 'kannokanno/previm'
"NeoBundle 'tyru/open-browser.vim'
"NeoBundle 'thinca/vim-template'
"NeoBundle 'chakku000/OpenTemplate.vim'
NeoBundle 'lervag/vimtex'
NeoBundle 'mattn/sonictemplate-vim'
NeoBundle 'tpope/vim-surround'

"Lazys
NeoBundleLazy 'Shougo/unite.vim', {
  \ 'autoload': {
  \     'commands': ['Unite']
  \ }
\ }
NeoBundleLazy 'aharisu/vim_goshrepl', {
  \ 'autoload': {
  \     'filetypes': ['scheme']
  \ }
\ }
NeoBundleLazy 'kana/vim-filetype-haskell', {
  \ 'autoload': {
  \     'filetypes': ['haskell']
  \ }
\ }
NeoBundleLazy 'leafgarland/typescript-vim', {
  \ 'autoload' : {
  \     'filetypes' : ['typescript'] }
\}
NeoBundleLazy 'jason0x43/vim-js-indent', {
  \ 'autoload' : {
  \   'filetypes' : ['javascript', 'typescript', 'html'],
\}}
NeoBundleLazy 'othree/yajs.vim', {'autoload':{'filetypes':['javascript']}}

let g:js_indent_typescript = 1

call neobundle#end()

au BufRead,BufNewFile *.md set filetype=markdown

let g:tex_flavor = 'latex'
let g:sonictemplate_vim_template_dir = [
    \ '~/work/templates'
    \]

 " LaTeX Quickrun
let g:quickrun_config = {}
let g:quickrun_config['tex'] = {
\ 'command' : 'latexmk',
\ 'outputter' : 'error',
\ 'outputter/error/success' : 'null',
\ 'outputter/error/error' : 'quickfix',
\ 'srcfile' : expand("%"),
\ 'cmdopt': '-pdfdvi',
\ 'hook/sweep/files' : [
\                      '%S:p:r.aux',
\                      '%S:p:r.bbl',
\                      '%S:p:r.blg',
\                      '%S:p:r.dvi',
\                      '%S:p:r.fdb_latexmk',
\                      '%S:p:r.fls',
\                      '%S:p:r.log',
\                      '%S:p:r.out'
\                      ],
\ 'exec': '%c %o %a %s',
\}

" 部分的に選択してコンパイル
" http://auewe.hatenablog.com/entry/2013/12/25/033416 を参考に
let g:quickrun_config.tmptex = {
\   'exec': [
\           'mv %s %a/tmptex.latex',
\           'latexmk -pdfdvi -pv -output-directory=%a %a/tmptex.latex',
\           ],
\   'args' : expand("%:p:h:gs?\\\\?/?"),
\   'outputter' : 'error',
\   'outputter/error/error' : 'quickfix',
\
\   'hook/eval/enable' : 1,
\   'hook/eval/cd' : "%s:r",
\
\   'hook/eval/template' : '\documentclass{jsarticle}'
\                         .'\usepackage[dvipdfmx]{graphicx, hyperref}'
\                         .'\usepackage{float}'
\                         .'\usepackage{amsmath,amssymb,amsthm,ascmac,mathrsfs}'
\                         .'\allowdisplaybreaks[1]'
\                         .'\theoremstyle{definition}'
\                         .'\newtheorem{theorem}{定理}'
\                         .'\newtheorem*{theorem*}{定理}'
\                         .'\newtheorem{definition}[theorem]{定義}'
\                         .'\newtheorem*{definition*}{定義}'
\                         .'\renewcommand\vector[1]{\mbox{\boldmath{\$#1\$}}}'
\                         .'\begin{document}'
\                         .'%s'
\                         .'\end{document}',
\
\   'hook/sweep/files' : [
\                        '%a/tmptex.latex',
\                        '%a/tmptex.out',
\                        '%a/tmptex.fdb_latexmk',
\                        '%a/tmptex.log',
\                        '%a/tmptex.aux',
\                        '%a/tmptex.dvi'
\                        ],
\}

vnoremap <silent><buffer> <F5> :QuickRun -mode v -type tmptex<CR>

" QuickRun and view compile result quickly (but don't preview pdf file)
nnoremap <silent><F5> :QuickRun<CR>

autocmd BufWritePost,FileWritePost *.tex QuickRun tex

filetype plugin indent on     " required!
filetype indent on

let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ },
		\ 'component': {
        \   'readonly': '%{&readonly?"":"aaa"}',
        \},
        \ 'component_visible_condition': {
        \   'readonly': '(&filetype!="help"&& &readonly)',
        \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
        \ },
        \ 'separator': { 'left': '⮀', 'right': '⮂' },
        \ 'subseparator': { 'left': '⮁', 'right': '⮃' },
        \ 'tabline_separator': { 'left': '⮀', 'right': '⮂' },
        \ 'tabline_subseparator': { 'left': '⮁', 'right': '⮃' },
        \}
"        \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
"        \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
"        \ 'separator': { 'left': '', 'right': '' },
"        \ 'subseparator': { 'left': '', 'right': '' }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"なぜか最後に書かないと動作しない
let g:solarized_termtrans=1
highlight Normal ctermbg=none 
" アンダーラインを引く(color terminal)
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

" Key mapping

" j&kを表示行移動に
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Ctrl+jをESCにする
inoremap <C-j> <ESC>
noremap <Help> <ESC>

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

" very magic(すべてのメタ文字を\なしで使用)
nnoremap / /\v

" Ctrl-EでNerdTreeをトグル
nnoremap <C-e> :NERDTreeToggle<CR>

let g:OpenTemplate#Template_dir = '~/work/kyo-pro/cp-template/template'
nnoremap <C-l> :OpenTemplate<CR>

vmap <CR> <Plug>(gosh_repl_send_block)

" for vim-submode

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
