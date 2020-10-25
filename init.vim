:let mapleader = " "

set nocompatible

call plug#begin('$HOME/.config/nvim/plugged')
Plug 'preservim/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'mileszs/ack.vim'
call plug#end()

colorscheme nord

set hidden
set number
set relativenumber
set cursorline 
set ignorecase

:nnoremap <leader>d dd
:nnoremap <leader>ag :Ag<CR>

autocmd vimenter * NERDTree
:nnoremap <C-e> :NERDTreeToggle<CR>
:nnoremap <leader>h <C-w>h 
:nnoremap <leader>l <C-w>l 
:nnoremap <leader>j <C-w>j 
:nnoremap <leader>k <C-w>k 

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \     'filename': 'LightlineFilename',
      \     'gitbranch': 'gitbranch#name'
      \ },
      \ }

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:ackprg = 'ag --vimgrep'

autocmd BufEnter * lcd %:p:h

