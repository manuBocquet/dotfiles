""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file 
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

"Show matching brackets
set showmatch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 10 lines to the cursor - when moving vertically using j/k
set so=10

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" Ignore case when searching
set ignorecase

" Highlight search results
"set hlsearch

" No annoying sound on errors
set noerrorbells visualbell t_vb=
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
"set si "Smart indent
set wrap "Wrap lines

nnoremap <F2> :set invpaste paste?<CR>
"set pastetoggle=<F2>
set showmode

" Smart way to move between windows
map <C-j> <C-W>j 
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <silent> <leader><LEFT> :tabnext

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>t  :tabnext<cr>

map <leader>s  :sp 
map <leader><up> <C-W><C-K>
map <leader><down> <C-W><C-J>


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"Function to show whether  you are in paste mode or not
function! HasPaste()
        if &paste
                return 'PASTE MODE  i'
        else
                return ''
        endif
endfunction

" Format the status line   
set statusline=\ \ %{HasPaste()}%f\ %m%r%h\ %w%y%=\ %02l/%02L\ 
hi StatusLine ctermbg=black ctermfg=green
