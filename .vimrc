set nocompatible
set number
syntax on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set autoindent
set background=dark

" wildmenu enables a menu at the bottom
set wildmenu
set wildmode=list:longest,full

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" vundle and plugins stuff
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

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
Bundle 'mileszs/ack.vim'
Bundle 'sjl/gundo.vim'
Bundle 'rson/vim-conque'
Bundle 'ivanov/vim-ipython'
Bundle 'vim-scripts/netrw.vim'
Bundle 'ervandew/screen'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/a.vim'
Bundle 'gregsexton/gitv'
Bundle 'int3/vim-extradite'

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

" remap key for gundo
map <leader>g :GundoToggle<CR>

" remap key for nerdtree
map <leader>n :NERDTreeToggle<CR>

" remap motion key for camelcase
" map w <Plug>CamelCaseMotion_w
" map b <Plug>CamelCaseMotion_b
" map e <Plug>CamelCaseMotion_e
" sunmap w
" sunmap b
" sunmap e
" 
" omap iw <Plug>CamelCaseMotion_iw 
" xmap iw <Plug>CamelCaseMotion_iw 
" omap ib <Plug>CamelCaseMotion_ib 
" xmap ib <Plug>CamelCaseMotion_ib 
" omap ie <Plug>CamelCaseMotion_ie 
" xmap ie <Plug>CamelCaseMotion_ie

set ignorecase
set smartcase
set incsearch

" command for a conque ipython console
command! IPyConsole ConqueTermSplit ipython console --colors=Linux
command! IPyConsoleV ConqueTermVSplit ipython console --colors=Linux
