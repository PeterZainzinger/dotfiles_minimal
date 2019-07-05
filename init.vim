" -------------------------------------------
"  Basic
" -------------------------------------------
filetype plugin on
set t_Co=256
syntax on

let mapleader = ','			
set cursorline
set cursorcolumn
set noswapfile
set number 
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set showmatch
set modifiable
set splitright
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
set nocompatible
set showmode
set clipboard+=unnamedplus
set backspace=indent,eol,start
set autoindent 
set hlsearch
set nofoldenable

" -------------------------------------------
"  Plugin
" -------------------------------------------


call plug#begin('~/.config/nvim/plugged')
Plug 'ericbn/vim-solarized'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/nerdcommenter'
Plug 'Chiel92/vim-autoformat'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'

Plug 'stephpy/vim-yaml'
Plug 'ekalinin/Dockerfile.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/deoplete.nvim'
call plug#end()


" -------------------------------------------
"  Theme
" -------------------------------------------

"set background=dark
set background=light
colorscheme solarized
hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235

set statusline=%=\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2
set noshowmode

" -------------------------------------------
"  Plugin Config
" -------------------------------------------

let g:NERDTreeDirArrows=0


command! Vimrc :vs $MYVIMRC
command! VimReload :source $MYVIMRC

" -------------------------------------------
" Key Bindings
" -------------------------------------------

noremap <Leader>q :q <CR>
noremap <Leader>s :w <Enter>

map <C-t> :NERDTreeToggle<CR>


if has('nvim')
  nmap <bs> :<c-u>TmuxNavigateLeft<cr>
endif

" -------------------------------------------
" Spelling 
" -------------------------------------------

command! Spellgerman execute ":setlocal spell spelllang=de_de"

let g:neoformat_haskell_hindent = {
            \ 'exe': 'hindent',
            \ 'args': ['--style johan-tibell','--line-length 80'],
            \ 'stdin' : 1,
            \ }

let g:neoformat_enabled_haskell = ['hindent']
