#####################################################
# Source code https://github.com/end222/pacmenu
# Updated by cryptopool.builders for crypto use...
#####################################################

source /etc/functions.sh

RESULT=$(dialog --stdout --nocancel --default-item 1 --title "Ultimate Crypto-Server Setup Installer v2.46" --menu "Choose one" -1 60 16 \
' ' "- YiiMP Server Install -" \
1 "YiiMP Single Server" \
2 "YiiMP Multi Server" \
' ' "- YiiMP Upgrade -" \
3 "YiiMP Stratum Upgrade" \
' '  "- NOMP Server Install -" \
4 "NOMP Server" \
' ' "- MPOS Server Install -" \
5 "MPOS Server - Coming Soon" \
' '  "- CryptoNote Server Install -" \
6 "CryptoNote-Nodejs Server - Coming Soon" \
' ' "- Faucet Server Install -" \
7 "Faucet Script - Coming Soon" \
' ' "- Daemon Wallet Builder -" \
8 "Daemonbuilder" \
9 Exit)
if [ $RESULT = ]
then
bash $(basename $0) && exit;
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
