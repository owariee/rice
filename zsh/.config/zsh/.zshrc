ZSH_THEME="spaceship"
export NVM_LAZY_LOAD=true
plugins=(
    git
    pip
    npm
    command-not-found
    autojump
#    common-aliases
    compleat
    web-search 
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
    zsh-nvm
    zsh-auto-nvm-use
)
source $ZSH/oh-my-zsh.sh

#
# common-aliases replacement
#

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

# . /opt/asdf-vm/asdf.sh

#compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

alias csgo="cp -rf ~/Projects/code/csgo-cfg/autoexec.cfg ~/Projects/code/csgo-cfg/knifes ~/.local/share/Steam/userdata/254174168/730/local/cfg/."
alias vps="TERM=xterm-256color ssh root@sabatini.xyz"
alias vps2="TERM=xterm-256color ssh admin@echidna.ga"
alias vi="nvim"
alias vim="nvim"
alias dnf="dnf -C"
alias dpi="ratbagctl thundering-gerbil resolution 0 dpi"
alias dosbox="dosbox -conf \"$XDG_CONFIG_HOME/dosbox/dosbox.conf\""
alias pidgin="pidgin --config=\"$XDG_DATA_HOME/purple\""
alias mbsync="mbsync -c \"$XDG_CONFIG_HOME/isync/mbsyncrc\""
alias dolphin="DESKTOP_SESSION=kde dolphin"
alias yay="yay --noconfirm"
alias ls="lsd" # can be exa

#unset GTK2_RC_FILES
#export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
#[[ -f ~/.gtkrc-2.0 ]] && rm ~/.gtkrc-2.0 > /dev/null 2>&1

xset r rate 300 50

