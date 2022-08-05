# taken from luke smit's void rice repo
# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
# PS1="%B%{$fg[yellow]%}%n %{$fg[magenta]%}%~%{$reset_color%}$%b "
# PS1=$'\n'"%B%{$fg[red]%}%~%{$reset_color%}"$'\n'">%b "
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
lfcd () {
    tmp="$(mktemp -uq)"
    trap 'rm -f $tmp >/dev/null 2>&1' HUP INT QUIT TERM PWR EXIT
    lfub -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' '^ulfcd\n'

bindkey -s '^k' '^uquran -f\n'

bindkey -s '^a' '^ubc -lq\n'

# bindkey -s '^f' '^ulfub\n'
bindkey -s '\ef' '^ulfub\n'
# bindkey -s '^f' '^ucd "$(dirname "$(fzf)")"\n'

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete



##alias
alias p="sudo pacman"
alias pi="sudo pacman -S"
alias prm="sudo pacman -Rns"


alias g="git"
alias ga="git add"
alias gm="git commit -m"
alias gp="git push"
alias gc="git clone"

alias grep="grep --color"
alias ls='ls --color=auto'
alias lf="lfub"

alias mkd="mkdir -p"
alias ll="ls -Alh"

alias m2="mpv --speed=2"
alias m22="mpv --speed=2.22"

alias pg="ping google.com"
alias nf="neofetch"

alias y="ytfzf"
alias yt='FZF_DEFAULT_OPTS="--layout=default --height 100%" && ytfzf -t'
alias yth="yt-dlp -f 137+140"

alias bl="bluetoothctl"

alias xc="xclip -selection clipboard"

#### Porasuna cd 
alias h1='cd ~/Pora/1-Higher-Math/1st/'
alias h2='cd ~/Pora/1-Higher-Math/2nd/'
alias p1='cd ~/Pora/2-Physics/1st'
alias p2='cd ~/Pora/2-Physics/2nd'
alias c1='cd ~/Pora/3-Chemistry/1st'
alias c2='cd ~/Pora/3-Chemistry/2nd'
alias c2='cd ~/Pora/3-Chemistry/2nd'
alias b1='cd ~/Pora/4-Biology/1st'
alias b2='cd ~/Pora/4-Biology/2nd'



# Load syntax highlighting;
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null
# echo -ne '\e[1 q'
