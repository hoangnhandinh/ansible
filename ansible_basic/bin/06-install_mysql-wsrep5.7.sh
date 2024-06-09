# #!/bin/bash

# LOG_FILE="/opt/dinhhn_auto_install/log/mysql.log"

# # Tạo log file
# touch "$LOG_FILE"

# # Chuyển hướng output sang log file
# exec >> "$LOG_FILE"
# exec 2>&1

# # Ghi các thông tin vào log file
# echo "Bắt đầu module mysql"
# # Code của module mysql
#xóa hết bản mysql cũ đi
sudo apt-get remove --purge mysql* -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y

#Check list mysql server
dpkg --list | grep mysql

#Check firewall
ufw status
ufw disable

#apt install mysql-server
apt-get install build-essential -y

apt-key adv --keyserver keyserver.ubuntu.com --recv BC19DDBA

apt-get update
apt install galera-3 mysql-wsrep-5.7 -y
apt install libmysqlclient20:amd64

#Coppy apt source
cp -r /opt/dinhhn_auto_install/file/galera.list /etc/apt/sources.list.d/
cp -r /opt/dinhhn_auto_install/file/galera.pref /etc/apt/preferences.d/

ln -s /etc/apparmor.d/usr.sbin.mysqld /etc/apparmor.d/disable/
apparmor_parser -R /etc/apparmor.d/usr.sbin.mysqld

# Coppy file galera.cnf

sudo ufw allow 3306,4567,4568,4444/tcp
sudo ufw allow 4567/udp 
sudo systemctl disable mysql 

# Kết thúc chuyển hướng output
# exec 1>&-
# exec 2>&-
