#!/bin/bash
if [ ! -d "/src/out" ]; then
  echo "/src/out directory not mounted!"
  exit 1
fi

rm /src/out/*

git clone --depth 1 https://github.com/nicolasrmerz/LonganPi-3H-SDK.git /src/LonganPi-3H-SDK \
&& cd /src/LonganPi-3H-SDK && git config --global user.email "nop@nop.nop" && git config --global user.name "nop" \
&& export PATH="/usr/lib/ccache:/usr/local/opt/ccache/libexec:$PATH" \
&& sh mkatf.sh \
&& sh mkuboot.sh \
&& sh mklinux.sh \
&& sh mkoverlay.sh \
&& sh mkrootfs.sh \
&& sh mkimage.sh \
&& cp build/images/sdcard.img /src/out/sdcard.img
