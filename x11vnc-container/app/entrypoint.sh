#!/bin/sh
Xvfb ${DISPLAY} -screen 0 1024x768x24 +extension GLX +render -noreset -auth ${XAUTHORITY}&
sleep 3
x11vnc -display ${DISPLAY} -auth ${XAUTHORITY} -listen 0.0.0.0 -forever --nopw&
sleep 3
python src/main.py