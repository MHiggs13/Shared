source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
cd Documents\ 
" Font setting for gVium
set guifont=Consolas:h11:cANSI

" Colorscheme
set t_Co=256
set background=dark
colorscheme gruvbox
let g:gruvbox_termcolors=256
let g:airline_theme="wombat"

" PATHOGEN
execute pathogen#infect()

set nocompatible

filetype indent plugin on
set backspace=indent,eol,start " backspace through anything in insert mode
set scrolloff=1       " always shows at least one line above/below cursor
set autoread        " autoload file changes, can undo by pressing u
set cursorline


syntax on

set showcmd

set autoindent

" Stop certain movements from always going to the first character of a line
set nostartofline

" Display cursor position at last line of screen
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Visual bell isntead of a sound in case of failing a command
set visualbell

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Indentation
set shiftwidth=4
set softtabstop=4
set expandtab

" SEARCHING
set incsearch        " search as characters are entered
set hlsearch        " highlight matches, :nohlsearch to remove highlights

"FOLDING
set foldenable		" enable folding
set foldlevelstart=10	" open most folds by default
set foldnestmax=10	" 10 nested fold max
set foldmethod=manual	" fold based on indent level

"MOVEMENT
" nnoremap j gj		" move vertically by visually line
" nnoremap k gk		" 
" nnoremap gV `[v`]	" highight last inserted text

"SPLITTING
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Numbers
set relativenumber

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '"SPLITTING
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

