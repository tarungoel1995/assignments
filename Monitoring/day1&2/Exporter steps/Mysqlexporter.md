mysqld_exporter

#sudo apt-get update
#sudo apt-get install mysql-server
#mysql_secure_installation
#mysqld –initialize
#systemctl status mysql.service
#mysqladmin -p -u root version
#wget https://github.com/prometheus/mysqld_exporter/releases/download/v0.11.0/mysqld_exporter-0.11.0.linux-amd64.tar.gz
#tar -xzvf mysqld_exporter-0.11.0.linux-amd64.tar.gz
#mv ~/Downloads/mysqld_exporter-0.11.0.linux-amd64 ~/mysqld_exporter/
#sudo vi /etc/systemd/system/mysqld_exporter.service
```
[Unit]
Description=Prometheus exporter for MySQL server metrics.

[Service]
Environment=DATA_SOURCE_NAME='root:12345@(localhost:3306)/'
User=vagrant
ExecStart=/home/vagrant/mysqld_exporter/mysqld_exporter-0.11.0.linux-amd64/mysqld_exporter
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
#sudo vim ~/.my.cnf
Add the following lines depending on your configuration

```
[client]
user=root
password=12345
```
#export DATA_SOURCE_NAME='root:12345@(localhost:3306)/'
#sudo systemctl daemon-reload
#sudo systemctl enable mysqld_exporter.service
#sudo systemctl start mysqld_exporter.service
#sudo systemctl status mysqld_exporter.service
It runs on 9104 port.

Go to prometheus node and edit prometheus.yml and add targets
- targets [ip addr:9104]