lsblk
sudo apt install mdadm
sudo mdadm --create /dev/md0 --level=5 --raid-devices=3 /dev/sda /dev/sdb /dev/sdc
cat /proc/mdstat
sudo apt install lvm2
cat /proc/mdstat
sudo pvcreate /dev/md0 /dev/sdd
lsblk
sudo pvcreate /dev/md0 /dev/sde
sudo vgcreate vg00 /dev/md0 /dev/sde
sudo lvcreate -n lv0 vg00 -l +100%FREE
lsblk
cat /proc/mdstat
sudo mkdir /media/logicalvolume0
sudo mkfs.ext4 /dev/mapper/vg00-lv0
sudo vim /etc/fstab
sudo mount -a
df -h
cat /proc/mdstat
sudo sh -c 'mdadm --detail --scan /dev/md0 >> /etc/mdadm/mdadm.conf'
sudo update-initramfs -u
sudo apt install nfs-kernel-server
sudo vim /etc/exports
cat /etc/exports
sudo apt install openvpn easy-rsa
cd /usr/share/easy-rsa
ls -l
cp vars.example vars
sudo cp vars.example vars
sudo vim vars
sudo ./easyrsa
sudo ./easyrsa init-pki
sudo ./easyrsa build-ca nopass
sudo ./easyrsa gen-req headnode nopass
sudo ./easyrsa gen-req node0 nopass
sudo ./easyrsa gen-req node1 nopass
sudo ./easyrsa gen-req node2 nopass
sudo apt install tree
ls -l
tree pki
sudo tree pki
sudo ./easyrsa sign-req server headnode 
sudo ./easyrsa sign-req client node0 
sudo ./easyrsa sign-req client node1 
sudo ./easyrsa sign-req client node2 
tree pki
sudo tree pki
sudo ./easyrsa gen-dh 
sudo openvpn --genkey secret ta.key
ls -l
sudo cd pki
cd
sudo cp /usr/share/easy-rsa/ta.key /etc/openvpn/
sudo cp /usr/share/easy-rsa/pki/dh.pem /etc/openvpn/
sudo cp /usr/share/easy-rsa/pki/ca.crt /etc/openvpn/
sudo cp /usr/share/easy-rsa/pki/private/headnode.key /etc/openvpn/
sudo cp /usr/share/easy-rsa/pki/issued/headnode.crt /etc/openvpn/
cd /etc/openvpn
ls -l
sudo cp /usr/share/doc/openvpn/examples/sample-config-files/server.conf /etc/openvpn/headnode.conf
sudo vim headnode.conf
sudo systemctl list-units
sudo systemctl list-units | grep openvpn
sudo systemctl list-unit-files | grep openvpn
sudo systemctl enable openvpn@headnode
sudo systemctl start openvpn@headnode
sudo systemctl status openvpn@headnode
exit
sudo netstat
sudo netstat -nltu
sudo netstat -nlpu
ip a
sudo apt install iptables iptables-persistent
sudo vim /etc/sysctl.conf
sudo sysctl -p
sudo -i
clear
cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf .
vim client.conf
mkdir -p client-configs/{keys,files}
ls client-configs
sudo cp /usr/share/easy-rsa/ta.key client-configs/keys/
sudo cp /usr/share/easy-rsa/pki/ca.crt client-configs/keys/
sudo cp /usr/share/easy-rsa/pki/issued/node0.crt client-configs/keys/
sudo cp /usr/share/easy-rsa/pki/issued/node1.crt client-configs/keys/
sudo cp /usr/share/easy-rsa/pki/issued/node2.crt client-configs/keys/
sudo cp /usr/share/easy-rsa/pki/private/node0.key client-configs/keys/
sudo cp /usr/share/easy-rsa/pki/private/node1.key client-configs/keys/
sudo cp /usr/share/easy-rsa/pki/private/node2.key client-configs/keys/
mv client.conf client-configs/base.conf
sudo mv client.conf client-configs/base.conf
tree client-configs/
sudo chown -R fanis:fanis client-configs
cat client.configs/base.conf
cat client-configs/base.conf
vim client-configs/make_config.sh
cd client-configs/
ls
sudo ./make_config.sh
ls -l
chmod +x make_config.sh
./make_config.sh
tree.
tree
./make_config.sh node0
./make_config.sh node1
./make_config.sh node2
tree
vim files/node0.ovpn
sudo apt install tcpdump
ip a
tcpdump -i eth0
sudo tchpdump -i etc0
sudo tchpdump -i eth0
tchpdump -i eth0
tcpdump -i eth0
sudo tcpdump -i eth0
ip a
cd /
exit
ip a
ping 10.10.10.6
cat /var/log
cat /var/log/openvpn/ipp.txt
sudo cat /var/log/openvpn/ipp.txt
sudo cat /var/log/openvpn/openvpn-status.log
ls
pwd
cd /home/fanis/client-configs

cd /home/fanis/client-configs/files
ls
sudo cat /var/log/openvpn/openvpn-status.log
history
sudo cat /var/log/openvpn/openvpn-status.log
sudo iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
sudo iptables -t nat -L 
sudo iptables -t nat -L
sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 2222 -j DNAT --to-destination 10.10.10.6:22
sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 2223 -j DNAT --to-destination 10.10.10.14:22
sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 2224 -j DNAT --to-destination 10.10.10.10:22
sudo iptables-save >  /etc/iptables/rules.v4 
sudo -i
sudo iptables -t nat -L
sudo cat /var/log/openvpn/openvpn-status.log 
cd client-configs
ip a
sudo vim client.conf
vim client.conf
tree client-configs/
cd client-configs/
ls
cd /fanis
cd 
sudo cat/var/log/openvpn/opevpn-status.log
sudo cat/var/log/openvpn/openvpn-status.log
sudo cat /var/log/openvpn/openvpn-status.log
ip a
sudo cat /var/log/openvpn/openvpn-status.log
vim /etc/exports
sudo vim /etc/exports
sudo systemctl restart nfs-kernel-server
clear
cat /media/logicalvolume0/node_cswitch_calc.sh 
ls -l /media/logicalvolume0/node_cswitch_calc.sh 
ls
ls /media/lv0
ls /media/logicalvolume0/
sudo /media/logicalvolume0/node_cswitch_calc.sh 
sudo  vim /media/logicalvolume0/node_cswitch_calc.sh 
ls
ls /media/logicalvolume0/
cat /media/logicalvolume0/cswitches_node1 
ls /media/logicalvolume0/
awk '{sum+=$3; count++} END {print sum/count}' node_cswitch_calc.sh
awk '{sum+=$3; count++} END {print sum/count}' /media/logicalvolume0/node_cswitch_calc.sh
awk '{sum+=$1; count++} END {print sum/count}' /media/logicalvolume0/node_cswitch_calc.sh
awk '{sum+=$10; count++} END {print sum/count}' /media/logicalvolume0/node_cswitch_calc.sh
awk '{print $10}' /media/logicalvolume0/node_cswitch_calc.sh
awk '{print $10}' /media/logicalvolume0/cswitches_node0
awk '{print $1}' /media/logicalvolume0/cswitches_node0
awk '{print $8}' /media/logicalvolume0/cswitches_node0
awk '{print $5}' /media/logicalvolume0/cswitches_node0
cat /media/logicalvolume0/cswitches_node0
awk '{print $15}' /media/logicalvolume0/cswitches_node0
awk '{print $16}' /media/logicalvolume0/cswitches_node0
awk '{print $10-$11-$12-$13-$14-$15-$16-$17-$18-$19-$20}' /media/logicalvolume0/cswitches_node0
sudo vim /media/logicalvolume0/cswitches_node0
awk '{print $1}' /media/logicalvolume0/cswitches_node0
awk '{sum+=$1; count++} END {print sum/count}' /media/logicalvolume0/cswitches_node0
awk '{print $1}' /media/logicalvolume0/cswitches_node0
sudo vim /media/logicalvolume0/cswitches_node0
awk '{sum+=$1; count++} END {print sum/count}' /media/logicalvolume0/cswitches_node0
sudo vim /media/logicalvolume0/node_cswitch_calc.sh 
sudo vim /media/logicalvolume0/cswitches_node1
sudo vim /media/logicalvolume0/cswitches_node2
awk '{sum+=$1; count++} END {print sum/count}' /media/logicalvolume0/cswitches_node0
awk '{sum+=$1; count++} END {print sum/count}' /media/logicalvolume0/cswitches_node1
awk '{sum+=$1; count++} END {print sum/count}' /media/logicalvolume0/cswitches_node2
sudo vim /media/logicalvolume0/cswitches_node1
awk '{print $1}' /media/logicalvolume0/cswitches_node1
awk '{sum+=$1; count++} END {print sum/count}' /media/logicalvolume0/cswitches_node1
awk '{sum+=$1; count++} END {print sum/count}' /media/logicalvolume0/cswitches_node0
sudo vim /media/logicalvolume0/headnode_cswitch_calc.sh
sudo chmod +x /media/logicalvolume0/headnode_cswitch_calc.sh 
sudo /media/logicalvolume0/headnode_cswitch_calc.sh 
sudo vim /media/logicalvolume0/headnode_cswitch_calc.sh
sudo vim /media/logicalvolume0/headnode_cswitch_calc.sh 
sudo /media/logicalvolume0/headnode_cswitch_calc.sh 
sudo vim /media/logicalvolume0/headnode_cswitch_calc.sh 
sudo /media/logicalvolume0/headnode_cswitch_calc.sh 
sudo vim /media/logicalvolume0/headnode_cswitch_calc.sh 
ls
cd client-configs/
ls
cd ..
sudo vim /cswitches_headnode
ls
cd /cswitches_headnode
cd cswitches_headnode
clear
ls
sudo vim cswitches_headnode 
sudo vim /media/logicalvolume0/no_cswitch_calc.sh
sudo vim /media/logicalvolume0/node_cswitch_calc.sh
cd /media
ls
cd logicalvolume0/
ls
sudo vim /media/logicalvolume0/node_cswitch_calc.sh
sudo vim /media/logicalvolume0/headnode_cswitch_calc.sh
/node_cswitch_calc.sh
sudo ./node_cswitch_calc.sh
sudo ./headnode_cswitch_calc.sh
sudo vim /media/logicalvolume0/headnode_cswitch_calc.sh
history
cd
sudo /media/logicalvolume0/headnode_cswitch_calc.sh 
sudo /media/logicalvolume0/node_cswitch_calc.sh 
sudo vim /media/logicalvolume0/headnode_cswitch_calc.sh 
sudo /media/logicalvolume0/headnode_cswitch_calc.sh 
sudo vim /media/logicalvolume0/headnode_cswitch_calc.sh 
ls
cd /media
ls
cd logicalvolume0/
ls
cat cswitches_all
sudo vim /media/logicalvolume0/headnode_cswitch_calc.sh 
sudo /media/logicalvolume0/headnode_cswitch_calc.sh 
sudo vim /media/logicalvolume0/headnode_cswitch_calc.sh 
sudo /media/logicalvolume0/headnode_cswitch_calc.sh 
sudo apt install bc
sudo /media/logicalvolume0/headnode_cswitch_calc.sh 
cat /media/logicalvolume0/headnode_cswitch_calc.sh 
clear
ls
cat cswitches_all
sudo vim /media/logicalvolume0/headnode_cswitch_calc.sh 
cd
sudo vim /etc/crontab
tail -1 /etc/crontab
sudo vim /etc/crontab
