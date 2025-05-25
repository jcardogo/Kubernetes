sudo apt update
sudo apt upgrade -y
java -version
sudo apt install postgresql postgresql-contrib -y
sudo -i -u postgres
##create user sonarqube with password 'sonarqube_password';
##create database sonarqube owner sonarqube;
##grant all privileges on database sonarqube to sonarqube;
##exit
sudo mkdir /opt/sonarqube
cd /opt/sonarqube
sudo chown 1000:1000 /opt/sonarqube
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.0.65466.zip
sudo unzip sonarqube-9.9.0.65466.zip
sudo mv sonarqube-9.9.0.65466/* /opt/sonarqube
sudo chown -R sonarqube:sonarqube /opt/sonarqube
sudo chmod -R 755 /opt/sonarqube
sudo cp /opt/sonarqube/conf/sonar.properties /opt/sonarqube/conf/sonar.properties.bak
sudo nano /opt/sonarqube/conf/sonar.properties #update the following lines
#----- PostgreSQL
#sonar.jdbc.url=jdbc:postgresql://localhost/sonarqube
#sonar.jdbc.username=sonarqube
#sonar.jdbc.password=sonarqube_password # Replace with your actual password 
sudo nano /opt/sonarqube/sonarqube-9.9/conf/wrapper.conf #edit the wrapper.conf file to ensure the java path is correct
#wrapper.java.command=/usr/lib/jvm/java-11-openjdk-amd64/bin/java # Adjust path if different
update-alternatives --query java #check the java path
## SonarQube requires increase system limits (important for performance and stability)
sudo nano /etc/sysctl.conf #add the following lines
#vm.max_map_count=262144
#fs.file-max=65536
sudo sysctl -p #apply the changes
sudo nano /etc/security/limits.conf #add the following lines
#sonarqube   -   nofile   65536
#sonarqube   -   nproc    4096
sudo adduser --system --no-create-home --group sonarqube #create a dedicated user for SonarQube
sudo chown -R sonarqube:sonarqube /opt/sonarqube
sudo nano /etc/systemd/system/sonarqube.service #create a systemd service file
# [Unit]
#Description=SonarQube service
#After=syslog.target network.target
#
#[Service]
#Type=forking
#ExecStart=/opt/sonarqube/sonarqube-9.9/bin/linux-x86-64/sonar.sh start
#ExecStop=/opt/sonarqube/sonarqube-9.9/bin/linux-x86-64/sonar.sh stop
#User=sonarqube
#Group=sonarqube
#Restart=always
#imitNOFILE=65536
#LimitNPROC=4096
#
#[Install]
#WantedBy=multi-user.target
sudo systemctl daemon-reload
sudo systemctl enable sonarqube
sudo systemctl start sonarqube
sudo systemctl status sonarqube
#adjunt the firewall rules
sudo ufw allow 9000/tcp
sudo ufw reload

#open the browser and access SonarQube
#http://<your_server_ip>:9000
#username: admin
#password: admin
#change the default password
#sudo -u sonarqube /opt/sonarqube/bin/linux-x86-64/sonar.sh restart