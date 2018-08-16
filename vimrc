
" automagically install a vim plug plugin manager
" https://github.com/junegunn/vim-plug
let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "Install curl"
    execute "q!"
  endif
  echo "Installing junegunn/vim-plug"
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Install all the plugins
call plug#begin('~/.vim/plugged')
Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'xuhdev/SingleCompile'
Plug 'Valloric/YouCompleteMe'
Plug 'flazz/vim-colorschemes'
Plug 'fatih/vim-go'
Plug 'easymotion/vim-easymotion'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'w0rp/ale'
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

set cc=80

set autoindent
set smartindent
set expandtab
set showmatch
set cursorline
set ts=4
set sts=4
set sw=4
set splitbelow
set splitright
set showcmd

" display the paste information in the status line
nnoremap <F2> :set invpaste paste?<CR>
" :set paste/nopaste toggle
set pastetoggle=<F2>

colorscheme monokain

au BufRead,BufNewFile *.csv,*.tsv, set filetype=csv
autocmd FileType csv set noexpandtab

" tabs for go and make files
autocmd FileType go set noexpandtab
autocmd FileType make set noexpandtab

" Dr Racket's defaults
autocmd FileType racket set ts=2 sts=2 sw=2
autocmd FileType html set ts=2 sts=2 sw=2

" please don't put comments at the start of the line for python
au! FileType python setl nosmartindent

set nu
syntax on
filetype on
filetype plugin on

let mapleader=","
imap jj <esc>
imap <Leader>p import pdb; pdb.set_trace()<enter><esc>
noremap <Leader>p oimport pdb; pdb.set_trace()<esc>

" spell check
set spell spelllang=en_us
hi clear SpellBad
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare
hi SpellBad cterm=underline ctermfg=red

" word wrapping on cursor movement
set whichwrap+=<,>,h,l,[,]

" 256 color term
set t_Co=256

" switching between panes easier
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" tab control
noremap <leader>x :tabnext<CR>
noremap <leader>z :tabprevious<CR>
noremap <leader>n :tabnew<CR>
noremap <leader>q :tabclose<CR>


"""""""""""""""""""""""""""""
"          plugins          "
"""""""""""""""""""""""""""""

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
highlight ExtraWhitespace ctermbg=blue

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

" ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_fixers = {
\   'python': [
\       'isort',
\   ],
\}
let g:ale_fix_on_save = 1
