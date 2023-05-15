set fish_vi_key_bindings
set fish_greeting

function fish_mode_prompt; end

if status is-interactive
    
    # vi mode no indicator

    # Commands to run in interactive sessions can go here
end

export DENO_INSTALL="/home/sakib/.local/deno"
export PATH="$DENO_INSTALL/bin:$PATH"

## man page
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export MANROFFOPT="-c"


alias dn="sudo dnf"
alias dni="sudo dnf install"
alias dnr="sudo dnf remove"
alias gd='pwd | wl-copy'
alias g="git"
alias ga="git add"
alias gm="git commit -m"
alias gp="git push"
alias gc="git clone"
alias grep="grep --color"
alias ls='ls -F --color=auto'
alias l='lsd'
alias mkd="mkdir -p"
alias ll="lsd -al"
alias m2="mpv -fs --speed=2.22 --save-position-on-quit"
alias nf="neofetch"
alias y="ytfzf"
alias bl="bluetoothctl"
alias wlc="wl-copy"
alias wlp="wl-paste"
alias code="codium"
alias mpv='mpv --save-position-on-quit'
alias tm='tmux a || tmux'
alias rsync='rsync --progress'

~/.local/bin/quoter f
