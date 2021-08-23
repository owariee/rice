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
PROMPT=$'\n'"%{$fg[magenta]%}%n@%m %{$fg[cyan]%}%3~%\%{$fg[yellow]%}\$vcs_info_msg_0_"$'\n'
PROMPT+="%{$reset_color%}%{$fg_bold[green]%}➜ %{$reset_color%}"

#
# key bindings (emacs, viins, vicmd)
#
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
bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search

bindkey -M viins "${terminfo[khome]}" beginning-of-line
bindkey -M viins "${terminfo[kend]}"  end-of-line
bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
bindkey -M viins "${terminfo[kpp]}" up-line-or-history
bindkey -M viins "${terminfo[knp]}" down-line-or-history
bindkey -M viins '^[[1;5C' forward-word
bindkey -M viins '^[[1;5D' backward-word

#
# horizon plugin manager
# by: myself
#

function horizon() {
    REPO_NAME=$(echo $1 | awk -F / '{print $NF}')
    REPO_DIR=$XDG_CACHE_HOME/zsh/plugins/$REPO_NAME
    [ ! -d $REPO_DIR ] && git clone https://github.com/$1 $REPO_DIR
    source "$REPO_DIR/$REPO_NAME.zsh"
}

#
# source plugins
#

source /usr/share/doc/pkgfile/command-not-found.zsh
source /usr/share/autojump/autojump.zsh
source /opt/asdf-vm/asdf.sh
source $XDG_CONFIG_HOME/zsh/horizon.zsh

clone_repo zsh-users/zsh-autosuggestions
clone_repo zsh-users/zsh-syntax-highlighting
clone_repo zsh-users/zsh-history-substring-search

#
# web-search from oh-my-zsh
#

# web_search from terminal

function web_search() {
  emulate -L zsh

  # define search engine URLS
  typeset -A urls
  urls=(
    $ZSH_WEB_SEARCH_ENGINES
    google      "https://www.google.com/search?q="
    bing        "https://www.bing.com/search?q="
    yahoo       "https://search.yahoo.com/search?p="
    duckduckgo  "https://www.duckduckgo.com/?q="
    startpage   "https://www.startpage.com/do/search?q="
    yandex      "https://yandex.ru/yandsearch?text="
    github      "https://github.com/search?q="
    baidu       "https://www.baidu.com/s?wd="
    ecosia      "https://www.ecosia.org/search?q="
    goodreads   "https://www.goodreads.com/search?q="
    qwant       "https://www.qwant.com/?q="
    givero      "https://www.givero.com/search?q="
    stackoverflow  "https://stackoverflow.com/search?q="
    wolframalpha   "https://www.wolframalpha.com/input/?i="
    archive     "https://web.archive.org/web/*/"
    scholar        "https://scholar.google.com/scholar?q="
  )

  # check whether the search engine is supported
  if [[ -z "$urls[$1]" ]]; then
    echo "Search engine '$1' not supported."
    return 1
  fi

  # search or go to main page depending on number of arguments passed
  if [[ $# -gt 1 ]]; then
    # build search url:
    # join arguments passed with '+', then append to search engine URL
    url="${urls[$1]}${(j:+:)@[2,-1]}"
  else
    # build main page url:
    # split by '/', then rejoin protocol (1) and domain (2) parts with '//'
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi

  open_command "$url"
}

alias bing='web_search bing'
alias google='web_search google'
alias yahoo='web_search yahoo'
alias ddg='web_search duckduckgo'
alias sp='web_search startpage'
alias yandex='web_search yandex'
alias github='web_search github'
alias baidu='web_search baidu'
alias ecosia='web_search ecosia'
alias goodreads='web_search goodreads'
alias qwant='web_search qwant'
alias givero='web_search givero'
alias stackoverflow='web_search stackoverflow'
alias wolframalpha='web_search wolframalpha'
alias archive='web_search archive'
alias scholar='web_search scholar'

#add your own !bang searches here
alias wiki='web_search duckduckgo \!w'
alias news='web_search duckduckgo \!n'
alias youtube='web_search duckduckgo \!yt'
alias map='web_search duckduckgo \!m'
alias image='web_search duckduckgo \!i'
alias ducky='web_search duckduckgo \!'

# other search engine aliases
if [[ ${#ZSH_WEB_SEARCH_ENGINES} -gt 0 ]]; then
  typeset -A engines
  engines=($ZSH_WEB_SEARCH_ENGINES)
  for key in ${(k)engines}; do
    alias "$key"="web_search $key"
  done
  unset engines key
fi


#
# enable history save, auto cd, completion and vi mode
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

bindkey -v

#
# common-aliases replacement
#

alias ls="exa --icons -a --group-directories-first"
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

alias zshrc="nvim ~/rice/zsh/.config/zsh/.zshrc"
alias hzedit="nvim ~/rice/zsh/.config/zsh/horizon.zsh"

xset r rate 300 50

