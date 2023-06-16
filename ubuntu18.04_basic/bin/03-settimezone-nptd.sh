#!/bin/bash

LOG_FILE="/opt/dinhhn_auto_install/log/timezone.log"

# Tạo log file
touch "$LOG_FILE"

# Chuyển hướng output sang log file
exec >> "$LOG_FILE"
exec 2>&1

# Ghi các thông tin vào log file
echo "Bắt đầu module Time"
# Code của module Time

settimezone: timedatectl set-timezone Asia/Ho_Chi_Minh

cp -r /opt/dinhhn_auto_install/file/ntp.conf /etc/
systemctl restart ntp.conf
ntpq -p

# Kết thúc chuyển hướng output
exec 1>&-
exec 2>&-