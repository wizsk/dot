set fish_greeting

if status is-interactive
    set -g fish_key_bindings fish_vi_key_bindings
    function fish_mode_prompt; end
end

if test -e "$HOME/.config/fish/local.fish"
    source "$HOME/.config/fish/local.fish"
end

# PATH
export GOPATH="$HOME/.local/go"
export GOPATH="$HOME/.local/bin"

# exports
export FZF_DEFAULT_OPTS="--layout=reverse --height=30%"

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
alias mpv='mpv --save-position-on-quit --resume-playback'
alias tm='tmux a || tmux'
alias z='zathura'
alias zf='zathura --fork'
alias rsync='rsync --progress'
