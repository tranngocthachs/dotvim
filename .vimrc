set number
syntax on
set ts=4
set shiftwidth=4
filetype on
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
colorscheme wombat
set wildmenu
set expandtab
filetype plugin on
au FileType text setlocal tw=78 spell spelllang=en_gb
au FileType tex setlocal tw=78 spell spelllang=en_gb
set shellslash
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'
au FileType ruby setlocal ts=2 sts=2 sw=2
au FileType python setlocal ts=4 sts=4 sw=4
let g:SuperTabDefaultCompletionType = "context"
