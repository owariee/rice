#
# source plugins
#

source /usr/share/autojump/autojump.zsh
source /opt/asdf-vm/asdf.sh
source $XDG_CONFIG_HOME/zsh/horizon.zsh

ohmyzsh_lib key-bindings
ohmyzsh_plugin command-not-found
ohmyzsh_plugin compleat
ohmyzsh_plugin web-search
github_plugin zsh-users/zsh-autosuggestions
github_plugin zsh-users/zsh-syntax-highlighting
github_plugin zsh-users/zsh-history-substring-search
github_theme spaceship-prompt/spaceship-prompt spaceship

#
# enable history save, auto cd, completion and vi mode
#

HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTSIZE=50000
SAVEHIST=10000
setopt appendhistory

setopt auto_cd

zstyle :compinstall filename '/home/owari/.config/zsh/.zshrc'
autoload -Uz _store_cache compinit
compinit -C -d "$XDG_CACHE_HOME/zsh/zcompdump"

bindkey -v

#
# common-aliases replacement
#

alias ls="lsd"
alias l="ls -lfh"
alias lt="ls -ltFh"
alias ll="ls -l"
alias ldot="ls -ld .*"

alias grep="grep --color"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

alias -s lszip="unzip -l"
alias -s lsrar="unrar l"
alias -s lstar="tar tf"
alias -s lsace="unace l"V

alias vi="nvim"
alias vim="nvim"

alias dnf="dnf -C"
alias yay="yay --noconfirm"

alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gca="git commit --amend"
alias gp="git push"
alias gpl="git pull"
alias gs="git status"
alias gl="git log"
alias glo="git log --oneline"

alias z="j"

alias ssh="TERM=xterm-256color ssh"
alias rat="ratbagctl $(ratbagctl list | awk -F : '{print $1}')"

xset r rate 300 50

