
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Start Pathogen
silent! call pathogen#infect()

""" Key Mappings """

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

" Disable normal arrow key functions in visual mode
vno <Up> <Nop>
vno <Down> <Nop>
vno <Left> <Nop>
vno <Right> <Nop>

" Shortcut to rapidly toggle 'set list'
nmap <leader>l :set list!<CR>

" Leader commands for quick snippets
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>[ {}<ESC>i

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

""" Settings """

set encoding=utf-8   " Set the encoding to UTF-8
set laststatus=2     " Set the status line to have 2 rows
set nocompatible     " Don't enable Vi compatibility
set backspace=       " Don't allow backspacing over older stuff
set noshowmode       " Hide the mode from the default status bar
set nobackup		   " do not keep a backup file, use versions instead
set history=50		   " Keep 50 lines of command line history
set ruler			   " Show the cursor position all the time
set showcmd			   " Display incomplete commands
set incsearch		   " Do incremental searching
set tabstop=3		   " Set the tab stop to 4 spaces
set softtabstop=3	   " Soft tab stop
set shiftwidth=3	   " Set the shift width to 4 spaces
set expandtab		   " Turn tabs into spaces.
set number			   " Always enable line numbers
set ai				   " Turn on auto indent
set nowrap           " Disable line wrapping
set mousehide		   " Hide the mouse when typing text
set ch=1             " Set command height

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


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Set the screen solors
hi clear
set background=dark

if exists("syntax_on")
  syntax reset
endif

""" Syntax Highlighting """

hi Normal            gui=none guifg=#dcdcdc guibg=#1e1e1e
hi SpecialKey        gui=none guifg=#cc0000
hi NonText           gui=none guifg=#aaaaaa
hi Directory         gui=none guifg=#cc8000
hi ErrorMsg          gui=none guifg=White guibg=Red
hi Search            gui=none guifg=white guibg=Red
hi MoreMsg           gui=bold guifg=SeaGreen
hi ModeMsg           gui=bold guifg=#dcdcdc guibg=#1e1e1e
hi LineNr            gui=none guifg=#2b91af
hi Question          gui=none guifg=#dcdcdc
hi StatusLine        gui=bold,underline guifg=#dcdcdc guibg=#1e1e1e
hi StatusLineNC      gui=underline guifg=#dcdcdc guibg=#1e1e1e
hi Title             gui=bold	guifg=Magenta
hi Visual            gui=none guifg=#1e1e1e guibg=#3399ff
hi WarningMsg        gui=none guifg=Red
hi Cursor            guifg=bg	guibg=fg
hi CursorLine        gui=none guibg=#0f0f0f

hi Comment           guifg=#80a0ff

hi Constant          guifg=#b5cea8
hi String            gui=none guifg=#d89d65
hi link String       Character

hi Identifier        gui=none guifg=#dcdcdc

hi Statement         gui=none guifg=#569cd6
hi Operator          gui=none guifg=#b4b4b4

hi PreProc           gui=none guifg=#9b9b9b

hi Type              gui=none guifg=#569cd6
hi Special           gui=none guifg=#569cd6

hi Error             gui=none guifg=#d85050 guibg=#1e1e1e
hi Todo              gui=none guifg=Blue  guibg=Yellow
hi MatchParen        gui=none guifg=#1e1e1e guibg=#dcdcdc
hi TabLine           gui=none gui=bold guifg=blue guibg=white
hi TabLineFill       gui=bold guifg=blue guibg=white
hi TabLineSel        gui=none guifg=white guibg=blue
hi Underlined        gui=none guifg=lightblue gui=bold,underline
hi Ignore            gui=none guifg=black guibg=black

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
   command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

command! -nargs=* -complete=shellcmd R vnew | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

" Autocmd stuff
if has('autocmd')
   " autocmd BufReadPre * :set columns=(80+numberwidth)
   " autocmd BufReadPre *.py :call SetupForPython()
   autocmd BufReadPre *.c,*.cpp,*.cxx,*.h,*.hpp,*.hxx,*.php,*.cs :set cindent
   autocmd BufWritePre *.py,*.js,*.c,*.cpp,*.cxx,*.h,*.hpp,*.html,*.php,*.css,*.txt :call StripTrailingWhitespace()
endif

""" Functions """

" Sets specific indent options for working with python files
" (These are specific to what is used in my workplace)
func! SetupForPython()
   set tabstop=4
   set softtabstop=4
   set shiftwidth=4
   set expandtab
endfunction

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

" NERDTree
noremap <leader>n :NERDTreeToggle<CR>

" NERDCommenter
let g:NERDSpaceDelims = 1             " Add space ofter comment char
let g:NERDDefaultAlign = 'left'       " Left align comment marks
let g:NERDCommentEmptyLines = 1       " Comment blank lines
let g:NERDTrimTrailingWhitespace = 1  " Trim whitespace on uncomment

