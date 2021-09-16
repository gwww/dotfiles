" Vim color file
" Based on: http://hans.fugal.net/vim/colors/desert.vim
" Modified by: Glenn

" Useful help screens:
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name="glenn"

if !has('gui_running')
    " Color terminal definitions
    hi Normal       ctermfg=254 ctermbg=233
    hi SpecialKey   ctermfg=darkgreen
    hi NonText      cterm=bold ctermfg=darkblue
    hi Directory    ctermfg=darkcyan
    hi ErrorMsg     cterm=bold ctermfg=7 ctermbg=1
    hi IncSearch    cterm=reverse
    hi Search       cterm=NONE ctermfg=black ctermbg=lightgreen
    hi MoreMsg      ctermfg=darkgreen
    hi ModeMsg      cterm=NONE ctermfg=brown
    hi LineNr       ctermfg=246 ctermbg=232
    hi Question     ctermfg=green
    hi StatusLine   cterm=bold,reverse
    hi StatusLineNC cterm=reverse
    hi VertSplit    cterm=reverse
    hi Title        ctermfg=111
    hi Visual       cterm=reverse
    hi VisualNOS    cterm=bold,underline
    hi WarningMsg   ctermfg=1
    hi WildMenu     ctermfg=0 ctermbg=3
    hi Folded       ctermfg=darkgrey ctermbg=NONE
    hi FoldColumn   ctermfg=darkgrey ctermbg=NONE
    hi DiffAdd      ctermbg=4
    hi DiffChange   ctermbg=5
    hi DiffDelete   cterm=bold ctermfg=4 ctermbg=6
    hi DiffText     cterm=bold ctermbg=1
    hi Comment      ctermfg=81
    hi Constant     ctermfg=210
    hi Special      ctermfg=228
    hi Identifier   cterm=NONE ctermfg=78
    hi Statement    ctermfg=228
    hi PreProc      ctermfg=167
    hi Type         ctermfg=149
    hi Underlined   cterm=underline ctermfg=5
    hi Ignore       cterm=bold ctermfg=7
    hi Ignore       ctermfg=darkgrey
    hi Error        cterm=bold ctermfg=7 ctermbg=1
else
    " GUI definitions
    hi Normal   guifg=White guibg=grey20
    hi Cursor   guibg=khaki guifg=slategrey
    hi VertSplit    guibg=#c2bfa5 guifg=grey50 gui=none
    hi Folded       guibg=grey30 guifg=gold
    hi FoldColumn   guibg=grey30 guifg=tan
    hi IncSearch    gui=reverse
    hi Search       guibg=peru guifg=wheat
    hi LineNr       guifg=gray60 guibg=gray15
    hi ModeMsg      guifg=goldenrod
    hi MoreMsg      guifg=SeaGreen
    hi NonText      guifg=LightBlue guibg=grey30
    hi Question     guifg=springgreen
    hi SpecialKey   guifg=yellowgreen
    hi StatusLine   guibg=#c2bfa5 guifg=black gui=none
    hi StatusLineNC guibg=#c2bfa5 guifg=grey50 gui=none
    hi Title        guifg=indianred
    hi Visual       gui=none guifg=khaki guibg=olivedrab
    hi WarningMsg   guifg=salmon

    " syntax highlighting groups
    hi Comment      guifg=SkyBlue
    hi Constant     guifg=#ffa0a0
    hi Identifier   guifg=palegreen
    hi Statement    guifg=khaki
    hi PreProc      guifg=indianred
    hi Type         guifg=darkkhaki
    hi Special      guifg=navajowhite
    "hi Underlined
    hi Ignore       guifg=grey40
    "hi Error
    hi Todo         guifg=orangered guibg=yellow2
endif

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'. synIDattr(synID(line("."),col("."),0),"name") . "> lo<". synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
