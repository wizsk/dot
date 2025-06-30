export ANDROID_HOME="$HOME/.local/android-sdk"
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk/27.2.12479018"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/ndk/27.2.12479018"
export PATH="$PATH:$HOME/.local/flutter/bin"
export PATH="$PATH:$HOME/.local/android-studio/bin/"
export PATH="$PATH:$HOME/.local/kotlin-native-prebuilt-linux-x86_64-2.1.10/bin"
export PATH="$PATH:$HOME/go/bin"

export PATH="$PATH:$HOME/.local/progs/zed.app/bin"

function ob --description 'open books form ~/arabic/books and exit from the shell'
    set n (find ~/books -type f -name '*.pdf' | fzf)
    test -n "$n" && zathura --fork "$n" && sleep 2 && exit 0
end

function ci --description 'Check Internet connection'
    while true
        ping google.com -c 1 && printf "\n\n\naise\n" && break
        echo 'no net'
        sleep 1
    end
end

function mc --description 'make and cd in new dir'
    set d "$argv[1]"
    mkdir -p "$d" && cd "$d"
end

function ze --description 'open zathura fo.pdf && exit'
    set f "$argv[1]"
    if test -e "$f"
        zathura --fork "$f"
        sleep 1
        exit 0
    else
        echo "err: $f doesn't exit"
    end
end

function n --description 'run the command in new process'
    if ! command -q "$argv[1]"
        echo "could not find command: $argv[1]"
        return
    end
    nohup $argv &> /dev/null & disown
end


function xo --description 'xournal++ open'
    if test -e "$argv[1]"
        xournalpp $argv & disown
    else
        echo "file not found: $argv[1]"
    end
end

test -r ~/.opam/opam-init/init.fish && source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
