export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"

unsetopt PROMPT_SP



# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Other program settings:
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '')"
export LESS_TERMCAP_md="$(printf '%b' '')"
export LESS_TERMCAP_me="$(printf '%b' '')"
export LESS_TERMCAP_so="$(printf '%b' '')"
export LESS_TERMCAP_se="$(printf '%b' '')"
export LESS_TERMCAP_us="$(printf '%b' '')"
export LESS_TERMCAP_ue="$(printf '%b' '')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export QT_QPA_PLATFORMTHEME="gtk2"      # Have QT use gtk2 theme.
export _JAVA_AWT_WM_NONREPARENTING=1    # Fix for Java applications in dwm

