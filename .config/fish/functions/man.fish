function man --wraps man --description 'Format and display manual pages'
    set -l blink (set_color --bold red)
    set -l bold (set_color --bold 0087ff)
    set -l standout (set_color --reverse afafd7)
    set -l underline (set_color --underline 5fff5f)
    set -l normal (set_color normal)

    set -lx LESS_TERMCAP_mb $blink
    set -lx LESS_TERMCAP_md $bold
    set -lx LESS_TERMCAP_me $normal
    set -lx LESS_TERMCAP_so $standout
    set -lx LESS_TERMCAP_se $normal
    set -lx LESS_TERMCAP_us $underline
    set -lx LESS_TERMCAP_ue $normal
    set -lx LESS '-R -s'

    command man $argv
end
