# taken from luke smit's void rice repo
autoload -U colors && colors	# Load colors
PS1="
%B%{$fg[magenta]%}%~
%{$fg[red]%}>%{$reset_color%}%b "

PS1="
%B%{$fg[magenta]%}%~
%{$fg[cyan]%}%{$reset_color%}%b  "

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete

# cd
bindkey -s '^f' '^ucd "$(dirname "$(fzf)")"\n'

##alias
alias dn="sudo dnf"
alias dni="sudo dnf install"
alias dnr="sudo dnf remove"


alias g="git"
alias ga="git add"
alias gm="git commit -m"
alias gp="git push"
alias gc="git clone"

alias grep="grep --color"
alias ls='ls --color=auto'
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

alias vim="nvim"
alias mpv='mpv --save-position-on-quit'

alias tm='tmux a || tmux'
## alias mnh='sudo mount -t cifs -o username=,password= //10.0.0.101/file /mnt/file'

alias pm="countdown 26m &&  mpv --loop=2 '/home/sk/vids/yt/Alarm-Clock Sound!!! [iNpXCzaWW1s].m4a'"
alias prs="clear && printf '\n\n\n\nBismiAllah\n' && sleep 1 && countdown 40m &&  mpv --loop=2 '/home/sk/vids/yt/Alarm-Clock Sound!!! [iNpXCzaWW1s].m4a'"
alias pr="clear && printf '\n\n\n\nBismiAllah\n' && sleep 1 && countdown 25m &&  mpv --loop=2 '/home/sk/vids/yt/Alarm-Clock Sound!!! [iNpXCzaWW1s].m4a'"

# Load syntax highlighting should be at last
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  2>/dev/null # Works in fedora maybe 
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
