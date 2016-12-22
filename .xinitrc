#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[ -f ~/.Xresources ] && xrdb ~/.Xresources

xset -dpms &
xset s off &
#xset fp+ $HOME/.fonts/bitocra 
xset fp+ $HOME/.fonts/ohsnap
xset +fp /usr/share/fonts/local
xset fp rehash 

#setxkbmap gb &
nitrogen --restore &
compton --config ~/.config/compton.conf -b &
urxvtd -q -o -f 
(conky | while read LINE; do xsetroot -name "$LINE"; done) &
#sudo service mpd stop &
#[ ! -s ~/.config/mpd/pid ] && mpd &
#(sleep 3s && mpd) &
redshift &
#(sleep 5s && rofi -key-run F12) &

exec dwm 
