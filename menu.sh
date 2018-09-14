source /etc/functions.sh

RESULT=$(dialog --stdout --title "Ultimate Crypto-Server Setup Installer" --menu "Choose one" -1 60 8 \
1 "YiiMP Single Server" \
2 "YiiMP Multi Server" \
3 "YiiMP Upgrade" \
4 NOMP \
5 MPOS \
6 CryptoNote-Nodejs \
7 "Faucet Script" \
8 Exit)
if [ $RESULT = ]
then
exit ;
fi


if [ $RESULT = 1 ]
then
clear;
cd yiimp-single
source start.sh;
fi

if [ $RESULT = 2 ]
then
clear;
cd yiimp_multi
source start.sh;
fi

if [ $RESULT = 3 ]
then
clear;
source yiimp_upgrade.sh;
fi

if [ $RESULT = 4 ]
then
clear;
cd nomp
source start.sh;
fi

if [ $RESULT = 5 ]
then
clear;
source mpos.sh;
fi

if [ $RESULT = 6 ]
then
clear;
source cryptonote.sh;
fi

if [ $RESULT = 7 ]
then
clear;
source faucet.sh;
fi

if [ $RESULT = 8 ]
then
clear;
exit;
fi
