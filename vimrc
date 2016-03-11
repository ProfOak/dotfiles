" vim plug plugin manager
"
" https://github.com/junegunn/vim-plug
" :source %
" :PlugInstall
call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'wlangstroth/vim-racket'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'itchyny/lightline.vim'

" vim-snipmate
call plug#end()

set autoindent
set smartindent
set expandtab
set showmatch
set cursorline
set ts=4
set sts=4
set sw=4
set laststatus=2

" tabs for go and make files
autocmd FileType go set noexpandtab
autocmd FileType make set noexpandtab

" I like Dr Racket's defaults
autocmd FileType racket set ts=2 sts=2 sw=2

set nu
syntax on
filetype on
filetype plugin on

let mapleader=","
imap jj <esc>

" word wrapping on cursor movement
set whichwrap+=<,>,h,l,[,]

" 256 color term
set t_Co=256

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


""""""""""""""""""""""""""""
"       plugins
"
""""""""""""""""""""""""""""

" vim-lightline
let g:lightline = {}
let g:lightline.colorscheme = 'wombat'

" rainbow-parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" rainbow-parentheses color definitions
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

" Tagbar
nmap <F8> :TagbarToggle<CR>

" SingleCompile
imap <F6> <esc>:w<cr>:SCCompile<cr>
imap <F5> <esc>:w<cr>:SCCompileRun<cr>
nmap <F6> :SCCompile<cr>
nmap <F5> :SCCompileRun<cr>

