#!/bin/bash

LOG_FILE="/opt/dinhhn_auto_install/log/setup.log"

# Tạo log file
touch "$LOG_FILE"

# Chuyển hướng output sang log file
exec >> "$LOG_FILE"
exec 2>&1

# Ghi các thông tin vào log file
echo "Bắt đầu module Setup"
# Code của module Setup
mkdir /usr/java/

cp -r /opt/dinhhn_auto_install/file/jdk1.8.0_271/ /usr/java/

cp -r /opt/dinhhn_auto_install/file/environment /etc/
source /etc/environment 

update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 1
update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 1
update-alternatives --install /usr/bin/javaws javaws $JAVA_HOME/bin/javaws 1

java -version

# Kết thúc chuyển hướng output
exec 1>&-
exec 2>&-