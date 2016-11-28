set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "DarkVis"

hi Normal            gui=none guifg=#dcdcdc guibg=#1e1e1e ctermfg=white ctermbg=black
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
hi CursorLine        gui=none guibg=#0f0f0f ctermfg=fg ctermbg=bg

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

