pwd
ls
cd ..
ls
cd ..
ls
cd amazon-ssm-agent/
ls
cd ~
pwd
cd .git
pwd
mkdir -p ~/.ssh && chmod 700 ~/.ssh
pwd
cd .ssh
ls
cat id_rsa
ls
cat id_rsa.pub 
cd ~
ls
sudo apt update && sudo apt install -y ansible
ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa
ls
cd .ssh/
ls
cat id_rsa
mkdir ~/devops-project && cd ~/devops-project
nano inventory.ini
ansible all -i inventory.ini -m ping
cd ..
ls
cd ..
ls
cd sam-user
cd ssm-user/
ls
cd .ssh
ls
cat id_rsa-pub
ls
cat id_rsa
ls
cat id_rsa.pub
ansible all -i inventory.ini -m ping
sudo -i
ls
cat known_hosts 
ls
cat id_rsa.pub 
ansible all -i inventory.ini -m ping
ls
cd ..
ls
cd devops-project/
ls
ansible all -i inventory.ini -m ping
whoami
ansible all -i inventory.ini -m ping
nano install_docker.yml
ansible-playbook -i inventory.ini install_docker.yml
ansible web -i inventory.ini -m shell -a "docker --version"
whoami
cd ~
ls
cd devops-project/
ls
nano ~/devops-project/deploy_app.yml
ls
ansible-playbook -i inventory.ini deploy_app.yml
nano ~/devops-project/install_docker.yml
ansible-playbook -i inventory.ini install_docker.yml
nano ~/devops-project/install_docker.yml
ansible-playbook -i inventory.ini install_docker.yml
nano ~/devops-project/install_docker.yml
ansible-playbook -i inventory.ini install_docker.yml
nano ~/devops-project/install_docker.yml
ansible-playbook -i inventory.ini install_docker.yml
nano ~/devops-project/install_docker.yml
ansible-playbook -i inventory.ini install_docker.yml
nano ~/devops-project/install_docker.yml
ansible-playbook -i inventory.ini install_docker.yml
ansible web -i inventory.ini -m shell -a "/snap/bin/aws --version"
nano ~/devops-project/deploy_app.yml
ansible-playbook -i inventory.ini deploy_app.yml
nano ~/devops-project/deploy_app.yml
ansible-playbook -i inventory.ini deploy_app.yml --syntax-check
ansible web -i inventory.ini -m shell -a "/snap/bin/aws sts get-caller-identity"
ansible web -i inventory.ini -m ping
ls
cat install_docker.yml 
nano install_docker.yml 
ansible web -i inventory.ini -m shell -a "sudo docker images"
ls
nano install_monitoring.yml
ansible-playbook -i inventory.ini install_monitoring.yml
ls
nano install_grafana.yml
ansible-playbook -i inventory.ini install_grafana.yml
ansible-playbook install_grafana.yml -c local
sudo apt-get update
sudo apt-get install -y apt-transport-https software-properties-common wget
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
sudo apt-get update
sudo apt-get install -y grafana
sudo systemctl start grafana-server
sudo systemctl enable grafana-server
sudo systemctl status grafana-server
sudo systemctl start grafana-server
sudo systemctl status grafana-server
cd ~
ls
cd devops-project/
ls
cat install_grafana.yml 
cat install_monitoring.yml 
ls
cat inventory.ini 
cat install_monitoring.yml 
ls
cat install_grafana.yml 
nano install_grafana.yml 
sudo systemctl stop grafana-server
sudo systemctl disable grafana-server
sudo apt-get remove --purge -y grafana
sudo rm /etc/apt/sources.list.d/grafana.list
sudo rm /etc/apt/keyrings/grafana.gpg
sudo apt-get update
nano ls
ls
nano install_exporter.yml
cd ~
ls
cd devops-project/
ls
cat install_exporter.yml 
ansible-playbook -i inventory.ini install_exporter.yml
ansible-playbook -i inventory.ini install_grafana.yml
ansible-playbook -i inventory.ini install_monitoring.yml
git status
pwd
history | grep ansible-playbook
cat install_exporter.yml 
ansible-playbook -i inventory.ini install_exporter.yml
cat ~/devops-project/inventory.ini
curl http://10.0.0.5:9100/metrics
ansible web -i inventory.ini -m shell -a "systemctl status prometheus-node-exporter"
curl http://10.0.0.5:9100/metrics
ansible web -i inventory.ini -m shell -a "sudo ufw allow 9100/tcp"
curl http://10.0.0.5:9100/metrics
nc -zv 10.0.0.5 9100
ls
nano install_prometheus.yml
ansible-playbook -i inventory.ini install_prometheus.yml
ls -l /etc/prometheus/prometheus.yml
ls
cat install_monitoring.yml 
nano install_monitoring.yml 
ansible-playbook -i inventory.ini install_monitoring.yml
cd ~
pwd
ls
cd devops-project/
ls
cat install_monitoring.yml 
ls
nano setup_monitoring_server.yml
ansible-playbook -i inventory.ini setup_monitoring_server.yml
ansible monitoring -i inventory.ini -m shell -a "wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && sudo dpkg -i cloudflared-linux-amd64.deb && sudo apt install -y prometheus grafana"
