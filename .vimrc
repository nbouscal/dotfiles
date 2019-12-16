" This is Nathan Bouscal's .vimrc file

set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'nbouscal/vim-stylish-haskell'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-dispatch'
Plugin 'vim-ruby/vim-ruby'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'sjl/gundo.vim'
" Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'wikitopian/hardmode'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'
Plugin 'lucapette/vim-textobj-underscore'
Plugin 'kana/vim-textobj-entire'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'godlygeek/tabular'
" Plugin 'scrooloose/syntastic'
" Plugin 'bitc/vim-hdevtools'
" Plugin 'laurilehmijoki/haskellmode-vim'
" Plugin 'Twinside/vim-hoogle'
" Plugin 'dahu/SearchParty'
Plugin 'w0rp/ale'
Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'prophittcorey/vim-flay'
Plugin 'wakatime/vim-wakatime'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'idris-hackers/idris-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'hashivim/vim-terraform'
Plugin 'chr4/nginx.vim'
Plugin 'vmchale/dhall-vim'
Plugin 'nvie/vim-flake8'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'leafgarland/typescript-vim'

call vundle#end()

" vim-plug

call plug#begin('~/.vim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

call plug#end()

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
set winwidth=84
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

  autocmd BufNewFile,BufRead *.tsx set filetype=typescript

  autocmd filetype make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd filetype asm setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd filetype yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd filetype html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd filetype css setlocal ts=2 sts=2 sw=2 expandtab

  autocmd filetype rust map <buffer> <leader>t :w<cr>\|:!cargo run<cr>

  autocmd filetype haskell,dhall imap <buffer> \forall ∀
  autocmd filetype haskell,dhall imap <buffer> \to →
  autocmd filetype haskell,dhall imap <buffer> \lambda λ
  autocmd filetype haskell,dhall imap <buffer> \Sigma Σ
  autocmd filetype haskell,dhall imap <buffer> \exists ∃
  autocmd filetype haskell,dhall imap <buffer> \equiv ≡
  autocmd filetype haskell,dhall imap <buffer> \nat ℕ
  autocmd filetype haskell,dhall imap <buffer> \times ×
  autocmd filetype haskell,dhall imap <buffer> \circ ◦
  autocmd filetype haskell,dhall imap <buffer> \merge ⫽
  autocmd filetype haskell,dhall imap <buffer> \meet ∧
  autocmd filetype haskell,dhall imap <buffer> \Meet ⩓

  autocmd filetype dhall map <leader>df :%!dhall format<cr>


  " LanguageClient mappings only for languages we have LSP servers for
  autocmd filetype haskell,rust nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<CR>
  autocmd filetype haskell,rust nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>


  if executable('grip')
    autocmd filetype markdown nnoremap <buffer> <leader>om :Dispatch grip -b %<cr>
  endif
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

" No arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

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

" map <leader>u :GundoToggle<cr>
" map <leader>d :DiffOrig<cr>

" let g:UltiSnipsExpandTrigger="<c-J>"

" Command-T Rails keymaps
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


"""""""
" FZF "
"""""""

let g:fzf_buffers_jump = 1

map <leader>gf :Files<cr>
map <leader>gg :GFiles<cr>
map <leader>gh :History<cr>

map <leader>sf :Rg 
map <leader>sl :Lines 
map <leader>sb :BLines 

map <leader>: :History:<cr>
map <leader>/ :History/<cr>
" map <leader>sn :Snippets<cr>

map <leader>ca :Commits<cr>
map <leader>cb :BCommits<cr>

nnoremap <leader>l :Buffers<cr>

"""

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

" Multipurpose Tab key
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     else
"         return "\<c-p>"
"     endif
" endfunction
" inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <s-tab> <c-n>

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

" map <leader>t :HdevtoolsType<cr>

" let g:haddock_browser="open"
" let g:haddock_browser_callformat = "%s %s"

" function! s:FindCabalSandbox()
"    let l:sandbox    = finddir('.cabal-sandbox', './;../')
"    let l:absSandbox = fnamemodify(l:sandbox, ':p')
"    return l:absSandbox
" endfunction

" function! s:FindCabalSandboxPackageConf()
"    return glob(s:FindCabalSandbox() . '*-packages.conf.d')
" endfunction

" function! s:HaskellSourceDir()
"    return fnamemodify(s:FindCabalSandbox(), ':h:h') . '/src'
" endfunction

" function! s:HdevtoolsSocketFile()
"    return s:HaskellSourceDir() . '/.hdevtools.sock'
" endfunction

" function! s:InitHdevtoolsVars()
"    let g:hdevtools_options  = '-g-package-conf=' . s:FindCabalSandboxPackageConf()
"    let g:hdevtools_options .= ' -g-i'. s:HaskellSourceDir()
"    let g:hdevtools_options .= ' -g-Wall -g-Werror -g-Wno-warn-unused-binds'
"    let g:hdevtools_options .= ' --socket=' . s:HdevtoolsSocketFile()
" endfunction

" augroup hdevtools
"   au!
"   autocmd! Bufenter *.hs :call s:InitHdevtoolsVars()
" augroup END


let hs_highlight_delimiters = 1
let hs_highlight_boolean = 1
let hs_highlight_types = 1
let hs_highlight_more_types = 1
let hs_highlight_debug = 1

colorscheme solarized

let g:hlint_options = "--hint=.githooks/hlint.yaml"
let g:ale_haskell_hlint_options = "--hint=.githooks/hlint.yaml"
let g:stylish_haskell_options = ["-c .githooks/stylish-haskell.yaml"]

let g:ale_linters = { 'haskell': ['hlint'] }
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], 'javascript': ['prettier'], 'typescript': ['prettier'], 'haskell': [] }
let g:ale_fix_on_save = 1


" LSP servers

set hidden

let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'haskell': ['cabal', 'exec', '--', 'ghcide', '--lsp'],
    \ }
