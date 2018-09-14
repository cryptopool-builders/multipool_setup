# Source https://mailinabox.email/ https://github.com/mail-in-a-box/mailinabox
# Updated by cryptopool.builders for crypto use...

if [ "`lsb_release -d | sed 's/.*:\s*//' | sed 's/16\.04\.[0-9]/16.04/' `" != "Ubuntu 16.04 LTS" ]; then
echo "Ultimate Crypto-Server Setup Installer only supports being installed on Ubuntu 16.04, sorry. You are running:"
echo
lsb_release -d | sed 's/.*:\s*//'
echo
echo "We can't write scripts that run on every possible setup, sorry."
exit
fi

TOTAL_PHYSICAL_MEM=$(head -n 1 /proc/meminfo | awk '{print $2}')
if [ $TOTAL_PHYSICAL_MEM -lt 2000000 ]; then
if [ ! -d /vagrant ]; then
TOTAL_PHYSICAL_MEM=$(expr \( \( $TOTAL_PHYSICAL_MEM \* 1024 \) / 1000 \) / 1000)
echo "Your Crypto-Pool Server needs more memory (RAM) to function properly."
echo "Please provision a machine with at least 2 GB, 6 GB recommended."
echo "This machine has $TOTAL_PHYSICAL_MEM MB memory."
exit
fi
fi
if [ $TOTAL_PHYSICAL_MEM -lt 2000000 ]; then
echo "WARNING: Your Crypto-Pool Server has less than 4 GB of memory."
echo " It might run unreliably when under heavy load."
fi

ARCHITECTURE=$(uname -m)
if [ "$ARCHITECTURE" != "x86_64" ]; then
if [ -z "$ARM" ]; then
echo "Ultimate Crypto-Server Setup Installer only supports x86_64 and will not work on any other architecture, like ARM or 32 bit OS."
echo "Your architecture is $ARCHITECTURE"
exit
fi
fi
