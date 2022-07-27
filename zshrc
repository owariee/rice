[[ ! -f $HOME/.cache/antigen.zsh ]] && curl -L git.io/antigen > $HOME/.cache/antigen.zsh
source $HOME/.cache/antigen.zsh

antigen use oh-my-zsh
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

antigen bundle command-not-found
antigen bundle autojump
antigen bundle compleat
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
antigen bundle zsh-users/zsh-autosuggestions

antigen apply

export EDITOR="nvim"
alias ls="exa --group-directories-first"
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"

alias rm='trash -i'

alias v="nvim"
alias d="sudo dnf"

alias g="git"
alias ga="git add"
alias gc="git commit -m"
alias gca="git commit --amend"
alias gp="git push"
alias gpl="git pull"
alias gs="git status"
alias gl="git log"
alias glo="git log --oneline"

alias dd="sudo dd bs=4M conv=fdatasync status=progress"
alias audioloopback="pactl load-module module-loopback"
alias audioloopbackdisable="pactl unload-module module-loopback"
