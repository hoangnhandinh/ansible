#!/bin/bash

LOG_FILE="/opt/dinhhn_auto_install/log/nginxinstall.log"

# Tạo log file
touch "$LOG_FILE"

# Chuyển hướng output sang log file
exec >> "$LOG_FILE"
exec 2>&1

# Hàm để lấy thời gian
get_current_time() {
    date +"[%Y-%m-%d %H:%M:%S]"
}

# Ghi các thông tin vào log file với thời gian
echo "$(get_current_time) Bắt đầu module NGINX"
# Ghi các thông tin vào log file

apt-get install -y nginx
apt-get update

cp -r /opt/dinhhn_auto_install/file/nginx.conf /etc/nginx/conf.d/

apt-get remove apache2 -y 

systemctl restart nginx
systemctl status nginx

# Ghi các thông tin vào log file với thời gian
echo "$(get_current_time) Ket thuc module NGINX"

# Kết thúc chuyển hướng output
exec 1>&-
exec 2>&-


