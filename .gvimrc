set anti
colorscheme solarized
set go-=T
set nomousehide
if has("gui_macvim")
    set guifont=Monaco:h11
    set fuoptions=maxvert,maxhorz
    set transparency=8
elseif has('unix') && has('gui_running')
    set guifont=DejaVu\ Sans\ Mono\ 10
endif
