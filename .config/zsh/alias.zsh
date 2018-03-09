alias _=sudo
alias d='dirs -v | head -10'
alias g=git
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gc='git commit -v'
alias gcam='git commit -a -m'
alias gcm='git checkout master'
alias gco='git checkout'
alias ghi='git hist'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias gst='git status'
alias history='fc -l 1'
alias l='ls -lah'
alias la='ls -A'
alias lal='ls -lA'
alias ll='ls -lh'
alias ls='ls -G'
alias lsa='ls -lah'
alias md='mkdir -p'
alias more=less
alias please=sudo
alias po=popd
alias pu=pushd
alias rake='noglob rake'
alias rd=rmdir
alias run-help=man
alias rvm-restart='rvm_reload_flag=1 source '\''/Users/glenn/.rvm/scripts/rvm'\'
alias v="vim"
alias vi="vim"
alias emacs="vim"
alias which-command=whence
alias xyzzy="echo nothing happens"

# read markdown files like manpages
function md() {
    pandoc -s -f markdown -t man "$*" | man -l -
}

# Convert web page to PDF
chromepdf() {
  /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
    --headless --disable-gpu --print-to-pdf="$1" $2
}

# Pretty path print
path() {
  echo $PATH | tr ":" "\n" | \
  awk "{ \
    sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
    sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
    sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
    sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
    sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
    print }"
}

# This was written entirely by Mikael Magnusson (Mikachu)
# Type '...' to get '../..' with successive .'s adding /..
function rationalise-dot {
  local MATCH # keep the regex match from leaking to the environment
  if [[ $LBUFFER =~ '(^|/| |      |'$'\n''|\||;|&)\.\.$' ]]; then
    LBUFFER+=/
    zle self-insert
    zle self-insert
  else
    zle self-insert
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot
bindkey -M isearch . self-insert # without this, typing . aborts incr history search
setopt auto_cd

# alias ...=../..
# alias ....=../../..
# alias .....=../../../..
# alias ......=../../../../..
# alias 1='cd -'
# alias 2='cd -2'
# alias 3='cd -3'
# alias 4='cd -4'
# alias 5='cd -5'
# alias 6='cd -6'
# alias 7='cd -7'
# alias 8='cd -8'
# alias 9='cd -9'
# alias afind='ack -il'
# alias gaa='git add --all'
# alias gap='git apply'
# alias gapa='git add --patch'
# alias gau='git add --update'
# alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
# alias gbl='git blame -b -w'
# alias gbnm='git branch --no-merged'
# alias gbr='git branch --remote'
# alias gbs='git bisect'
# alias gbsb='git bisect bad'
# alias gbsg='git bisect good'
# alias gbsr='git bisect reset'
# alias gbss='git bisect start'
# alias 'gc!'='git commit -v --amend'
# alias gca='git commit -v -a'
# alias 'gca!'='git commit -v -a --amend'
# alias 'gcan!'='git commit -v -a --no-edit --amend'
# alias 'gcans!'='git commit -v -a -s --no-edit --amend'
# alias gcb='git checkout -b'
# alias gcd='git checkout develop'
# alias gcf='git config --list'
# alias gcl='git clone --recursive'
# alias gclean='git clean -fd'
# alias gcmsg='git commit -m'
# alias 'gcn!'='git commit -v --no-edit --amend'
# alias gcount='git shortlog -sn'
# alias gcp='git cherry-pick'
# alias gcpa='git cherry-pick --abort'
# alias gcpc='git cherry-pick --continue'
# alias gcs='git commit -S'
# alias gcsm='git commit -s -m'
# alias gd='git diff'
# alias gdca='git diff --cached'
# alias gdct='git describe --tags `git rev-list --tags --max-count=1`'
# alias gdcw='git diff --cached --word-diff'
# alias gdt='git diff-tree --no-commit-id --name-only -r'
# alias gdw='git diff --word-diff'
# alias gemb='gem build *.gemspec'
# alias gemp='gem push *.gem'
# alias gf='git fetch'
# alias gfa='git fetch --all --prune'
# alias gfo='git fetch origin'
# alias gg='git gui citool'
# alias gga='git gui citool --amend'
# alias ggpull='git pull origin $(git_current_branch)'
# alias ggpur=ggu
# alias ggpush='git push origin $(git_current_branch)'
# alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
# alias ghh='git help'
# alias gignore='git update-index --assume-unchanged'
# alias gignored='git ls-files -v | grep "^[[:lower:]]"'
# alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
# alias gk='\gitk --all --branches'
# alias gke='\gitk --all $(git log -g --pretty=%h)'
# alias gl='git pull'
# alias glg='git log --stat'
# alias glgg='git log --graph'
# alias glgga='git log --graph --decorate --all'
# alias glgm='git log --graph --max-count=10'
# alias glgp='git log --stat -p'
# alias glo='git log --oneline --decorate'
# alias globurl='noglob urlglobber '
# alias glog='git log --oneline --decorate --graph'
# alias gloga='git log --oneline --decorate --graph --all'
# alias glol='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit'
# alias glola='git log --graph --pretty='\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --all'
# alias glp=_git_log_prettily
# alias glum='git pull upstream master'
# alias gm='git merge'
# alias gma='git merge --abort'
# alias gmom='git merge origin/master'
# alias gmt='git mergetool --no-prompt'
# alias gmtvim='git mergetool --no-prompt --tool=vimdiff'
# alias gmum='git merge upstream/master'
# alias gp='git push'
# alias gpd='git push --dry-run'
# alias gpoat='git push origin --all && git push origin --tags'
# alias gpristine='git reset --hard && git clean -dfx'
# alias gpsup='git push --set-upstream origin $(git_current_branch)'
# alias gpu='git push upstream'
# alias gpv='git push -v'
# alias gr='git remote'
# alias gra='git remote add'
# alias grb='git rebase'
# alias grba='git rebase --abort'
# alias grbc='git rebase --continue'
# alias grbi='git rebase -i'
# alias grbm='git rebase master'
# alias grbs='git rebase --skip'
# alias grh='git reset HEAD'
# alias grhh='git reset HEAD --hard'
# alias grmv='git remote rename'
# alias grrm='git remote remove'
# alias grset='git remote set-url'
# alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
# alias gru='git reset --'
# alias grup='git remote update'
# alias grv='git remote -v'
# alias gsb='git status -sb'
# alias gsd='git svn dcommit'
# alias gsi='git submodule init'
# alias gsps='git show --pretty=short --show-signature'
# alias gsr='git svn rebase'
# alias gss='git status -s'
# alias gsta='git stash save'
# alias gstaa='git stash apply'
# alias gstc='git stash clear'
# alias gstd='git stash drop'
# alias gstl='git stash list'
# alias gstp='git stash pop'
# alias gsts='git stash show --text'
# alias gsu='git submodule update'
# alias gts='git tag -s'
# alias gtv='git tag | sort -V'
# alias gunignore='git update-index --no-assume-unchanged'
# alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
# alias gup='git pull --rebase'
# alias gupv='git pull --rebase -v'
# alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
# alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'
