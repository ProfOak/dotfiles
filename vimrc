
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

set encoding=utf-8

" Install all the plugins
call plug#begin('~/.vim/plugged')
Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'xuhdev/SingleCompile'
"Plug 'flazz/vim-colorschemes'
Plug 'fatih/vim-go'
Plug 'easymotion/vim-easymotion'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'w0rp/ale'
" Plug 'bluz71/vim-moonfly-colors'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'rking/ag.vim'
"Plug 'elixir-editors/vim-elixir'
Plug 'ziglang/zig.vim'
Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdtree'

Plug 'Valloric/YouCompleteMe'
Plug 'vimwiki/vimwiki'
Plug 'Yggdroot/indentLine'
call plug#end()

set nu
"syntax enable
filetype on
filetype plugin on

" this is my 'theme'
" tab bar colors
highlight TabLine     ctermfg=White ctermbg=none cterm=none
highlight TabLineSel  ctermfg=Red   ctermbg=none cterm=none
highlight TabLineFill ctermfg=none  ctermbg=none cterm=none

" status bar
highlight statusline ctermfg=Red ctermbg=none cterm=none
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
set smartcase
set modelines=0
set nomodeline
set number relativenumber

set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

set termguicolors

" display the paste information in the status line
nnoremap <F2> :set invpaste paste?<CR>
" :set paste/nopaste toggle
set pastetoggle=<F2>

"colorscheme monokain
"colorscheme moonfly
" Set dracula_italic before changing the colorscheme to disable bg highlights
"let g:dracula_colorterm = 0
"let g:dracula_italic = 0
"colorscheme dracula
colorscheme catppuccin_mocha
"highlight Normal guibg=NONE ctermbg=NONE
"highlight NonText ctermbg=none

" brighter purple
"highlight Comment ctermfg=104
autocmd BufRead,BufNewFile *.csv,*.tsv, set filetype=csv
autocmd FileType csv set noexpandtab

autocmd BufRead,BufNewFile *.sls set filetype=yaml
autocmd BufRead,BufNewFile *.asm set filetype=nasm nospell

" tabs for go and make files
autocmd FileType go set noexpandtab
autocmd FileType make set noexpandtab

" Go does CamelCase instead of underscore, so identifiers often get marked as mistakes.
autocmd FileType go set nospell

" 2 spaces instead of 4 spaces
autocmd FileType racket set ts=2 sts=2 sw=2
autocmd FileType html set ts=2 sts=2 sw=2
autocmd FileType yaml set ts=2 sts=2 sw=2
autocmd FileType json set ts=2 sts=2 sw=2

" please don't put comments at the start of the line for python
au! FileType python setl nosmartindent

let mapleader=","
imap jj <esc>

" python quick pdb
imap <Leader>p import pdb; pdb.set_trace()<enter><esc>
noremap <Leader>p oimport pdb; pdb.set_trace()<esc>

" go quick fill structs
imap <Leader>f <esc> :GoFillStruct<enter>
noremap <Leader>f :GoFillStruct<enter>

" spell check
set spell spelllang=en_us
highlight clear SpellBad
highlight clear SpellCap
highlight clear SpellLocal
highlight clear SpellRare
highlight SpellBad cterm=underline ctermfg=red

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

" Center the cursor after every up/down.
noremap j jzz
noremap k kzz
"""""""""""""""""""""""""""""
"          plugins          "
"""""""""""""""""""""""""""""

" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitelines_at_eof=1
let g:strip_whitespace_confirm=0
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
let g:ycm_gopls_binary_path = "$GOPATH/bin"

" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_auto_type_info = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_imports_autosave = 1
let g:go_doc_keywordprg_enabled = 1
let g:go_fmt_command="gopls"
let g:go_gopls_gofumpt=1

"let g:deoplete#enable_at_startup = 1

" ale
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s'

" astyle needs an ~/.astylerc because the defaults are not very opinionated.
let g:ale_fixers = {
\   'python': [
\       'isort',
\       'black',
\   ], 'sh': [
\       'shfmt',
\   ], 'c': [
\       'clang-format',
\   ], 'cpp': [
\       'clang-format',
\   ], 'html': [
\       'prettier',
\   ], 'javascript': [
\       'prettier',
\   ], 'typescript': [
\       'prettier',
\   ], 'yaml': [
\       'prettier',
\   ]
\}
"let g:ale_python_isort_options="--black"
let g:ale_fix_on_save = 1
let g:ag_working_path_mode = 'r'
let g:ale_nasm_nasm_options = '-f 64'
let g:ale_sh_shfmt_options  = '-i=4'
let g:ale_go_golangci_lint_package = 1

"nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFocus<CR>
let g:NERDTreeFileLines = 1

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:rustfmt_autosave = 1
