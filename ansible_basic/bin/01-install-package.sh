#!/bin/bash

LOG_FILE="/opt/dinhhn_auto_install/log/package.log"

# Tạo log file
touch "$LOG_FILE"

# Chuyển hướng output sang log file
exec >> "$LOG_FILE"
exec 2>&1

# Ghi các thông tin vào log file
echo "Bắt đầu module Package"
# Code của module Package

apt-get install -y tzdata
apt-get install -y build-essential
apt-get install -y qt5-default
apt-get install -y libace-dev
apt-get install -y liblog4cxx-dev
apt-get install -y libboost-dev
apt-get install -y libboost-filesystem-dev
apt-get install -y libboost-program-options-dev
apt-get install -y libcpprest-dev
apt-get install -y libcurl4
apt-get install -y libcurl4-gnutls-dev
apt-get install -y libavcodec-dev
apt-get install -y libavformat-dev
apt-get install -y libavresample-dev
apt-get install -y libavutil-dev
apt-get install -y libswresample-dev
apt-get install -y libswscale-dev
apt-get install -y libavfilter-dev
apt-get install -y libavdevice-dev
apt-get install -y libtesseract-dev
apt-get install -y libtesseract4
apt-get install -y libopencv-dev
apt-get install -y libopencv-highgui-dev
apt-get install -y libopencv-imgproc-dev
apt-get install -y libopencv-video-dev
apt-get install -y libopencv-videoio-dev
apt-get install -y libopencv-imgcodecs-dev
apt-get install -y xvfb
apt-get install -y vim net-tools telnet
apt-get install -y cron
apt-get install -y gdb
apt-get install -y curl
apt-get install -y ntp
apt-get install -y nginx
apt-get install -y keepalived

# Kết thúc chuyển hướng output
exec 1>&-
exec 2>&-