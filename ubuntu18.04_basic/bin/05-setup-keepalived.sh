#!/bin/bash

LOG_FILE="/opt/dinhhn_auto_install/log/keepalived.log"

# Tạo log file
touch "$LOG_FILE"

# Chuyển hướng output sang log file
exec >> "$LOG_FILE"
exec 2>&1

# Ghi các thông tin vào log file
echo "Bắt đầu module keepalive"
# Code của module keepalived

cp -r /opt/dinhhn_auto_install/file/keepalived.conf /etc/keepalived/
systemctl restart keepalived.conf
ip a

# Kết thúc chuyển hướng output
exec 1>&-
exec 2>&-
