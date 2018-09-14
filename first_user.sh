source /etc/functions.sh
cd ~/multipool/install
clear
message_box "Ultimate Crypto-Server Setup Installer" \
"Naughty, naughty! You are trying to install this as the root user!
\n\nRunning any application as root is a serious security risk.
\n\nTherefore we make you create a user account :)"

if [ -z "$yiimpadmin" ]; then
DEFAULT_yiimpadmin=yiimpadmin
input_box "New Account Name" \
"Please enter your desired user name.
\n\nUser Name:" \
$DEFAULT_yiimpadmin \
yiimpadmin

if [ -z "$yiimpadmin" ]; then
# user hit ESC/cancel
exit
fi
fi

if [ -z "$RootPassword" ]; then
DEFAULT_RootPassword=$(openssl rand -base64 8 | tr -d "=+/")
input_box "User Password" \
"Enter your new user password or use this randomly system generated one.
\n\nUnfortunatley dialog doesnt let you copy. So you have to write it down.
\n\nUser password:" \
$DEFAULT_RootPassword \
RootPassword

if [ -z "$RootPassword" ]; then
# user hit ESC/cancel
exit
fi
fi

clear
echo Adding new user and password...

sudo adduser $yiimpadmin --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
echo -e "$RootPassword\n$RootPassword" | passwd $yiimpadmin
sudo usermod -aG sudo $yiimpadmin

echo '# yiimp
# It needs passwordless sudo functionality.
'""''"${yiimpadmin}"''""' ALL=(ALL) NOPASSWD:ALL
' | sudo -E tee /etc/sudoers.d/$yiimpadmin >/dev/null 2>&1

echo '
cd ~/multipool/install
bash start.sh
' | sudo -E tee /usr/bin/multipool >/dev/null 2>&1
sudo chmod +x /usr/bin/multipool

sudo cp -r ~/multipool /home/$yiimpadmin/
cd ~
sudo rm -r multipool
sudo setfacl -m u:$yiimpadmin:rwx /home/$yiimpadmin/multipool

echo New User is installed... Please reboot system and log in as the new user and type multipool to continue setup...
exit
