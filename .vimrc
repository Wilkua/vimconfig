
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

filetype off
" Start Pathogen
silent! call pathogen#infect()

""" Key Mappings """

" Remap leader character to comma
let mapleader = ","

" Set arrow keys to move between windows
nno <Up> <C-W>k
nno <Down> <C-W>j
nno <Left> <C-W>h
nno <Right> <C-W>l

" Cancel insert, move windows, start insert
ino <Up> <Esc><C-W>ka
ino <Down> <Esc><C-W>ja
ino <Left> <Esc><C-W>ha
ino <Right> <Esc><C-W>la

" Shortcut to rapidly toggle 'set list'
nmap <leader>l :set list!<CR>

" Leader commands for quick snippets
inoremap <leader>' ''<ESC>i
inoremap <leader>" ""<ESC>i
inoremap <leader>( ()<ESC>i
inoremap <leader>{ {}<ESC>i
inoremap <leader>[ {}<ESC>i

" Clear search highlighting
nnoremap <leader><space> :noh<cr>

" Quick upper- and lowercase word conversion
nnoremap <leader>U gUiw
nnoremap <leader>u guiw

" A bit faster to exit insert mode
inoremap jj <ESC>

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Create a newline below the current line but don't
" place me in insert mode
nno g<C-O> o<ESC>k

" Create a newline above the current line but don't
" place me in insert mode
nno gO O<ESC>j

" Set F5 to run a build routine
" noremap <F5> :call DoBuild()<CR>

" Don't change the cursor position when moving screens
" nmap <c-e> <c-e>j
" nmap <c-y> <c-y>k
" nmap <c-u> <c-u>j
" nmap <c-d> <c-d>k

" Just put the stupid things in there for me
nnoremap / /\v
vnoremap / /\v

" Make tabs move between matchign braces
nnoremap <tab> %
vnoremap <tab> %

" NERDTree toggle mapping
noremap <leader>n :NERDTreeToggle<CR>

" Easy clipboard management
nnoremap <leader>p "*p
nnoremap <leader>y "*y

" Faster screen movement
nnoremap <C-E> 3<C-E>
nnoremap <C-Y> 3<C-Y>

""" Settings """

set encoding=utf-8               " Set the encoding to UTF-8
set laststatus=2                 " Set the status line to have 2 rows
set nocompatible                 " Don't enable Vi compatibility
set scrolloff=3                  " Always keep three lines below the cursor when scrolling
set backspace=indent,eol,start   " Backspace over everything
set noshowmode                   " Hide the mode from the default status bar
set nobackup                     " do not keep a backup file, use versions instead
set history=50                   " Keep 50 lines of command line history
set ruler                        " Show the cursor position all the time
set showcmd                      " Display incomplete commands
set tabstop=4                    " Set the tab stop to 4 spaces
set softtabstop=4                " Soft tab stop
set shiftwidth=4                 " Set the shift width to 4 spaces
set expandtab                    " Turn tabs into spaces.
set number                       " Always enable line numbers
set autoindent                   " Turn on auto indent
set cursorline                   " Highlight the line the cursor is on
set nowrap                       " Disable line wrapping
set mousehide                    " Hide the mouse when typing text
set ttyfast                      " Fast terminal refreshing
set ch=1                         " Set command height
set wildmenu                     " Enable command line listing
set wildmode=list:longest        " See :help for details
set ignorecase                   " Case-insensitive searching
set smartcase                    " Case-sensitive searching when using upper case
set incsearch                    " Do incremental searching
set hlsearch                     " Highlight search results
set gdefault                     " Default to using 'global' substitution

" Set hidden characters
set listchars=tab:▸\ ,eol:¬

" Enable filetype and plugin indent detection
filetype plugin indent on

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Set some GUI options
if has("gui_running")
   set guifont=Consolas:h9:cANSI
   set guioptions-=t    " Get rid of tear-off menus
   set guioptions-=m    " Remove the menu bar
   set guioptions-=T    " Remove the tool bar
   set guioptions-=r    " Get rid of the right scrollbar
   set guioptions-=L    " Get rid of the left scrollbar
   set numberwidth=6    " Set line number gutter width
   set lines=34         " Set the height of the window to 27 lines
   set columns=120      " Set the width of the window to 80 columsn
endif

""" Syntax Highlighting """

syntax on
colorscheme darkvis

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
   command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

" command! -nargs=* -complete=shellcmd R vnew | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

" Autocmd stuff
if has('autocmd')
   " autocmd BufReadPre * :set columns=(80+numberwidth)
   autocmd BufReadPre *.c,*.cpp,*.cxx,*.h,*.hpp,*.hxx,*.php,*.cs :set cindent
   autocmd BufWritePre *.py,*.js,*.c,*.cpp,*.cxx,*.h,*.hpp,*.html,*.php,*.css,*.txt :call StripTrailingWhitespace()
endif

""" Functions """

" Strips trailing whitespaces without changing the current
" search string (because I hate trailing whitespace)
func! StripTrailingWhitespace()
    let _s = @/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/ = _s
    call cursor(l, c)
endfunction

""" Plugin Options """

" Airline
let g:airline_powerline_symbols = 0  " Don't use PowerLine symbols
let g:airline_left_sep = ''          " Make left separator blank
let g:airline_right_sep = ''         " Make right separator blank

" GitGutter
let g:gitgutter_enabled = 0          " Disable GitGUtter

" NERDCommenter
let g:NERDSpaceDelims = 1             " Add space ofter comment char
let g:NERDDefaultAlign = 'left'       " Left align comment marks
let g:NERDCommentEmptyLines = 1       " Comment blank lines
let g:NERDTrimTrailingWhitespace = 1  " Trim whitespace on uncomment

