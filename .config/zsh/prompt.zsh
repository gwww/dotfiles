local _red="%{\e[0;91m%}"
local _green="%{\e[0;38;5;46m%}"
local _reset="%{\e[0m%}"
local _cwd_sep="%{\e[1;38;5;11m%}"
local _cwd_segment="%{\e[0;38;5;14m%}"

function __prompt_cwd {
  local cwd="%2~"
  cwd="${(%)cwd}"
  echo -n "$_cwd_segment${cwd//\//$_cwd_sep/$_cwd_segment} "
}

function __prompt_git {
  local branch_name="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
  if [[ -n "$branch_name" ]]; then
    if [[ -n "$(git status --porcelain 2> /dev/null)" ]]; then
      echo -n "$_red$branch_name "
    else
      echo -n "$_green$branch_name "
    fi
  fi
}

function __prompt_ssh {
  [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]] && echo -n "$(hostname -s) "
}

function __prompt_pyenv {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    env_path_list=(${(s:/:)VIRTUAL_ENV})
    echo -n "$_green(🐍$env_path_list[-2]) "
  fi
}

function __prompt_vimshell {
  [[ -n "$VIMRUNTIME" ]] && echo -n "${_red}VIMSHELL "
}

function __prompt_char {
  echo -n "%(?.$_green.$_red)%(!.#.λ) "
}

function __display_left_prompt {
  __prompt_cwd
  __prompt_ssh
  __prompt_git
  __prompt_pyenv
  __prompt_vimshell
  __prompt_char
  echo -n $_reset
}

setopt prompt_subst

PROMPT='$(__display_left_prompt)'
RPROMPT=''
