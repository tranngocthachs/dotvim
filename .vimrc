" set default 'runtimepath' (without ~/.vim folders)
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

" what is the name of the directory containing this file?
let s:portable = fnamemodify(resolve(expand('<sfile>')), ":p:h")

" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)

set nocompatible
set number
syntax on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set ignorecase
set smartcase
set incsearch
set hlsearch
" <Ctrl-l> removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR>
set autoindent
set background=dark

" wildmenu enables a menu at the bottom
set wildmenu
set wildmode=list:longest,full
set wildignore+=.git,.svn,_build,tnglogs,*.class,*.o,*.obj

" keep visible lines around current lines
set scrolloff=3
set ruler

" persistent undo hist
set undofile

" allow backspacing over everything
set backspace=indent,eol,start

" make j, k work with wrapped lines
nnoremap j gj
nnoremap k gk

" mapping jj to esc
inoremap jj <ESC>

" use the same symbols as TextMate for tabstops and EOLs
set listchars=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail:•

" make regex consistent in search
nnoremap / /\v
vnoremap / /\v

" vundle and plugins stuff
filetype off

let s:vundle_path = s:portable . '/bundle/Vundle.vim'
execute 'set rtp+=' . s:vundle_path
call vundle#begin(s:portable . '/bundle')

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"
" repos on github
Plugin 'ciaranm/inkpot'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'mileszs/ack.vim'
Plugin 'sjl/gundo.vim'
Plugin 'basepi/vim-conque'
"Plugin 'ivanov/vim-ipython'
Plugin 'vim-scripts/netrw.vim'
"Plugin 'ervandew/screen'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/a.vim'
"Plugin 'gregsexton/gitv'
"Plugin 'int3/vim-extradite'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'jpalardy/vim-slime'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'chazy/cscope_maps'
Plugin 'jnwhiteh/vim-golang'
"Plugin 'tranngocthachs/gtags-cscope-vim-plugin'
Plugin 'mattdenner/vim-scala'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-dispatch'
Plugin 'gavinbeatty/dragvisuals.vim'
Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'rizzatti/dash.vim'
Plugin 'lyuts/vim-rtags'
Plugin 'embear/vim-foldsearch'
Plugin 'godlygeek/tabular'


" vim-scripts repos
Plugin 'Wombat'
Plugin 'taglist.vim'
" non github repos
Plugin 'git://git.wincent.com/command-t.git'

call vundle#end()
filetype plugin indent on     " required!


" File type stuff
au FileType text setlocal tw=100 spell spelllang=en_us
au FileType tex setlocal tw=100 spell spelllang=en_us
au BufRead,BufNewFile *.md set filetype=markdown
au FileType markdown setlocal tw=100 spell spelllang=en_us
au FileType text setlocal tw=100 spell spelllang=en_us
let g:tex_flavor='latex'
au FileType ruby setlocal tw=100 ts=2 sts=2 sw=2
au FileType python setlocal tw=0 ts=4 sts=4 sw=4
set colorcolumn=100

" remap <leader>
let mapleader = ","

" colorscheme settings
colorscheme solarized

" super tab
let g:SuperTabDefaultCompletionType = "context"

" command-t settings
let g:CommandTMaxFiles = 100000
let g:CommandTMaxHeight = 20

" remap key for gundo
map <leader>g :GundoToggle<CR>

" remap key for nerdtree
map <leader>n :NERDTreeToggle<CR>

" auto close preview omni complete window
autocmd CursorMovedI * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif

" fast-mode for conque term
let g:ConqueTerm_FastMode = 1

" command for a conque ipython console
command! IPyConsole ConqueTermSplit ipython console --colors=Linux
command! IPyConsoleV ConqueTermVSplit ipython console --colors=Linux

" a.vim stuff
nmap <Leader>a :A<CR>
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:api,sfr:..'

" system clipboard
"set clipboard=unnamed

" key map for yrshow
nnoremap <silent> <Leader>p :YRShow<CR>

" enable gtags
" let GtagsCscope_Auto_Load = 1
" let GtagsCscope_Auto_Map = 1
" let GtagsCscope_Quiet = 1
set cscopetag cscopeverbose

" loading of system specific settings
if filereadable(s:portable . '/.local_vimrc')
    execute 'source ' . s:portable . '/.local_vimrc'
endif

" turn on reading of project's specific .vimrc
set exrc
set secure

" work-around incomplete terminfo databases
" particulalry useful when under `screen`, which may or may not be attached
" to a physical terminal capable of 256color mode.
if match($TERMCAP, 'Co#256:') != -1
    set t_Co=256
endif

" central folder for swp, backup, and undo files
set backupdir=~/tmp//,/tmp//
set directory=~/tmp//,/tmp//
set undodir=~/tmp//,/tmp//

" using cpaste for slime-ipython sending
let g:slime_python_ipython = 1

" Leader-m to make
command! MakeCOpen make! | copen
map <Leader>m :Make<CR>

" set slime to use tmux
let g:slime_target = "tmux"

" turn on spell check
set spell
set spelllang=en_us,en_gb

" syntastic mode should be passive
let g:syntastic_mode_map = {'mode': 'passive'}

" dragvisuals stuff
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" disable whitespace highlighting by default
let g:better_whitespace_enabled = 0

" ack stuff
map <Leader>s :Ack!<CR>
map <Leader>ss :AckFromSearch!<CR>
"let g:ack_use_dispatch = 1
