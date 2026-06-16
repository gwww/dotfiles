function which --description "Locate a program, function, builtin, or file in the user's path"
    function _which_help
        echo "usage: which [-asv] program ..."
        echo ""
        echo "Options:"
        echo "  -a, --all      List all instances of executables/functions found (instead of just the first)"
        echo "  -s, --silent   Silent mode. No output; exits 0 if all are found, 1 if any are missing"
        echo "  -v, --verbose  Verbose mode. Displays the file path and first 5 lines of function definitions"
    end

    argparse 'a/all' 's/silent' 'v/verbose' -- $argv
    if test $status -ne 0
        _which_help
        return 1
    end

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
                if builtin -q -- $cmd
                    echo "$cmd is a function (wraps a shell builtin)"
                else if set -l real_cmd (type -p -- $cmd 2>/dev/null)
                    echo "$cmd is a function (wraps $real_cmd)"
                else
                    echo "$cmd is a function"
                end

                if set -q _flag_verbose
                    # Retrieve and display the definition source path
                    set -l source_file (functions --details -- $cmd)
                    echo "  # Defined in: $source_file"
                    
                    set -l func_lines (functions -- $cmd)
                    echo $func_lines[1..5] | string join \n
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
                echo "$cmd is a shell builtin"
            end
            if not set -q _flag_all
                continue
            end
        end

        # 3. Check the PATH for real executable files only
        if set -q _flag_all
            if set -l paths (type -ap -- $cmd 2>/dev/null | string match -r '^/.*')
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

        if test $found_any -eq 0
            if not set -q _flag_silent
                echo "$cmd not found" >&2
            end
            set exit_status 1
        end
    end

    return $exit_status
end
