echo "############### SCRIPT D'INSTALLATION COMMUN AUX MACHINES DU CLUSTER ###############"

echo "################################# [1]: disable swap #################################"

sudo -s 
# swapoff -a to disable swapping
swapoff -a
# sed to comment the swap partition in /etc/fstab
sed -i '/ swap / s/^/#/' /etc/fstab

echo "############### [2]: apt update && apt install apt-transport-https curl ############### "
apt-get update && apt-get install -y apt-transport-https curl

echo "############### [3]: recup apt-key google ###############"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

echo "############### [4]: add kubernetes repositories to repo list ###############"
add-apt-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
apt-get update

echo "############### [5]: install kubelet, kubeadm, kubectl, kubernetes-cni ###############"
apt-get install -y kubelet kubeadm kubectl kubernetes-cni

echo "############### [6]: enable kubelet ###############"
systemctl enable kubelet

echo "############### [7]: début conf du réseau interne ###############"
sysctl net.bridge.bridge-nf-call-iptables=1
