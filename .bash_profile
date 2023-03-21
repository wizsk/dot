#
# ~/.bash_profile
#

export PATH=$PATH:/home/sk/.local/bin
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/go/bin"
export PATH="$PATH:$HOME/.local/cargo/bin"

# HOME FOR GO AND RUST
export GOPATH="$HOME/.local/go"
export CARGO_HOME="$HOME/.local/cargo"

# Default programs:
export EDITOR="nvim"
export BROWSER="firefox"

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache" 


[[ -f ~/.bashrc ]] && . ~/.bashrc


if [ $(tty) = '/dev/tty1' ]
then
	exec sway
fi

