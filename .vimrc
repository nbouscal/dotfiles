set nocompatible

" Plugins
call plug#begin()

Plug 'nbouscal/vim-stylish-haskell'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-dispatch'
Plug 'altercation/vim-colors-solarized'
Plug 'wikitopian/hardmode'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'lucapette/vim-textobj-underscore'
Plug 'kana/vim-textobj-entire'
Plug 'godlygeek/tabular'
Plug 'wakatime/vim-wakatime'
Plug 'AndrewRadev/splitjoin.vim'

call plug#end()
filetype plugin indent on

" Basic settings
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
set nrformats-=octal
set wildmenu
set wildmode=list:longest,full
set scrolljump=5
set scrolloff=3
set list listchars=tab:▸\ ,trail:·
set autoread
set fileformats+=mac
syntax on
set synmaxcol=250
set clipboard^=unnamed

" Window sizing
set winwidth=78
set textwidth=78
set winheight=5
set winminheight=5

" Searching
set showmatch
set incsearch
set hlsearch
set ignorecase smartcase

" Indentation
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround

augroup filetypes
  au!

  autocmd filetype make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd filetype html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd filetype css setlocal ts=2 sts=2 sw=2 expandtab
augroup END

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
colorscheme solarized

" No arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Autocmds
augroup vimrcEx
  au!
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

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <silent> [b :bprevious<cr>
nnoremap <silent> ]b :bnext<cr>
nnoremap <silent> [B :bfirst<cr>
nnoremap <silent> ]B :blast<cr>

nnoremap <leader><leader> <c-^>
nnoremap Y y$
nnoremap & :&&<CR>
xnoremap & :&&<CR>

nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$

nnoremap go o<Esc>k
nnoremap gO O<Esc>j

nnoremap <leader>l :ls<cr>:b<space>

function! MapCR()
    nnoremap <silent> <cr> :nohlsearch<cr>
endfunction
call MapCR()

cnoremap w!! %!sudo tee %

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
map <leader>v :view %%

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

inoremap <C-l> <C-v>u3bb<Space>
inoremap <C-f> <C-v>u192<Space>
inoremap <C-t> <C-v>u2192<Space>

imap <buffer> \forall ∀
imap <buffer> \to →
imap <buffer> \lambda λ
imap <buffer> \Sigma Σ
imap <buffer> \exists ∃
imap <buffer> \equiv ≡
imap <buffer> \nat ℕ
imap <buffer> \times ×
imap <buffer> \circ ◦
