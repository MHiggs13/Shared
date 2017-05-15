set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'Vundle/Vundle.vim'

" The bundles you install will be listed here
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'davidhalter/jedi-vim'

call vundle#end()

filetype plugin on
filetype indent on

:let mapleader = ","

" The rest of your config follows here

"Colour
set t_Co=256
set bg=dark
colorscheme gruvbox 
let g:gruvbox_termcolors=256
"if filereadable(expand("~/.vimrc_background"))
    "let base16colorspace=256
    "source ~/.vimrc_background
"endif

"SYNTAX
let python_highlight_all=1
syntax on
" set textwidth=79    " lines longer than 79 characters will be broken
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftround      " round indent to multiple of 'shiftwidth'
set autoindent      " align the new line indent witht he previous line
set expandtab       " tabs are spaces

"UI CONFIG
set number	    "show line numbers
set relativenumber
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files, loads ~/.vim/indent/python.vim for *.py files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

"SEARCHING
set incsearch           " search as characters are entered
set hlsearch            " highlight matches, :nohlsearch to remove highights

"FOLDING
set foldenable		" enable folding
set foldlevelstart=10	" open most folds by default
set foldnestmax=10	" 10 nested fold max
set foldmethod=manual	" fold based on indent level

"MOVEMENT
nnoremap j gj		" move vertically by visually line
nnoremap k gk		" 
nnoremap gV `[v`]	" highight last inserted text
"SPLITTING
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"AUTOHROUP LANGS
augroup configgroup
    autocmd!
	autocmd VimEnter * highlight clear SignColumn
"	autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
"		                    \:call <SID>StripTrailingWhitespaces()
	autocmd FileType java setlocal noexpandtab
	autocmd FileType java setlocal list
	autocmd FileType java setlocal listchars=tab:+\ ,eol:-
	autocmd FileType java setlocal formatprg=par\ -w80\ -T4
	autocmd FileType php setlocal expandtab
	autocmd FileType php setlocal list
	autocmd FileType php setlocal listchars=tab:+\ ,eol:-
	autocmd FileType php setlocal formatprg=par\ -w80\ -T4
	autocmd FileType ruby setlocal tabstop=2
	autocmd FileType ruby setlocal shiftwidth=2
	autocmd FileType ruby setlocal softtabstop=2
	autocmd FileType ruby setlocal commentstring=#\ %s
	autocmd FileType python setlocal commentstring=#\ %s
	autocmd BufEnter *.cls setlocal filetype=java
	autocmd BufEnter *.zsh-theme setlocal filetype=zsh
	autocmd BufEnter Makefile setlocal noexpandtab
	autocmd BufEnter *.sh setlocal tabstop=2
	autocmd BufEnter *.sh setlocal shiftwidth=2
	autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

"PYTHON
nnoremap <silent> <F5> :!clear;python3 %<CR>
" make vim use python 3
let g:syntastic_python_python_exec = 'C:\Users\michaelh\AppData\Local\Programs\Python\Python35-32\python.exe'

"AUTOGROUP HIGHLIGHT EXCESS LINE PYTHON
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

"Powerline configuration
set encoding=utf-8
set laststatus=2
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ FixedD:h10:cANSI
"set t_Co=16
let g:Powerline_symbols = "fancy"

"Syntastic configuratioin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"anti menu garbled
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost vimrc source $MYVIMRC
  endif
