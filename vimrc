
" plugins used
" pathogen
" vim-airline
" nerdcommenter
" nerdtree - Not sure if I'll keep it
" rainbow-parentheses
" vim-racket
" vim-snipmate
"

set autoindent
set smartindent
set expandtab
set showmatch
set ts=4
set sts=4 
set sw=4
set laststatus=2

" tabs for go and make files
autocmd FileType go set noexpandtab
autocmd FileType make set noexpandtab

" I like Dr Racket's defaults
autocmd FileType racket set ts=2 sts=2 sw=2


"colorscheme base16-default-bright

set nu
syntax on
filetype on 
filetype plugin on 
"filetype plugin indent off

let mapleader=","
imap jj <esc>

" used for taking notes
imap vv <esc>I=== <esc>A ===<CR>

" word wrapping on cursor movement
set whichwrap+=<,>,h,l,[,]

" 256 color term
set t_Co=256

""""""""""""""""""""""""""""
"       plugins
"
""""""""""""""""""""""""""""

execute pathogen#infect()

" switching between panes easier
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" maximum tab control
noremap <Leader>x :tabnext<CR>
noremap <Leader>z :tabprevious<CR>
noremap <Leader>1 :tabm 1<CR>
noremap <Leader>2 :tabm 2<CR>
noremap <Leader>3 :tabm 3<CR>
noremap <Leader>4 :tabm 4<CR>
noremap <Leader>5 :tabm 5<CR>
noremap <leader>n :tabnew<CR>
noremap <leader>q :tabclose<CR>

" vim airline/statusbar
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="luna"

" rainbow-parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" todo: edit the colors
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

