set nobackup
set backspace=indent,eol,start
set nostartofline
set ruler
set number
set showcmd
set showmatch
set showmode
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab ai
set viminfo=
set encoding=utf-8
set visualbell t_vb=
syntax on
colorscheme darktango

au FileType perl,c,java,yaml,cpp,ruby,scala,erl set smartindent expandtab

au FileType go set makeprg go\ build

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

:nmap <C-n> :bnext<CR>
:nmap <C-p> :bprev<CR>

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
  
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

function! PrettyXml()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction

command! Pxml call PrettyXml()
