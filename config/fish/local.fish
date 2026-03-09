# exports
export FZF_DEFAULT_OPTS="--layout=reverse --height=30%"
export MANPAGER='nvim +Man!'
export PATH="$PATH:$HOME/.local/bin"
export CHROME_EXECUTABLE=/usr/bin/chromium-browser

# go
export GOPATH="$HOME/.local/share/go"
export PATH="$PATH:$HOME/.local/share/go/bin"

# flutter
export PATH="$PATH:$HOME/.local/flutter/bin"

# android
export ANDROID_HOME="$HOME/.local/android-sdk"
export PATH="$PATH:$HOME/.local/cmdline-tools/bin"

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

function mpva --description 'run mpv with ~/.local/yt-dlp'
    mpv --script-opts=ytdl_hook-ytdl_path=$HOME/.local/yt-dlp
end

function ut --description 'turn on usb thethering'
    adb shell svc usb setFunctions rndis
end
