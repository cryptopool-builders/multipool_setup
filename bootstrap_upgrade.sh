#!/usr/bin/env bash


#########################################################
# Source https://mailinabox.email/ https://github.com/mail-in-a-box/mailinabox
# Updated by cryptopool.builders for crypto use...
# This script is intended to be ran from the multipool installer
#########################################################

if [ -z "${TAG}" ]; then
	TAG=v1.08
fi

# Clone the MultiPool repository if it doesn't exist.
if [ ! -d $HOME/multipool/yiimp_upgrade ]; then
	echo Downloading MultiPool YiiMP Stratum Upgrade Installer ${TAG}. . .
	git clone \
		-b ${TAG} --depth 1 \
		https://github.com/cryptopool-builders/multipool_yiimp_upgrade \
		$HOME/multipool/yiimp_upgrade \
		< /dev/null 2> /dev/null

	echo
fi

# Change directory to it.
cd $HOME/multipool/yiimp_upgrade

# Update it.
sudo chown -R $USER $HOME/multipool/install/.git/
if [ "${TAG}" != `git describe --tags` ]; then
	echo Updating MultiPool YiiMP Stratum Upgrade Installer to ${TAG} . . .
	git fetch --depth 1 --force --prune origin tag ${TAG}
	if ! git checkout -q ${TAG}; then
		echo "Update failed. Did you modify something in `pwd`?"
		exit
	fi
	echo
fi

# Start setup script.
cd $HOME/multipool/yiimp_upgrade
source start.sh
