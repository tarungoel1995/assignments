Collectd Service 

#sudo apt-get install collectd
#sudo apt-get install nginx
#sudo service --status-all | egrep "collectd|nginx" (to verify)
#cd /usr/share/doc/collectd/examples/
#sudo cp -r ./collection3 /var/www/html
#sudo apt-get install librrds-perl libconfig-general-perl libhtml-parser-perl  libregexp-common-perl
#sudo apt-get install fast-cgi
#sudo apt-get install spawn-fcgi fcgiwrap
#vim /etc/nginx/sites-enabled/default
under the server section add the following section
```
location /nginx_status {
    stub_status on;
    access_log off;
    allow all;
#    allow 127.0.0.1;
#    allow 192.168.0.20;
#    deny all;
}
        location ~ .cgi$ {
                        root /var/www/html/;
                        fastcgi_pass unix:/var/run/fcgiwrap.socket;
                        include /etc/nginx/fastcgi_params;
                }

                location /collection3/share/ {
                        alias /var/www/html/collection3/share/;
                }
```
#sudo systemctl daemon-reload
#sudo systemctl restart nginx
#sudo systemctl enable nginx
#sudo systemctl restart collectd.service
#sudo systemctl enable collectd.service

#to verify go to your browser and hit (http://ipaddr:80/nginx_status)
#you should see output something like below

```
Active connections: 3 
server accepts handled requests
 3 3 5 
Reading: 0 Writing: 1 Waiting: 2 
```



Collectd Exporter


#cd ~/Downloads
#wget https://github.com/prometheus/collectd_exporter/releases/download/v0.4.0/collectd_exporter-0.4.0.linux-amd64.tar.gz

#tar -xzvf collectd_exporter-0.4.0.linux-amd64.tar.gz
#cp -r collectd_exporter-0.4.0.linux-amd64 ~/collectd_exporter
#sudo vim /etc/systemd/system/collectd_exporter.service

```
[Unit]
Description=Collectd Exporter

[Service]
User=vagrant
ExecStart=/home/vagrant/collectd_exporter/collectd_exporter
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
#sudo systemctl daemon-reload
#sudo systemctl start collectd_exporter.service
#sudo systemctl enable collectd_exporter.service
#sudo systemctl status collectd_exporter.service





Ports of Different Exporters

```
Prometheus ['9090']

Alert Manager [‘9093’]

Node Exporter ['9100']

Nginx exporter ['9113']

Mysql Exporter ['9104']

Jenkins Exporter ['9118']
 
Collectd Exporter ['9103']
```