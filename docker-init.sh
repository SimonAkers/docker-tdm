#!/usr/bin/env bash

git -C TwitchDropsMiner pull || git clone https://github.com/DevilXD/TwitchDropsMiner.git

rm -f /tmp/X19.lock
export DISPLAY=:19

Xvfb $DISPLAY -screen 0 1024x768x16 &

x11vnc -passwd $VNCPASS -display $DISPLAY -bg -forever -quiet

python3 ./TwitchDropsMiner/main.py
