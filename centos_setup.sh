systemctl stop postfix firewalld NetworkManager
systemctl disable postfix firewalld NetworkManager
echo "Stopped and Disabled postfix firewalld and NetworkManager"

setenforce 0
sed -i 's/enforcing/disabled/g' /etc/selinux/config /etc/selinux/config
echo "Disabled selinux"

sed  -i  's/PermitRootLogin no/PermitRootLogin yes/g'   /etc/ssh/sshd_config /etc/ssh/sshd_config
sed  -i  's/PasswordAuthentication no/PasswordAuthentication yes/g'   /etc/ssh/sshd_config /etc/ssh/sshd_config
systemctl reload sshd
echo "SSH settings done"

hostnamectl set-hostname openstack-vm
echo "Set 'openstack-vm' hostname" 
yum -y update
yum -y install centos-release-openstack-rocky
yum -y update
yum -y install openstack-packstack
echo "Updated packages and install openstack rocky repository and packstack"

yum -y install lvm2
sleep 2
pvcreate /dev/sdb
vgcreate cinder-volumes /dev/sdb
lvcreate -l 100%FREE -T cinder-volumes/cinder-volumes-pool
echo "Display PV status"
pvs
echo "Display VG status"
vgs
echo "Display LV status"
lvs
echo "mkfs.xfs /dev/sdc"
mkfs.xfs /dev/sdc
echo "Disk SDC formatted with XFS"
echo "End of Script"

