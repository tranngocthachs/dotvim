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
set wildignore+=.git,.svn,_build,tnglogs

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

let s:vundle_path = s:portable . '/bundle/vundle'
execute 'set rtp+=' . s:vundle_path
call vundle#rc(s:portable . '/bundle')

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" repos on github
Bundle 'ciaranm/inkpot'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'mileszs/ack.vim'
Bundle 'sjl/gundo.vim'
Bundle 'rson/vim-conque'
"Bundle 'ivanov/vim-ipython'
Bundle 'vim-scripts/netrw.vim'
Bundle 'ervandew/screen'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/a.vim'
Bundle 'gregsexton/gitv'
Bundle 'int3/vim-extradite'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'jpalardy/vim-slime'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'chazy/cscope_maps'
Bundle 'jnwhiteh/vim-golang'
"Bundle 'tranngocthachs/gtags-cscope-vim-plugin'
Bundle 'mattdenner/vim-scala'

" vim-scripts repos
Bundle 'Wombat'
Bundle 'taglist.vim'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required! 


" File type stuff
au FileType text setlocal tw=80 spell spelllang=en_gb
au FileType tex setlocal tw=80 spell spelllang=en_gb
let g:tex_flavor='latex'
au FileType ruby setlocal tw=80 ts=2 sts=2 sw=2
au FileType python setlocal tw=80 ts=4 sts=4 sw=4

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
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1
set cscopetag

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
map <Leader>m :MakeCOpen<CR>

" set slime to use tmux
let g:slime_target = "tmux"

" turn on spell check
set spell
set spelllang=en_us,en_gb

