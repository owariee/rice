#----------------------
# Default applications
export BROWSER="firefox"
export EDITOR="nvim"
export PAGER="less"
export SHELL="/bin/zsh"
export TERM="alacritty"
export VISUAL="$EDITOR"

#----------------
# Japanese Input
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'

#--------------
# XDG Env Vars 
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_RUNTIME_DIR="/run/user/1000"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_VIDEOS_DIR="$HOME/Videos"
export XDG_CURRENT_DESKTOP="Sway"

#-------------------
# Why not default??
export PATH="$HOME/.local/bin:/usr/lib/ccache/bin/:/usr/bin/vendor_perl/:$PATH"
export LC_ALL="en_US.UTF-8"

#--------------------------------------------------------------------
# Home cleanup (set XDG for everything that supports it in some way)
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_CUSTOM="$XDG_CACHE_HOME/oh-my-zsh/custom"
export ZSH="/home/owari/.cache/oh-my-zsh"

#----------------------------
# Enable hidden files in fzf
export FZF_DEFAULT_COMMAND="find -L"

