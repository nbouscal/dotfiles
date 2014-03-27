" This is Nathan Bouscal's .vimrc file

set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-ragtag'
Bundle 'vim-ruby/vim-ruby'
Bundle 'altercation/vim-colors-solarized'
Bundle 'sjl/gundo.vim'
Bundle 'mattn/emmet-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'
Bundle 'wikitopian/hardmode'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-line'
Bundle 'lucapette/vim-textobj-underscore'
Bundle 'kana/vim-textobj-entire'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/syntastic'
Bundle 'bitc/vim-hdevtools'

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
set wildmode=list,full
set scrolljump=5
set scrolloff=3
set list listchars=tab:▸\ ,trail:·
set autoread
set fileformats+=mac
filetype plugin indent on
syntax on

" Window sizing
set winwidth=80
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

autocmd filetype make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd filetype css setlocal ts=2 sts=2 sw=2 expandtab

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
    nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

cnoremap w!! %!sudo tee %

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
map <leader>v :view %%

map <Leader>u :GundoToggle<CR>

" Command-T keymaps
" map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
" map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>
" map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
" map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
" map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
" map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
" map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
" map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
" map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>
" map <leader>gr :topleft :split config/routes.rb<cr>
" map <leader>gg :topleft 100 :split Gemfile<cr>

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

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
