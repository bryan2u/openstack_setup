sudo -i
echo "Switched to root user"
systemctl stop postfix firewalld NetworkManager
systemctl disable postfix firewalld NetworkManager
echo "Stopped and Disabled postfix firewalld and NetworkManager"
setenforce 0
sed -i 's/enforcing/disabled/g' /etc/selinux/config /etc/selinux/config
echo "Disabled selinux"
hostnamectl set-hostname openstack-vm
sudo -i
echo "Set hostname" 
yum -y update
yum -y install centos-release-openstack-rocky
yum -y update
yum -y install openstack-packstack
echo "Update packages and install openstack rocky repository and packstack"
echo 'Manual steps: Setup your static IP address and fdisk /dev/sdb ' 
echo 'Once done, you can run "packstack --answer-file answers.txt" ' 
