#!/bin/sh

set -eu

ARCH=$(uname -m)
export ARCH
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/256x256/apps/safe-exam-browser.png
export DESKTOP=/usr/share/applications/safe-exam-browser.desktop
export DEPLOY_QT_WEB_ENGINE=1
export DEPLOY_OPENGL=1
export ANYLINUX_LIB=1

# Deploy dependencies
quick-sharun /usr/bin/safe-exam-browser

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage

# Test the app for 12 seconds, the app is a kiosk browser so it is
# expected to stay open, use --simple-test which only checks it starts
quick-sharun --simple-test ./dist/*.AppImage
