#!/usr/bin/env bash

rm -rf TwitchDropsMiner
git clone $TDM_REPO TwitchDropsMiner

rm -f /tmp/X19.lock
export DISPLAY=:19

Xvfb $DISPLAY -screen 0 1024x768x16 &

x11vnc -passwd $VNCPASS -display $DISPLAY -bg -forever -quiet

python3 ./TwitchDropsMiner/main.py
