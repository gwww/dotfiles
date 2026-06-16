function which --description "Locate a program, function, builtin, or file in the user's path"
    # Helper function to display clean usage instructions
    function _which_help
        echo "usage: which [-asv] program ..."
        echo ""
        echo "Options:"
        echo "  -a, --all      List all instances of executables/functions found (instead of just the first)"
        echo "  -s, --silent   Silent mode. No output; exits 0 if all are found, 1 if any are missing"
        echo "  -v, --verbose  Verbose mode. Displays the first 5 lines of Fish function definitions"
    end

    # Parse arguments
    argparse 'a/all' 's/silent' 'v/verbose' -- $argv
    if test $status -ne 0
        _which_help
        return 1
    end

    # If no program names are provided, show help and exit
    if not set -q argv[1]
        _which_help
        return 1
    end

    set -l exit_status 0

    for cmd in $argv
        set -l found_any 0

        # 1. Check if it's a Fish Function
        if functions -q -- $cmd
            set found_any 1
            if not set -q _flag_silent
                echo "$cmd is a fish function"
                if set -q _flag_verbose
                    # Capture the full function definition as a list of lines
                    set -l func_lines (functions -- $cmd)
                    
                    # Print up to the first 5 lines
                    echo $func_lines[1..5] | string join \n
                    
                    # Only append the ellipsis if there are more than 5 lines total
                    if test (count $func_lines) -gt 5
                        echo "..."
                    end
                end
            end
            if not set -q _flag_all
                continue
            end
        end

        # 2. Check if it's a Shell Builtin
        if builtin -q -- $cmd
            set found_any 1
            if not set -q _flag_silent
                echo "$cmd is a fish shell builtin"
            end
            if not set -q _flag_all
                continue
            end
        end

        # 3. Check the PATH for executables
        if set -q _flag_all
            if set -l paths (type -ap -- $cmd 2>/dev/null | string match -v '-')
                set found_any 1
                if not set -q _flag_silent
                    for p in $paths
                        echo $p
                    end
                end
            end
        else
            if set -l p (type -p -- $cmd 2>/dev/null)
                set found_any 1
                if not set -q _flag_silent
                    echo $p
                end
            end
        end

        # If this specific command wasn't found anywhere
        if test $found_any -eq 0
            if not set -q _flag_silent
                echo "$cmd not found" >&2
            end
            set exit_status 1
        end
    end

    return $exit_status
end
