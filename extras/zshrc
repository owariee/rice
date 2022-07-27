# prompt
autoload -Uz vcs_info
autoload -U colors && colors
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep -q '^?? ' 2> /dev/null ; then
        hook_com[staged]+='T'
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " on  %b %{$fg[red]%}%m%u%c"

# d to show full pwd
PROMPT=$'\n'"%{$fg[magenta]%}%n@%m %{$fg[cyan]%}%3~%\%{$fg[yellow]%}\$vcs_info_msg_0_"
PROMPT+=$'\n'"%{$reset_color%}%{$fg_bold[green]%}➜ %{$reset_color%}"

# key bindings (emacs, viins, vicmd)
bindkey -e

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search

bindkey "${terminfo[kcbt]}" reverse-menu-complete
bindkey "${terminfo[kpp]}" up-line-or-history
bindkey "${terminfo[knp]}" down-line-or-history
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kdch1]}" delete-char
bindkey -s '^o' 'nvim $(fzf)^M'

# horizon plugin manager
# by: myself
function horizon() {
    REPO_DIR=$HOME/.cache/zsh/plugins/$1
    [ ! -d $REPO_DIR ] && git clone https://github.com/zsh-users/$1 $REPO_DIR
    source "$REPO_DIR/$1.zsh"
}

# source /opt/asdf-vm/asdf.sh
# source /etc/profile.d/autojump.sh
source /etc/profile.d/PackageKit.sh

horizon zsh-autosuggestions
horizon zsh-history-substring-search
horizon zsh-syntax-highlighting

# enable history save, auto cd, completion
HISTFILE="$HOME/.cache/zsh/history"
HISTSIZE=50000
SAVEHIST=10000
setopt appendhistory

setopt auto_cd

autoload -Uz _store_cache compinit 
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -C -d "$HOME/.cache/zsh/zcompdump"
_comp_options+=(globdots)

# common-aliases replacement
alias ls="exa --icons --group-directories-first -F"
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias ldot="ls -ld .*"

alias grep="grep --color"

alias rm='trash -i'
alias cp='cp -i'
alias mv='mv -i'

alias v="nvim"
alias d="sudo dnf -C"

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

export EDITOR="nvim"

export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'

