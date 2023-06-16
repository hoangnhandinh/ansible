#!/bin/bash

total_steps=6
current_step=0

# Tính phần trăm
calculate_progress() {
  progress=$((current_step * 100 / total_steps))
  echo "Progress: $progress%"
}

# Hàm thực hiện công việc của từng bước
perform_step() {
  # Thực hiện công việc của bước hiện tại ở đây
  case $current_step in
    0)
      echo "Step 1 in progress..."
      ./01-install-package.sh >> nohup.out 2>&1
      ;;
    1)
      echo "Step 2 in progress..."
      ./02-setup-java.sh >> nohup.out 2>&1
      ;;
    2)
      echo "Step 3 in progress..."
      ./03-settimezone-nptd.sh >> nohup.out 2>&1
      ;;
    3)
      echo "Step 4 in progress..."
      ./04-setupnginx.sh >> nohup.out 2>&1
      ;;
    4)
      echo "Step 5 in progress..."
      ./05-setup-keepalived.sh >> nohup.out 2>&1
      ;;

    esac

  # Tăng biến đếm
  current_step=$((current_step + 1))
  
  # Tính và hiển thị phần trăm tiến độ
  calculate_progress
}

# Chạy các bước trong vòng lặp
while [ $current_step -lt $total_steps ]; do
  perform_step
done

# Hoàn thành công việc
echo "Process 5 completed!"

echo "Step 6 in progress..."
./06-install_mysql-wsrep5.7.sh