#----------------------
# Default applications
export BROWSER="firefox"
export EDITOR="nvim"
export PAGER="less"
export SHELL="/bin/zsh"
export TERM="kitty"
export VISUAL="$EDITOR"

#----------------
# Japanese Input
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'

#-------------------
# Why not default??
export PATH="$HOME/.local/bin:/usr/lib/ccache/bin/:/usr/bin/vendor_perl/:$PATH"
export LC_ALL="en_US.UTF-8"
export ZDOTDIR="$HOME/.config/zsh"
export FZF_DEFAULT_COMMAND="find -L"

