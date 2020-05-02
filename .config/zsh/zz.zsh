# zz - smart directory changer
# From: http://leahneukirchen.org/dotfiles/.zshrc
# 14dec2015  +chris+
# 15dec2015  +chris+ clean up nonexisting paths
chpwd_zz() {
  print -P '0\t%D{%s}\t1\t%~' >>~/.cache/zz
}

chpwd_functions=( ${(kM)functions:#chpwd?*} )

zz() {
  awk -v ${(%):-now='%D{%s}'} <~/.cache/zz '
    function r(t,f) {
      age = now - t
      return (age<3600) ? f*4 : (age<86400) ? f*2 : (age<604800) ? f/2 : f/4
    }
    { f[$4]+=$3; if ($2>l[$4]) l[$4]=$2 }
    END { for(i in f) printf("%d\t%d\t%d\t%s\n",r(l[i],f[i]),l[i],f[i],i) }' |
      sort -k2 -n -r | sed 9000q | sort -n -r -o ~/.cache/zz
  if (( $# )); then
    local p=$(awk 'NR != FNR { exit }  # exit after first file argument
                   { for (i = 3; i < ARGC; i++) if ($4 !~ ARGV[i]) next
                     print $4; exit }' ~/.cache/zz ~/.cache/zz "$@")
    [[ $p ]] || return 42
    local op=print
    [[ -t 1 ]] && op=cd
    if [[ -d ${~p} ]]; then
      $op ${~p}
    else
      # clean nonexisting paths and retry
      while read -r line; do
        [[ -d ${~${line#*$'\t'*$'\t'*$'\t'}} ]] && print -r $line
      done <~/.cache/zz | sort -n -r -o ~/.cache/zz
      zz "$@"
    fi
  else
    sed 10q ~/.cache/zz
  fi
}
alias z=' zz'
