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
"Set paste
"set paste
set nocompatible
set undofile
set undodir=~/.vimundo

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
" no Highlight search results
set nohlsearch
" No annoying sound on errors
set noerrorbells visualbell t_vb=
" highlight nonascii
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2
highlight Visual cterm=reverse ctermbg=0 ctermfg=NONE guibg=Grey40

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
set expandtab
set ai "Auto indent
"set si "Smart indent
set wrap "Wrap lines
nnoremap <F2> :set invpaste paste?<CR>
nnoremap <F3> :set hlsearch!<CR>

"set pastetoggle=<F2>
set showmode
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Start by viewing the key code your terminal is sending to vim:
" $ sed -n l
" ^[[1;9D 

map <Esc>^[^[[C :tabn<CR>

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

" highlighting for any non ascii char.
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Git
function! StatuslineGit()
  let l:branchname = trim(system(printf("cd %s && git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'", expand('%:p:h:S'))))
  let b:branchname = strlen(l:branchname) > 0?' [ git: '.l:branchname.' ':' [ '
endfunction
autocmd BufEnter,BufWritePost * call StatuslineGit()

function! StatuslineGit2()
  let l:gitstatus = trim(system(printf("cd %s && git status --porcelain 2>/dev/null", expand('%:p:h:S'))))
  "let l:gitstatus = trim(system("git -C " . expand("%:p") . " branch --show-current 2>/dev/null"))
  let b:gitstatus = strlen(l:gitstatus) > 0 ? ' - changed ]':' ]'
endfunction
autocmd BufEnter,BufWritePost * call StatuslineGit2()

set cursorline
hi CursorLine ctermbg=238 cterm=None term=None
hi StatusLine ctermbg=10 ctermfg=8
hi StatusLine2 ctermbg=8 ctermfg=7
hi StatusLine3 ctermbg=8 ctermfg=245
hi StatusLine4 ctermbg=8 ctermfg=11
hi StatusLine5 ctermbg=8 ctermfg=14
hi StatusLine6 ctermbg=8 ctermfg=15

" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim?file=Xterm-color-table.png

set statusline=
set statusline+=%#StatusLine6#
set statusline+=\[%n]                                  "buffernr
set statusline+=\ %<%F\                                "File+path
set statusline+=%=
set statusline+=%#StatusLine2#
set statusline+=\ %y\                                  "FileType
set statusline+=%#StatusLine5#
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%#StatusLine4#
set statusline+=%{b:branchname}
set statusline+=%{b:gitstatus}
set statusline+=%#StatusLine2#
set statusline+=\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=\ col:%03c\                            "Colnr
set statusline+=%#StatusLine5#
set statusline+=\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

set laststatus=2
set t_Co=256
