function fish_command_not_found
  if test (count $argv) -eq 1 -a -d $argv[1]
    cd $argv[1]
  else
    echo "Unknown command:" $argv[1]
  end
end
