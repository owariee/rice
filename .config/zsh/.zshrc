#
# prompt
#

autoload -Uz vcs_info
autoload -U colors && colors
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep -q '^?? ' 2> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='T'
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " on  %b %{$fg[red]%}%m%u%c"

# d to show full pwd
PROMPT=$'\n'"%{$fg[magenta]%}%n@%m %{$fg[cyan]%}%3~%\%{$fg[yellow]%}\$vcs_info_msg_0_"
PROMPT+=$'\n'"%{$reset_color%}%{$fg_bold[green]%}➜ %{$reset_color%}"

#
# key bindings (emacs, viins, vicmd)
#

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

#
# horizon plugin manager
# by: myself
#

function horizon() {
    REPO_DIR=$XDG_CACHE_HOME/zsh/plugins/$1
    [ ! -d $REPO_DIR ] && git clone https://github.com/zsh-users/$1 $REPO_DIR
    source "$REPO_DIR/$1.zsh"
}

#
# source plugins
#

source /opt/asdf-vm/asdf.sh
source /usr/share/autojump/autojump.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

horizon zsh-autosuggestions
horizon zsh-history-substring-search
horizon zsh-syntax-highlighting

#
# web-search from oh-my-zsh cutted, splited, sliced, ripped!
#

function web_search() { xdg-open "$1${(j:+:)@[2,-1]}" }

alias google='web_search "https://www.google.com/search?q="'
alias ddg='web_search "https://www.duckduckgo.com/?q="'

alias wiki='ddg \!w'
alias news='ddg \!n'
alias yt='ddg \!yt'
alias map='ddg \!m'
alias image='ddg \!i'
alias ducky='ddg \!'
alias cppr='ddg \!cpp'

#
# enable history save, auto cd, completion
#

HISTFILE="$XDG_CACHE_HOME/zsh/history"
HISTSIZE=50000
SAVEHIST=10000
setopt appendhistory

setopt auto_cd

autoload -Uz _store_cache compinit 
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -C -d "$XDG_CACHE_HOME/zsh/zcompdump"
_comp_options+=(globdots)

#
# common-aliases replacement
#

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
alias rat="ratbagctl \$(ratbagctl list | awk -F : '{print $1}')"
alias ytaudio="youtube-dl -x --audio-format opus --audio-quality 0"
alias xwinwrap="xwinwrap -ni -s -nf -fs -b -un -argb -st -sp -nf -fdt -- mpv -wid WID --really-quiet --framedrop=vo --no-audio --panscan=\"1.0\""
alias extractaudio="ffmpeg -vn -acodec copy -i"
alias sxivsel="sxiv -ot"
alias loadwallpaper="xwallpaper --zoom \$(cat ~/.config/wallpaper)" 
alias setwallpaper="echo \$(sxivsel /mnt/data/pictures/wallpapers/baby-wogue) > ~/.config/wallpaper && loadwallpaper"
alias pulselatency="watch -n 1 \$(pacmd list-sinks | grep 'latency: [1-9]')"
alias pulseloopback="pactl load-module module-loopback"
alias pulseloopbackdisable="pactl unload-module module-loopback"
alias monitorenable="xrandr --output DVI-D-1 --mode 1366x768 --panning 1368x768+1920+672"
alias monitordisable="xrandr --output DVI-D-1 --off"
alias nasm="nasm -f elf32 -o"
alias ldasm="ld -m elf_i386 -o"

alias zshrc="nvim ~/rice/zsh/.config/zsh/.zshrc"

xset r rate 300 50

