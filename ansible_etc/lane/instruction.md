Install ansible on master node
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible

Grant root priviledge to ansible user
sudo bash -c 'echo "its ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/its'

Enable Password Authentication if it has been disabled
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd.service

Generate an ssh key
su - its
ssh-keygen

Copy ssh public key to the managed nodes
ssh-copy-id -i ~/.ssh/id_rsa.pub its@10.12.22.94

ssh-keygen -t rsa -b 4096

You should be able to ssh to another Linux box without password
ssh its@10.12.22.94 date
Mon May 17 10:41:58 UTC 2021