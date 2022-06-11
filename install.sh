#!/usr/bin/env bash
cd .config
for d in */ 
do
  [[ -d ~/.local/${d%/} ]] && [[ ! -L ~/.config/${d%/} ]] && rm -rf ~/.config/$d
  ln -sf $(pwd)/$d ~/.config
  echo "Symlink created for ${d%/}!"
done
cd ..

cd .local
for d in */
do
  [[ -d ~/.local/${d%/} ]] && [[ ! -L ~/.local/${d%/} ]] && rm -rf ~/.local/$d
  ln -sf $(pwd)/$d ~/.local
  echo "Symlink created for ${d%/}!"
done
cd ..

ln -sf $(pwd)/.zshenv ~/
echo "Symlink created for .zshenv!"

CRONTAB_LOCATION="/var/spool/cron/$(whoami)"
[[ -f $CRONTAB_LOCATION ]] && doas rm -rf $CRONTAB_LOCATION
doas ln -sf $(pwd)/crontab /var/spool/cron/$(whoami)
echo "Symlink created for crontab!"

FF_DIR="/home/$(whoami)/.mozilla/firefox"
FF_PROFILES_PATH=(
  $(sed -n '/^\[Profile.]$/,/^$/p' $FF_DIR/profiles.ini | grep 'Path' | cut -c 6-)
)
FF_VALID_PROFILES=()
for f in ${FF_PROFILES_PATH[@]}; do
  TMP_PROFILE_PATH=$FF_DIR/$f
  if [[ -f $TMP_PROFILE_PATH/prefs.js ]]; then
    FF_VALID_PROFILES+=($TMP_PROFILE_PATH)
  fi
done
for v in ${FF_VALID_PROFILES[@]}; do
  USERCHROME_DIR=$v/chrome
  USERCHROME=$USERCHROME_DIR/userChrome.css
  [[ ! -d $USERCHROME_DIR ]] && mkdir -p $USERCHROME_DIR
  [[ -f $USERCHROME ]] && [[ ! -L $USERCHROME ]] && rm -rf $USERCHROME
  ln -sf $(pwd)/userChrome.css $USERCHROME
  echo "Symlink created for userChrome.css!"
done

AUTOLOGIN_DIR=/etc/systemd/system/getty@tty1.service.d
AUTOLOGIN_FILE=$AUTLOGIN_DIR/autlogin.conf
[[ ! -d $AUTOLOGIN_DIR ]] && mkdir -p $AUTOLOGIN_DIR
[[ -f $AUTOLOGIN_FILE ]]  && [[ ! -L $AUTOLOGIN_FILE ]] && rm -rf $AUTOLOGIN_FILE
ln -sf $(pwd)/autologin.conf $AUTOLOGIN_FILE
echo "Autologin enabled!"
