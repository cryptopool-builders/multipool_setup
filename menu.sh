#####################################################
# Source code https://github.com/end222/pacmenu
# Updated by cryptopool.builders for crypto use...
#####################################################

source /etc/functions.sh

RESULT=$(dialog --stdout --title "Ultimate Crypto-Server Setup Installer v1.44" --menu "Choose one" -1 60 9 \
1 "YiiMP Single Server" \
2 "YiiMP Multi Server" \
3 "YiiMP Stratum Upgrade" \
4 "NOMP Server" \
5 "MPOS Server - Coming Soon" \
6 "CryptoNote-Nodejs Server - Coming Soon" \
7 "Faucet Script - Coming Soon" \
8 "Coin Daemon Installer" \
9 Exit)
if [ $RESULT = ]
then
exit;
fi

if [ $RESULT = 1 ]
then
clear;
cd $HOME/multipool/install
source bootstrap_single.sh;
fi

if [ $RESULT = 2 ]
then
clear;
cd $HOME/multipool/install
source bootstrap_multi.sh;
fi

if [ $RESULT = 3 ]
then
clear;
cd $HOME/multipool/install
source bootstrap_upgrade.sh;
fi

if [ $RESULT = 4 ]
then
clear;
cd $HOME/multipool/install
source bootstrap_nomp.sh;
fi

if [ $RESULT = 5 ]
then
clear;
cd $HOME/multipool/install
exit 0;
fi

if [ $RESULT = 6 ]
then
clear;
cd $HOME/multipool/install
exit 0;
fi

if [ $RESULT = 7 ]
then
clear;
cd $HOME/multipool/install
exit 0;
fi

if [ $RESULT = 8 ]
then
clear;
cd $HOME/multipool/install
source bootstrap_coin.sh;
fi

if [ $RESULT = 9 ]
then
clear;
exit;
fi
