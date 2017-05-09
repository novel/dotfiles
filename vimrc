set nocompatible
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=72

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

set nobackup
set noerrorbells
set showcmd
set showmode
set incsearch
set laststatus=2 
set magic
set shell=zsh
set ttyfast
" various options for a tab stop of 8 spaces.
" set cinoptions=>8
" set shiftwidth=8
" set tabstop=8
" set softtabstop=8

set  wildmenu
set  wcm=<Tab>
menu Enc.cp1251     :e ++enc=cp1251<CR>
menu Enc.koi8-r     :e ++enc=koi8-r<CR>
menu Enc.cp866      :e ++enc=ibm866<CR>
menu Enc.utf-8      :e ++enc=utf-8<CR>
menu Enc.ucs-2le    :e ++enc=ucs-2le<CR>
map  <C-e> :emenu Enc.<Tab>

"<Shift+F8> Convert file encoding
set  wildmenu
set  wcm=<Tab>
menu FEnc.cp1251    :set fenc=cp1251<CR>
menu FEnc.koi8-r    :set fenc=koi8-r<CR>
menu FEnc.cp866     :set fenc=ibm866<CR>
menu FEnc.utf-8     :set fenc=utf-8<CR>
menu FEnc.ucs-2le   :set fenc=ucs-2le<CR>
map  <C-f> :emenu FEnc.<Tab> 

menu Tabs.Prev	:bp<CR>
menu Tabs.Next	:bn<CR>
menu Tabs.List	:buffers<CR>

map <C-q> :emenu Tabs.<Tab>

map <C-1>  :buffers

map <A-1> :NERDTreeToggle <CR>
imap <A-1> <ESC> :NERDTreeToggle <CR>

nmap <tab> :bn<cr>
nmap <s-tab> :bp<cr>

if $OS == "Linux"
	"display tabs and trailing spaces
	set list
	set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
endif
colorscheme desert
"
" mappings for tabs
map <C-T>t	:tabnew<cr>
map <C-T>w	:tabclose<cr>
map <C-T>n	:tabnext<cr>
map <C-T>p	:tabprevious<cr>

" autocmd
autocmd FileType mail setlocal spell spelllang=en,ru
autocmd FileType gitcommit,txt,tex setlocal spell spelllang=en,ru
autocmd FIleType php,sh,python set nu
autocmd FileType python call PythonStuff()
autocmd FileType cpp call CppStuff()
autocmd FileType html setl noai nocin nosi inde=
" devilspie
autocmd BufRead *.ds setlocal ft=lisp
" set ts=4
"
function PythonStuff()
	set nu
	set ts=4 et sw=4
endfunction

function CppStuff()
	set nu
endfunction
