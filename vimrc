set autoindent
set smartindent
set expandtab
set showmatch
set ts=4
set sts=4 
set sw=4

" tabs for go and make files
autocmd FileType go set noexpandtab
autocmd FileType make set noexpandtab
autocmd FileType racket set ts=2 sts=2 sw=2

colorscheme wombat

set nu
syntax on
filetype on 
filetype plugin on 
"filetype plugin indent off

" thank you based tim pope
execute pathogen#infect()

let mapleader=","

" switching between panes easier
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" maximum buffer control
noremap <F2> :buffers<CR>:buffer<Space>
noremap <Leader>z :bNext<CR>
noremap <Leader>x :bprevious<CR>
noremap <Leader><tab> <C-^>
noremap <Leader>1 :b 1<CR>
noremap <Leader>2 :b 2<CR>
noremap <Leader>3 :b 3<CR>
noremap <Leader>4 :b 4<CR>
noremap <Leader>5 :b 5<CR>

" vim airline/statusbar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '>'


" rainbow-parentheses
" I started using Racket 
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" have to edit these colors to match the background
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

