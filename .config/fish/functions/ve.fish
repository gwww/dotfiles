# Wrapper around uv to provide additional commands
# Assumes git, poetry, and python are installed.

function _environment_dir
  set -l script venv/bin/activate.fish
  set -l git (git rev-parse --show-toplevel 2> /dev/null)/
  set -l SCRIPT_PLACES .$script $git.$script $script $git$script
  # typeset -U SCRIPT_PLACES # remove duplicates from path
  for scrpt in $SCRIPT_PLACES
    if test -f $scrpt
      echo $scrpt
      return 0
    end
  end
end

function __activate
  set -l _scrpt (_environment_dir)
  if test $_scrpt
    echo  $_scrpt
    source $_scrpt
    echo (set_color green)Activated \'$VIRTUAL_ENV\'(set_color normal)
    return 0
  end
  echo (set_color red)No virtual environment found.(set_color normal)
end

function __deactivate
  if test "$VIRTUAL_ENV"
    echo (set_color green)Deactivating \'$VIRTUAL_ENV\'(set_color normal)
    deactivate
  else
    echo (set_color red)No virtual environment active.(set_color normal)
    return 1
  end
end

function __status
  if test "$VIRTUAL_ENV"
    echo "Python venv: $VIRTUAL_ENV"
  else
    set -l _scrpt (_environment_dir)
    if test $_scrpt
      echo Python venv: Inactive \(Available: $_scrpt\)
    else
      echo Python venv: Inactive \(No venv found\)
    end
  end
  echo Python: (which python) \((python --version)\)
  echo uv: (which uv) \((uv --version)\)
end

function ve --description 'Activate/deactivate python virtual environment'
  if test (count $argv) -eq 1 && test (string length -- $argv[1]) -ge 2
    if string match -- "$argv[1]*" "activate" >/dev/null
      __activate
    else if string match -- "$argv[1]*" "deactivate" >/dev/null
      __deactivate
    else if string match -- "$argv[1]*" "status" >/dev/null
      __status
    else
      echo Valid commands are: activate, deactivate, and status
    end
  else
    __status
  end
end
