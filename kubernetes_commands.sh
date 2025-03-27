sudo apt install python3
sudo apt install python3-pip
sudo apt install python3.12-venv
cd /home/$(whoami)/projects/kubernetes
git clone https://github.com/kubernetes-sigs/kubespray.git
python3 -m venv kubespray-venv

#Copy ssh public key to each remote server
ssh-copy-id acardogo@192.168.2.45 
ssh-copy-id acardogo@192.168.2.46
ssh-copy-id acardogo@192.168.2.47
ssh-copy-id acardogo@192.168.2.48

source kubespray-venv/bin/activate
cd kubespray
pip install -U -r requirements.txt

nano ../clusters/homelab-k8s/hosts.yaml
nano ../clusters/homelab-k8s/cluster-config.yaml
ansible-playbook -i ../clusters/homelab-k8s/hosts.yaml -e @../clusters/homelab-k8s/cluster-config.yaml --user=acardogo --become --become-user=root cluster.yml