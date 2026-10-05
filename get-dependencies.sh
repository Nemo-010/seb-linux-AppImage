#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
	base-devel         \
	hicolor-icon-theme \
	polkit             \
	qt6-base           \
	qt6-svg            \
	qt6-tools          \
	qt6-webengine      \
	shared-mime-info   \
	zlib

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common ! gtk3

echo "Building safe-exam-browser..."
echo "---------------------------------------------------------------"
git clone https://github.com/Jvr2022/seb-linux.git ./seb-linux
cd ./seb-linux

if [ "${DEVEL_RELEASE-}" = 1 ]; then
	git rev-parse --short HEAD > ~/version
else
	git fetch --tags origin
	TAG=$(git tag --sort=-v:refname | head -1)
	git checkout "$TAG"
	echo "$TAG" > ~/version
fi

qmake6 seb-linux-qt.pro CONFIG+=force_qtwebengine
make -j"$(nproc)"
sudo make install
