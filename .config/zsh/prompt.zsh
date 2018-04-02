function prompt_cwd {
  local _separator="%{\e[1;38;5;11m%}"
  local _segment="%{\e[0;38;5;14m%}"

  local cwd="%2~"
  cwd="${(%)cwd}"
  echo -n "$_segment${cwd//\//$_separator/$_segment} "
}

function prompt_git {
  local branch_name="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
  if [ -n "$branch_name" ]; then
    if [ -n "$(git status --porcelain 2> /dev/null)" ]; then
      local _dirty="%{\e[0;31m%}"
      echo -n "$_dirty$branch_name "
    else
      local _clean="%{\e[0;32m%}"
      echo -n "$_clean$branch_name "
    fi
  fi
}

function prompt_ssh {
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo -n "$(hostname -s) "
  fi
}

function prompt_pyenv {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo -n "🐍 "
  fi
}

function prompt_status {
  local _uchar="λ"
  if [ "$PROMPT_LAST_ERROR" != "0" ]; then
    local _err="%{\e[0;31m%}"
    echo -n "$_err%(!.#.$_uchar) "
  else
    local _ok="%{\e[0;32m%}"
    echo -n "$_ok%(!.#.$_uchar) "
  fi
}

function prompt_build_left {
  local _reset="%{\e[0m%}"

  prompt_cwd
  prompt_ssh
  prompt_git
  prompt_pyenv
  prompt_status
  echo -n $_reset
}

function prompt_build_right {
}

# capture exit status and reset prompt
function prompt_line_init {
  PROMPT_LAST_ERROR="$?" # I need to capture this ASAP
  zle reset-prompt
}

# redraw prompt on keymap select
function prompt_keymap_select {
  zle reset-prompt
}

setopt prompt_subst
zle -N zle-line-init prompt_line_init
zle -N zle-keymap-select prompt_keymap_select

PROMPT='$(prompt_build_left)'
# RPROMPT='$(prompt_build_right)'
RPROMPT=''
