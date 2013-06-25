set nocompatible

" neobundler
if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" let neobundle manage itself
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'tpope/vim-fugitive'

filetype plugin indent on

NeoBundleCheck

set nobackup
set backspace=indent,eol,start
set nostartofline
set ruler
set number
set showcmd
set showmatch
set showmode
set et
set tabstop=4 softtabstop=4 shiftwidth=4 ai
set encoding=utf-8
set visualbell t_vb=
syntax on

autocmd Filetype ruby setlocal et ts=2 sts=2 sw=2
autocmd Filetype java setlocal et ts=4 sts=4 sw=4

augroup Mail
	au!
	au FileType mail set tw=68 fc=tcqr2 nomodeline et
	au FileType mail set comments+=n:\|
augroup END

"show/hide invisible chars with \l
nmap <leader>l :set list!<CR>
" set which chars show in place of tabs, eol, etc
set listchars=tab:▸\ ,eol:¬
"make invisible chars just visible
highlight NonText guifg=#4a4a4a
highlight SpecialKey guifg=#4a4a4a

" It's 2012.
noremap j gj
noremap k gk
noremap gj j
noremap gk k

set smartindent

" nerdtree
:nmap <leader>e :NERDTreeToggle<cr>

" CtrlP
nnoremap <c-p> :CtrlP<cr>

" vim-fugitive
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Git push<cr>

" surround
:map <leader>q" gewi"<esc>ea"<esc>

"show/hide invisible chars with \l
nmap <leader>l :set list!<cr>
" set which chars show in place of tabs, eol, etc
set listchars=tab:▸\ ,eol:¬
"make invisible chars just visible
highlight NonText guifg=#4a4a4a
highlight SpecialKey guifg=#4a4a4a

color desert

" quickly move lines up and down
nnoremap _ ddp
nnoremap - ddkP

" uppercase the current word
nnoremap <c-u> viwU
" lowercase the current word
nnoremap <c-s-u> viwu

" quick edit vimrc
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

" remap jk to <esc>
inoremap kj <esc>

" map <esc> to noop to train myself
inoremap <esc> <nop>

nnoremap <c-a> ggvG

autocmd InsertLeave *.pde :write

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction
  
colorscheme af
colors af
