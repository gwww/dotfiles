function fish_prompt --description 'Write out the prompt'
  test $status -ne 0; and set -l c (set_color red); or set -l c (set_color green)
  fish_is_root_user; and set -l prompt_char $c'#'; or set -l prompt_char $c'λ'

  echo -n (set_color 7df9aa)(date +%H:%M:%S)' '
  test -n "$SSH_CLIENT" -o -n "$SSH_TTY"; and echo -n (hostname -s)' '
  echo -n (set_color 00ffff) (prompt_pwd -D 2)' '

  # Python VENV
  test -n "$VIRTUAL_ENV"; and echo -n (set_color 00d7ff) (string split -r -m 2 -f 2 '/' $VIRTUAL_ENV)' '
   
  set -l git_status (git status --branch --porcelain=2 2> /dev/null)
  if test -n "$git_status"
    set -l branch (string match -r '^# branch.head (.*)' $git_status)[2]
    set -l c "yellow"
    if [ $branch = "(detached)" ]
      set branch (string match -r '^# branch.oid (.......)' $git_status)[2]
    else
      test -z (string match -r '^[^#]' $git_status); and set c "green"; or set c "red"
    end
    echo -n (set_color $c) $branch' '
  end

  echo -n $prompt_char (set_color normal)
end
