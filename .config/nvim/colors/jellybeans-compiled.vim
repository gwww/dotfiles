set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "jellybeans-compiled"

hi SpecialKey     ctermfg=238 ctermbg=234 guifg=#444444 guibg=#1c1c1c
hi TermCursor     cterm=reverse gui=reverse
hi NonText        ctermfg=240 ctermbg=232 guifg=#606060 guibg=#080808
hi Directory      ctermfg=186 guifg=#dad085
hi ErrorMsg       ctermbg=88 guibg=#902020
hi IncSearch      cterm=reverse gui=reverse
hi Search         cterm=underline ctermfg=217 ctermbg=16 gui=underline guifg=#f0a0c0 guibg=#302028
hi MoreMsg        ctermfg=121 gui=bold guifg=SeaGreen
hi ModeMsg        cterm=bold gui=bold
hi LineNr         ctermfg=59 ctermbg=232 guifg=#605958 guibg=#080808
hi CursorLineNr   ctermfg=188 guifg=#ccc5c4
hi Question       ctermfg=71 guifg=#65C254
hi StatusLine     ctermfg=16 ctermbg=253 gui=italic guifg=#000000 guibg=#dddddd
hi StatusLineNC   ctermfg=231 ctermbg=235 gui=italic guifg=#ffffff guibg=#403c41
hi VertSplit      ctermfg=243 ctermbg=16 guifg=#777777 guibg=#403c41
hi Title          cterm=bold ctermfg=71 gui=bold guifg=#70b950
hi Visual         ctermbg=237 guibg=#404040
hi WarningMsg     ctermfg=224 guifg=Red
hi WildMenu       ctermfg=217 ctermbg=16 guifg=#f0a0c0 guibg=#302028
hi Folded         ctermfg=145 ctermbg=236 gui=italic guifg=#a0a8b0 guibg=#384048
hi FoldColumn     ctermfg=59 ctermbg=234 guifg=#535D66 guibg=#1f1f1f
hi DiffAdd        ctermfg=193 ctermbg=22 guifg=#D2EBBE guibg=#437019
hi DiffChange     ctermbg=24 guibg=#2B5B77
hi DiffDelete     ctermfg=16 ctermbg=52 guifg=#40000A guibg=#700009
hi DiffText       cterm=reverse ctermfg=81 ctermbg=16 gui=reverse guifg=#8fbfdc guibg=#000000
hi SignColumn     ctermfg=243 ctermbg=236 guifg=#777777 guibg=#333333
hi Conceal        ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
hi SpellBad       cterm=underline ctermbg=88 gui=underline guibg=#902020 guisp=Red
hi SpellCap       cterm=underline ctermbg=20 gui=underline guibg=#0000df guisp=Blue
hi SpellRare      cterm=underline ctermbg=53 gui=underline guibg=#540063 guisp=Magenta
hi SpellLocal     cterm=underline ctermbg=23 gui=underline guibg=#2D7067 guisp=Cyan
hi Pmenu          ctermfg=231 ctermbg=240 guifg=#ffffff guibg=#606060
hi PmenuSel       ctermfg=232 ctermbg=255 guifg=#101010 guibg=#eeeeee
hi PmenuSbar      ctermbg=248 guibg=Grey
hi PmenuThumb     ctermbg=15 guibg=White
hi TabLine        ctermfg=16 ctermbg=145 gui=italic guifg=#000000 guibg=#b0b8c0
hi TabLineSel     cterm=bold ctermfg=16 ctermbg=255 gui=bold,italic guifg=#000000 guibg=#f0f0f0
hi TabLineFill    ctermfg=103 guifg=#9098a0
hi CursorColumn   ctermbg=234 guibg=#1c1c1c
hi CursorLine     ctermbg=234 guibg=#1c1c1c
hi ColorColumn    ctermbg=16 guibg=#000000
hi RedrawDebugNormal cterm=reverse gui=reverse
hi RedrawDebugClear ctermbg=11 guibg=Yellow
hi RedrawDebugComposed ctermbg=10 guibg=Green
hi RedrawDebugRecompose ctermbg=9 guibg=Red
hi Cursor         ctermfg=232 ctermbg=153 guifg=#080808 guibg=#b0d0f0
hi lCursor        guifg=bg guibg=fg
hi Normal         ctermfg=188 ctermbg=232 guifg=#e8e8d3 guibg=#080808
hi FloatShadow    guibg=Black blend=80
hi FloatShadowThrough guibg=Black blend=100
hi Error          ctermfg=15 ctermbg=9 guifg=White guibg=Red
hi Todo           cterm=bold ctermfg=251 gui=bold guifg=#c7c7c7
hi String         ctermfg=107 guifg=#99ad6a
hi Constant       ctermfg=167 guifg=#cf6a4c
hi Function       ctermfg=222 guifg=#fad07a
hi Identifier     ctermfg=183 guifg=#c6b6ee
hi Statement      ctermfg=103 guifg=#8197bf
hi PreProc        ctermfg=110 guifg=#8fbfdc
hi StorageClass   ctermfg=179 guifg=#c59f6f
hi Type           ctermfg=215 guifg=#ffb964
hi Structure      ctermfg=110 guifg=#8fbfdc
hi Special        ctermfg=107 guifg=#799d6a
hi Delimiter      ctermfg=66 guifg=#668799
hi MatchParen     cterm=bold ctermfg=231 ctermbg=60 gui=bold guifg=#ffffff guibg=#556779
hi Comment        ctermfg=246 gui=italic guifg=#999999
hi Underlined     cterm=underline ctermfg=81 gui=underline guifg=#80a0ff
hi Ignore         ctermfg=0 guifg=bg
hi NvimInternalError ctermfg=9 ctermbg=9 guifg=Red guibg=Red
hi StringDelimiter ctermfg=108 guifg=#88aa88
hi rubyClass      ctermfg=30 guifg=#447799
hi rubyIdentifier ctermfg=183 guifg=#c6b6fe
hi rubyInstanceVariable ctermfg=183 guifg=#c6b6fe
hi rubySymbol     ctermfg=104 guifg=#7697d6
hi rubyControl    ctermfg=104 guifg=#7597c6
hi rubyRegexpDelimiter ctermfg=53 guifg=#540063
hi rubyRegexp     ctermfg=162 guifg=#dd0093
hi rubyRegexpSpecial ctermfg=126 guifg=#a40073
hi rubyPredefinedIdentifier ctermfg=168 guifg=#de5577
hi DbgCurrent     ctermfg=195 ctermbg=25 guifg=#DEEBFE guibg=#345FA8
hi DbgBreakPt     ctermbg=53 guibg=#4F0037
hi IndentGuidesOdd ctermbg=235 guibg=#232323
hi IndentGuidesEven ctermbg=234 guibg=#1b1b1b
hi PreciseJumpTarget ctermfg=155 ctermbg=22 guifg=#B9ED67 guibg=#405026
hi TSNone         ctermfg=188 guifg=foreground
hi TSStrong       cterm=bold gui=bold
hi TSEmphasis     cterm=italic gui=italic
hi TSUnderline    cterm=underline gui=underline
hi TSStrike       cterm=strikethrough gui=strikethrough
