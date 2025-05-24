set todo ~/todo.md
function print_todo
    if test -r ~/todo.md
        set green  '#A6E3A1'
        set yellow  '#F9E2AF'
        set blue  '#89B4FA'
        set cyan  '#94E2D5'

        set file 'todo.md'

        set_color blue
        echo "TODOS:"

        set tick '✓'
        set cross '✗'
        set dot '•'

        cat ~/$file | while read -l line
            switch $line
                case '[x]*'
                    set_color green
                    echo -n "  $tick "
                    echo (string sub --start 4 -- $line)
                case '[ ]*'
                    set_color yellow
                    echo -n "  $dot  "
                    echo (string sub --start 5 -- $line)
                case '*'
                    set_color cyan
                    echo $line
            end
        end
        set_color normal
    end
end

function pt --description 'alias to print_todo function'
    print_todo
end

function ot --description 'open todo file'
    nvim $todo
end

function at --description 'add to todo file'
    if test (count $argv) -gt 0
        echo "[ ] $argv" >> todo.md
        print_todo
    else
        echo "provide an argument to add to todo!"
    end
end
