sudo firewall-cmd --get-active-zones
sudo firewall-cmd --zone=public --add-port=10250/tcp --permanent
sudo firewall-cmd --zone=public --add-port=10256/tcp --permanent
sudo firewall-cmd --zone=public --add-port=30000-32767/tcp --permanent
sudo firewall-cmd --zone=public --add-port=30000-32767/udp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --zone=public --list-ports