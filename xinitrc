# xinput --set-prop 'Logitech G403 Prodigy Gaming Mouse' 'libinput Accel Profile Enabled' 0, 1 &
# xrandr --output DisplayPort-1 --mode 1920x1080 --rate 144 --output DVI-D-0 --mode 1366x768 --pos 1920x670
# setxkbmap -model pc104 -layout us,us,us -variant ,alt-intl,colemak -option caps:swapescape -option grp:menu_toggle &
# setxkbmap -model pc104 -layout us -variant alt-intl &
# xset r rate 300 50 &
# xrdb ~/.config/x11/xresources
# vibrantLinux --hidden &
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY
# fcitx -d &
kdeconnect-indicator &
exec startplasma-x11
