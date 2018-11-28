#!/usr/bin/env bash


#########################################################
# Source https://mailinabox.email/ https://github.com/mail-in-a-box/mailinabox
# Updated by cryptopool.builders for crypto use...
# This script is intended to be ran from the multipool installer
#########################################################

if [ -z "${TAG}" ]; then
	TAG=v1.12
fi

# Clone the MultiPool repository if it doesn't exist.
if [ ! -d $HOME/multipool/nomp ]; then
	echo Downloading MultiPool NOMP Server Installer ${TAG}. . .
	git clone \
		-b ${TAG} --depth 1 \
		https://github.com/cryptopool-builders/multipool_nomp \
		$HOME/multipool/nomp \
		< /dev/null 2> /dev/null

	echo
fi

# Change directory to it.
cd $HOME/multipool/nomp

# Update it.
sudo chown -R $USER $HOME/multipool/install/.git/
if [ "${TAG}" != `git describe --tags` ]; then
	echo Updating MultiPool NOMP Server Installer to ${TAG} . . .
	git fetch --depth 1 --force --prune origin tag ${TAG}
	if ! git checkout -q ${TAG}; then
		echo "Update failed. Did you modify something in `pwd`?"
		exit
	fi
	echo
fi

# Start setup script.
cd $HOME/multipool/nomp
source start.sh
