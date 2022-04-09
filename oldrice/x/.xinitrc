#xrandr --output DP-2 --mode 1920x1080 --rate 144
xwallpaper --zoom $(cat ~/.config/wallpaper)
mpd &
picom &
sxhkd &
xss-lock --transfer-sleep-lock -- slock &
unclutter &
redshift &
dunst &
nm-applet &
xrdb ~/.config/X11/xresources
exec i3
