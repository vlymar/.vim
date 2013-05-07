"" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype plugin indent on

" various customizations
set directory=~/.vim/tmp " directory to place swap files in
set smarttab " intelligently edit tabs
set expandtab " expand tabs into spaces
set wrap

highlight ColorColumn ctermbg=red
set colorcolumn=80,81

set cursorline

" TODO: Add :set spell/nospell mappings
" TODO: remap a to ea, to append to the end of words


let mapleader = ","
let g:mapleader = ","
nnoremap ; :
inoremap <C-space> <Esc>

" open .vimrc with ,vr
map <leader>vr :tabedit ~/.vimrc<cr>

" open help files in new tab
:cabbrev help tab help

" tab switching
map <leader>nt :tabnew<cr>
map <leader>et :tabedit
map <leader>ct :tabclose<cr>
map <leader>mt :tabmove
noremap ] :tabnext<cr>
noremap [ :tabprev<cr>

"map <leader>] :tabnext<cr>
"map <leader>[ :tabprev<cr>

" Move between windows with CTRL-[direction]
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

" set paste, go into insert mode
map <leader>p :set paste!<cr>i


" Scroll viewport 3 lines at a time
nnoremap <C-E> 3<C-E>
nnoremap <C-Y> 3<C-Y>

" j and k move row-wise, not line-wise
:nmap j gj
:nmap k gk


" Formatting
set ts=4 " Tabs are 4 spaces
set shiftwidth=4 " Tabs under smart indent
" TODO: make ruby, python ftplugin file that sets ts/shiftwidth to 2


" Line Numbers
set nu

" Toggles between relative and regular numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

"Toggle between relative/normal numbers with CTRL-N
nnoremap <C-n> :call NumberToggle()<cr>

" Toggle between relative/normal numbers on insert mode
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber

" Visual
set showmatch " Show matching brackets.
set mat=5 " Bracket blinking


" Show $ at end of line and trailing space as ~
"set list lcs=tab:\ \ ,trail:~,extends:>,precedes:< "TODO: show trailing space
"set novisualbell " no blinking
"set noerrorbells " no noise

" As per pathogen install instructions

call pathogen#infect()
call pathogen#helptags() " TODO: What does this call do?
syntax on


" Gundo - currently disabled, GUNDO seems broken on my comp
" nnoremap <leader>g :GundoToggle<CR>

" Solarized
"syntax enable " Is this redundant with syntax on?
set background=dark
colorscheme solarized


let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['java'] }

" Powerline
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'fancy'


"" Example .vimr file found in $VIMRUNTIME/vimrc_example.vim
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"" exclude
" TODO: What are vms, backup, and versions?
if has("vms")
  set nobackup " do not keep a backup file, use versions instead
else
  set backup   " keep a backup file
endif
"" /exclude

set history=100 " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch   " do incremental searching
set hlsearch    " highlight search results
set ic          " ignore case in search
set smartcase   " case sensitive except when query includes upcase char
:nmap <leader>h :nohlsearch<CR> " clear search highlights with ,q

" TODO: What is Ex mode?
" Don't use Ex mode, use Q for formatting
" map Q gq

" TODO: What does "break undo" mean?
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
" if has('mouse')
"  set mouse=a
" endif

" Only do this part when compiled with support for autocommands.
"if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
"  filetype plugin indent on

	" TODO: What is this?
  " Put these in an autocmd group, so that we can delete them easily.
  "augroup vimrcEx
  "au!

  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  "autocmd BufReadPost *
    "\ if line("'\"") > 1 && line("'\"") <= line("$") |
    "\   exe "normal! g`\"" |
    "\ endif

  "augroup END

"else

  "set autoindent		" always set autoindenting on

"endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
"if !exists(":DiffOrig")
  "command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  "\ | wincmd p | diffthis
"endif









" spf13 vimrc test

" set spell "spell check on
" set cursorline " highlight current line
" set foldenable " auto fold code
" cmap w!! w !sudo tee % >/dev/null " write the file when you forget sudo
" set wildmenu " show command list when completing commands TODO: interferes
                                                                " with ,nt
set nowrap " wrap long lines
set scrolloff=3 " minimum lines to keep above and below cursor
set scrolljump=5 "lines to scroll when cursor leaves screen
"set autowrite    " automatically write file when leaving buffer
set virtualedit=onemore "allow for cursor beyond last char.

"change working directory to current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h


" Unmap brackets so tab switching is quick
autocmd Filetype vim,python,ruby unmap <buffer> [[
autocmd Filetype vim,ruby unmap <buffer> []
autocmd Filetype vim,python,ruby unmap <buffer> ]]
autocmd Filetype vim,ruby unmap <buffer> ][
autocmd Filetype vim unmap <buffer> ["
autocmd Filetype vim unmap <buffer> ]"
autocmd Filetype python,ruby unmap <buffer> [m
autocmd Filetype python,ruby unmap <buffer> ]m
autocmd Filetype ruby unmap <buffer> [M
autocmd Filetype ruby unmap <buffer> ]M
