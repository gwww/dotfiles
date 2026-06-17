function fish_prompt --description 'Write out the prompt'
  set -l last_status $status
  set -l c (test $last_status -eq 0; and set_color green; or set_color red)

  fish_is_root_user; and set -l prompt_char $c'#'; or set -l prompt_char $c'λ'

  test -n "$SSH_CLIENT" -o -n "$SSH_TTY"; and echo -n (hostname -s)' '
  echo -n (set_color 00ffff)(prompt_pwd -D 3)' '

  # Python VENV
  test -n "$VIRTUAL_ENV"; and echo -n (set_color 00d7ff) (string split -r -m 2 -f 2 '/' $VIRTUAL_ENV)' '

  # Context: High-Performance Git Porcelain v2 Parse
  set -l git_status (git status --branch --porcelain=2 2> /dev/null)
  if test -n "$git_status"
    set -l branch_color

    set -l branch (string match -r '^# branch.head (.*)' $git_status)[2]
    if test "$branch" = "(detached)"
      set branch (string match -r '^# branch.oid (.......)' $git_status)[2]
      set branch_color "brmagenta"
    else
      set -l updown (string match -rg '^# branch.ab \+([\d]+) \-([\d]+)' $git_status)
      if test (count $updown) -eq 2; and test "$updown[1] $updown[2]" != "0 0"
        echo -n (set_color bryellow) $updown[1]$updown[2]' '
      end
            
      if string match -rq '^[^#]' $git_status
        set branch_color "red"
      else
        set branch_color "green"
      end
    end
    echo -n (set_color $branch_color) $branch' '
  end
  echo -n $prompt_char (set_color normal)
end
