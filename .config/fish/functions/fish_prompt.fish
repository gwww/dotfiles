function fish_prompt --description 'Write out the prompt'
  test $status -ne 0; and set -l c (set_color red); or set -l c (set_color green)
  fish_is_root_user; and set -l prompt_char $c'#'; or set -l prompt_char $c'λ'

  echo -n (set_color 7df9aa)(date +%H:%M:%S)' '
  test -n "$SSH_CLIENT" -o -n "$SSH_TTY"; and echo -n (hostname -s)' '
  echo -n (set_color 00ffff) (prompt_pwd -D 2)' '

  # Python VENV
  test -n "$VIRTUAL_ENV"; and echo -n (set_color 00d7ff) (string split -r -m 2 -f 2 '/' $VIRTUAL_ENV)' '
   
  set -l branch (command git branch --show-current 2> /dev/null)
  if test -n "$branch"
    test -n "$(git status --porcelain 2> /dev/null)"; and set -l c "red"; or set -l c "green"
    echo -n (set_color $c) $branch' '
  end

  echo -n $prompt_char (set_color normal)
end
