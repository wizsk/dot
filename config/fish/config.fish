# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
# fisher install IlanCosman/tide@v6
# tide configure --auto --style=Lean --prompt_colors='True color' --show_time='12-hour format' --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Sparse --icons='Few icons' --transient=No

set fish_greeting


if test -e "$HOME/.config/fish/todo.fish"
    source "$HOME/.config/fish/todo.fish"
end

if test -e "$HOME/.config/fish/local.fish"
    source "$HOME/.config/fish/local.fish"
end


# exports
export FZF_DEFAULT_OPTS="--layout=reverse --height=30%"
export MANPAGER='nvim +Man!'
export ANDROID_HOME="$HOME/.local/android-sdk"


# PATH
export GOPATH="$HOME/.local/go"
export PATH="$PATH:$HOME/.local/go/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin-git"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin/"

alias gd='pwd | wl-copy'
alias g="git"
alias ga="git add"
alias gm="git commit -m"
alias gp="git push"
alias gc="git clone"
alias grep="grep --color"
alias l='lsd'
alias ll="lsd -al"
alias ff="fastfetch"
alias bl="bluetoothctl"
alias wlc="wl-copy"
alias wlp="wl-paste"
alias code="codium"
alias mpva='mpv --script-opts=ytdl_hook-ytdl_path=yt-dlpa'
alias mpv='mpv --save-position-on-quit --resume-playback'
alias tm='tmux a || tmux'
alias z='zathura --fork'
alias rsync='rsync --progress'
alias q='exit'

if status is-interactive
    set -g fish_key_bindings fish_vi_key_bindings
    function fish_mode_prompt; end
    print_todo
end
