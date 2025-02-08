sudo apt update -y
sudo apt install ruby -y
sudo apt install wget -y
cd /home/ubuntu

wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto

sudo service codedeploy-agent start
sudo service codedeploy-agent status

---
apt update
apt install default-jdk -y
apt upgrade
java --version
useradd -m -d /opt/tomcat -U -s /bin/false tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.2/bin/apache-tomcat-11.0.2.tar.gz -O /tmp/tomcat-11.tar.gz
sudo -u tomcat tar -xzvf /tmp/tomcat-11.tar.gz --strip-components=1 -C /opt/tomcat
nano /etc/systemd/system/tomcat.service

[Unit]
Description=Apache Tomcat
After=network.target

[Service]
Type=forking

User=tomcat
Group=tomcat

Environment=JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
Environment=CATALINA_PID=/opt/tomcat/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

ExecReload=/bin/kill $MAINPID
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target   --- > Paste till here 



systemctl daemon-reload
systemctl enable --now tomcat
systemctl status tomcat
