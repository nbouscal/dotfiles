" This is Nathan Bouscal's .vimrc file

call pathogen#infect()

" Basic settings
set nocompatible
set hidden
set history=1000
set ruler
set number
set numberwidth=3
set foldcolumn=1 
set foldenable
set cmdheight=2
set laststatus=2
set showcmd
set cursorline
set backspace=indent,eol,start
set wildmenu
set scrolljump=5
set scrolloff=3
filetype plugin indent on
syntax on

" Window sizing
set winwidth=80
set winheight=5
set winminheight=5
set winheight=999

" Searching
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase

" Indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent

" Backup and undo storage
set backup
set undofile
set backupdir=~/.vim/tmp
set undodir=~/.vim/tmp
set directory=~/.vim/tmp

" Set colorscheme
:set background=dark
:set t_Co=256
:color solarized

" No arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Autocmds
augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()
augroup END

" Keymaps
let mapleader = ','
nnoremap <c-h> <c-w>h<c-w>_
nnoremap <c-j> <c-w>j<c-w>_
nnoremap <c-k> <c-w>k<c-w>_
nnoremap <c-l> <c-w>l<c-w>_
imap <c-c> <esc>
nnoremap <leader><leader> <c-^>
nnoremap ; :
nnoremap Y y$

function! MapCR()
    nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Command-T keymaps
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>
map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>

" Set up Racket REPL
map <leader>m :w<cr>:!rlwrap /usr/local/racket/bin/racket -t "%" -l racket/base -i<cr><c-d>

" Multipurpose Tab key
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Unicode lambdas
au VimEnter * syntax keyword Statement lambda conceal cchar=λ containedin=ALL
au VimEnter * hi! link Conceal Statement
au VimEnter * set conceallevel=2
