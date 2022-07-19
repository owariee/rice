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
#export XCURSOR_PATH="$XDG_DATA_HOME/icons:$XCURSOR_PATH"
export STEAM_COMPAT_CLIENT_INSTALL_PATH="$XDG_DATA_HOME/Steam"
export LC_ALL="en_US.UTF-8"

#------
# Dbus
#export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"

#--------------------------------------------------------------------
# Home cleanup (set XDG for everything that supports it in some way)

#[ -z "$XDG_CONFIG_HOME/dosbox" ] && mkdir -p "$XDG_CACHE_HOME/dosbox"
#[ -z "$XDG_CACHE_HOME/less" ] && mkdir -p "$XDG_CACHE_HOME/less"
#[ -z "$XDG_CACHE_HOME/zsh" ] && mkdir -p "$XDG_CACHE_HOME/zsh"
#[ -z "$XDG_CONFIG_HOME/zsh" ] && mkdir -p "$XDG_CONFIG_HOME/zsh"
#[ -z "$XDG_DATA_HOME/zsh" ] && mkdir -p "$XDG_DATA_HOME/zsh"
#
#export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
#export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME/asdfrc"
#export ASDF_DATA_DIR="$XDG_CACHE_HOME/asdf"
#export CCACHE_CONFIGPATH="$XDG_CONFIG_HOME/ccache/config"
#export CCACHE_DIR="$XDG_CACHE_HOME/ccache"
#export GNUPGHOME="$XDG_DATA_HOME/gnupg"
#export GOPATH="$XDG_DATA_HOME/go"
#export GTK_RC_FILES="$XDG_CONFIG_HOME/gtk-1.0/gtkrc"
#export HISTFILE="$XDG_DATA_HOME/zsh/history"
#export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
#export KDEHOME="$XDG_CONFIG_HOME/kde"
#export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
#export LESSKEY="$XDG_CACHE_HOME/less/lesskey"
#export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql_history"
#export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
#export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
#export PYLINTHOME="$XDG_CACHE_HOME/pylint"
#export PYTHONSTARTUP="$XDG_DATA_HOME/../bin/python_init.py"
#export VSCODE_PORTABLE="$XDG_DATA_HOME/vscode"
#export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
#export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_CUSTOM="$XDG_CACHE_HOME/oh-my-zsh/custom"
export ZSH="/home/owari/.cache/oh-my-zsh"

#-----------------------
# Qt5ct (Use GTK Theme)
export QT_QPA_PLATFORMTHEME="qt5ct"

#--------------------------
# Less syntax highlighting

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     
export LESS_TERMCAP_md=$'\E[1;36m'     
export LESS_TERMCAP_me=$'\E[0m'        
export LESS_TERMCAP_so=$'\E[01;44;33m' 
export LESS_TERMCAP_se=$'\E[0m'        
export LESS_TERMCAP_us=$'\E[1;32m'     
export LESS_TERMCAP_ue=$'\E[0m'        
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"

#-----------------------------
# Lf file manager emoji icons

export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.webp=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.jpe=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.tif=🖼:\
*.tiff=🖼:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.m=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.wav=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.mov=🎥:\
*.mpg=🎥:\
*.wmv=🎥:\
*.m4b=🎥:\
*.flv=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.gba=🎮:\
*.nes=🎮:\
*.gdi=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
*.jar=♨:\
*.java=♨:\
"

#----------------------------
# Enable hidden files in fzf
export FZF_DEFAULT_COMMAND="find -L"

#---------
# Wayland
# export MOZ_ENABLE_WAYLAND=1
# export SDL_VIDEODRIVER=wayland

#-------------
# Start X.Org

[ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ] && startx # or startx

