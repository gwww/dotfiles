# Wrapper around poetry to provide additional commands
# Assumes git, poetry, and python are installed.

function _venv_status
  if test -z "$VIRTUAL_ENV"
    echo "Inactive"
  else
    test "x$POETRY_ACTIVE" = "x1"; and echo "Subshell"; or echo "Activated"
  end
end

function po --wraps poetry --description 'Add a couple of commands to poetry'
  if test (count $argv) -eq 1 && test (string length -- $argv[1]) -ge 2
    if string match -- "$argv[1]*" "activate" >/dev/null
      set -l script venv/bin/activate.fish
      set -l git (git rev-parse --show-toplevel 2> /dev/null)/
      set -l SCRIPT_PLACES .$script $git.$script $script $git$script
      # typeset -U SCRIPT_PLACES # remove duplicates from path
      for scrpt in $SCRIPT_PLACES
        if test -f $scrpt
          source $scrpt
          echo (set_color green)Activated \'$VIRTUAL_ENV\'(set_color normal)
          return 0
        end
      end
      echo (set_color red)No virtual environment found.(set_color normal)

    else if string match -- "$argv[1]*" "deactivate" >/dev/null
      set -l s (_venv_status)
      if test $s = "Activated"
        echo (set_color green)Deactivating \'$VIRTUAL_ENV\'(set_color normal)
        deactivate
      else if test $s = "Subshell"
        echo (set_color green)Exiting \'$VIRTUAL_ENV\' subshell(set_color normal)
        exit 0
      else
        echo (set_color red)No virtual environment active.(set_color normal)
        return 1
      end

    else if string match -- "$argv[1]*" "status" >/dev/null
      set -l s (_venv_status)
      if test $s != "Inactive"
        set -l ve " ($VIRTUAL_ENV)"
      end
      echo "Python venv: $s$ve"
      echo Python: (which python) \((python --version)\)
      poetry --version

    else if string match -- "$argv[1]*" "changelog" >/dev/null
      curl -vs https://raw.githubusercontent.com/python-poetry/poetry/master/CHANGELOG.md 2>/dev/null | pandoc -f markdown -t plain | more

    else if string match -- "$argv[1]*" "reinstall" >/dev/null
      # This command works for both first time install and reinstall
      # Cleanup potential previous install
      rm -rf ~/.local/share/pypoetry
      # From: https://github.com/python-poetry/install.python-poetry.org/issues/24#issuecomment-2016821135
      curl -sSL https://install.python-poetry.org | sed 's/symlinks=False/symlinks=True/' | python3 -

    else
      poetry $argv
    end
  else
    poetry $argv
  end
end
