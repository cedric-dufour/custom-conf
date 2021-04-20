"" CUSTOM-CONF: File automatically created/updated [custom-root-env]

" Syntax highlighting
if has("autocmd")
  syntax on
  set background=dark
  " ... tabs
  highlight CustomMatchTabs ctermbg=236
  if has("autocmd")
    autocmd Syntax * syntax match CustomMatchTabs /\t/ containedIn=ALL
  endif
  " ... trailing spaces
  highlight CustomMatchTrailing ctermbg=Red
  if has("autocmd")
    autocmd Syntax * syntax match CustomMatchTrailing /\s\+$/ containedIn=ALL
  endif
  " ... 80-chars (limit)
  highlight Custom80Chars ctermbg=Red
  if has("autocmd")
    autocmd Syntax * syntax match Custom80Chars /\%81v./ containedIn=ALL
  endif
endif

" Automatic indentation
if has("autocmd")
  filetype plugin indent on
endif

" Remember last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Miscellaneous
set ignorecase
set modeline
set paste
set ruler
set showmatch

