
" vim plug plugin manager
" https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'wlangstroth/vim-racket'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'valloric/youcompleteme'
Plug 'scrooloose/nerdtree'
Plug 'xuhdev/SingleCompile'

call plug#end()

" this is my 'theme'
" tab bar colors
hi TabLine     ctermfg=White ctermbg=none cterm=none
hi TabLineSel  ctermfg=Red   ctermbg=none cterm=none
hi TabLineFill ctermfg=none  ctermbg=none cterm=none

" status bar
hi statusline ctermfg=Red ctermbg=none cterm=none
set laststatus=2
set statusline=%<%f\ %h%M%r%=%-14.(%l,%c%V%)\ %p%%

set autoindent
set smartindent
set expandtab
set showmatch
set cursorline
set ts=4
set sts=4
set sw=4

" tabs for go and make files
autocmd FileType go set noexpandtab
autocmd FileType make set noexpandtab

" Dr Racket's defaults
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

" spell check
set spell spelllang=en_us
hi clear SpellBad
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare
hi SpellBad cterm=underline ctermfg=red

" switching between panes easier
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" tab control
noremap <Leader>x :tabnext<CR>
noremap <Leader>z :tabprevious<CR>
noremap <leader>n :tabnew<CR>
noremap <leader>q :tabclose<CR>


""""""""""""""""""""""""""""
"       plugins
"
""""""""""""""""""""""""""""


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

" ycm
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

