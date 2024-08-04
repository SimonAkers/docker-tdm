#!/usr/bin/env bash

git -C TwitchDropsMiner pull || git clone $TDM_REPO TwitchDropsMiner

rm -f /tmp/.X19-lock
rm -f /tmp/.X11-unix/X19

export DISPLAY=:19

Xvfb $DISPLAY -screen 0 1600x900x16 &

fluxbox > /dev/null 2>&1 &

x11vnc -passwd $VNCPASS -display $DISPLAY -bg -forever -quiet || exit 1

python3 ./TwitchDropsMiner/main.py &

window_id=$(xdotool search --sync --name "Twitch")
#xdotool windowsize $window_id 100% 100%
wmctrl -ir $window_id -b add,maximized_vert,maximized_horz

wait
