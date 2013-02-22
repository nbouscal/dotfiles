[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xloadimage -onroot -fullscreen ~/Pictures/background.jpg

xmobar &
xmonad
