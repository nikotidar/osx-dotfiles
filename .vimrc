highlight Pmenu guifg=#1a1a1a guibg=#98b1c7
set backspace=2
syntax on
set number
set autoindent
filetype indent on
set ai
set si
set relativenumber

hi vertsplit ctermfg=black ctermbg=235
hi StatusLine ctermfg=black ctermbg=237
hi StatusLineNC ctermfg=black ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=4
hi clear SignColumn
hi Terminal guibg=red guifg=red
hi SignColumn ctermbg=235
hi Directory guifg=#FF0000 ctermfg=cyan
hi SignColumn ctermbg=235
hi NonText ctermfg=237
hi LineNr ctermfg=239
hi PreProc ctermfg=blue
hi Type ctermfg=green
hi Constant ctermfg=magenta
hi Identifier ctermfg=red
hi StartifyNumber ctermfg=red
hi StartifyFile ctermfg=magenta
hi StartifyBracket ctermfg=red
hi StartifyHeader ctermfg=red
hi TabLineFill ctermfg=black ctermbg=black
hi TabLine ctermfg=gray ctermbg=black
hi TabLineSel ctermfg=blue ctermbg=black

set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab

let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ "\<c-V>" : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ "<c-S>" : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

set statusline=
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\     " The current mode
set statusline+=%1*\ %<%F\                                  " File path
set statusline+=\ %1*\                                      " Padding & switch colour
set statusline+=%y                                          " File type
set statusline+=\ %2*\                                      " Padding & switch colour
set statusline+=%=                                          " Switch to right-side
set statusline+=\ %3*\                                      " Padding & switch colour
set statusline+=%02l/%L\ :\ %02v\ %0*                       " Postition and line numbers

set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2
set noshowmode
