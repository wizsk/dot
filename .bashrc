#	 _               _              
#	| |__   __ _ ___| |__  _ __ ___ 
#	| '_ \ / _` / __| '_ \| '__/ __|
#	| |_) | (_| \__ \ | | | | | (__ 
#	|_.__/ \__,_|___/_| |_|_|  \___|



# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#########################
# basic costomizations  #
########################

shopt -s autocd #Allows to do cd into directory merely by typing directory name
HISTSIZE= HISTFILESIZE= # INfinite history


##################
#       PS1       #
###################

PS1='[\u@\h \W]\$ '

#export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]hr \W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]🐣 \W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

###################
#      alias      #
###################


#### pacman ###
alias p="sudo pacman -S"
alias pu="sudo pacman -Syu"
alias prm="sudo pacman -Rns"

### colored output ###
alias grep="grep --color"
alias ls='ls --color=auto'
alias ll="ls -Alh"

#### git ###
alias g="git"
alias ga="git add"
alias gm="git commit -m"
alias gp="git push"
alias gst="git status"

alias crm="chromium"

alias ssd="shutdown --poweroff"

alias ythd="yt-dlp -f 137+140"

alias mpf="mpv -fs"

alias mp2="mpv -fs --speed=2"

alias pg="ping google.com"

alias nf="neofetch"

alias lis="light -S"
#  castom vars  #

export PATH=$PATH:/home/sk/.local/bin
export PATH=$PATH:/home/sk/.local/bin/dwmblock
######################

#####
## Manpage Stufffff

alias man="LESS='+Gg' man"
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

alias sx="source ~/.xinitrc"
