if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#antigen bundle zsh-users/zsh-syntax-highlighting
#antigen theme denysdovhan/spaceship-prompt

. /opt/asdf-vm/asdf.sh

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

unset GTK2_RC_FILES
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
[[ -f ~/.gtkrc-2.0 ]] && rm ~/.gtkrc-2.0 > /dev/null 2>&1

xset r rate 300 50

export ZSH="/home/owari/.cache/oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

alias ls="ls --color" # instead of exa

