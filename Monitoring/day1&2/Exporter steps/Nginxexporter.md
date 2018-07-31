nginx_exporter


On the machine which contain docker
#docker pull fish/nginx-exporter
#docker run -itd --name nginx fish/nginx-exporter
#docker ps
#docker cp nginx:/usr/local/bin/nginx_exporter .
#./nginx_exporter -h (to see whcih environment variable to pass)
#established ssh connection to the exporter node
#scp nginx_exporter vagrant@ipaddress:/home/vagrant/nginx_exporter/
on the exporter node
#sudo vim /etc/systemd/system/nginx_exporter.service
```
[Unit]
Description=Prometheus exporter for nginx server metrics.

[Service]
Environment=nginx.scrape_uri=http://localhost/nginx_status
User=vagrant
ExecStart=/home/vagrant/nginx_exporter/nginx_exporter
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
#sudo systemctl daemon-reload
#sudo systemctl enable nginx_exporter.service
#sudo systemctl start nginx_exporter.service
#sudo systemctl status nginx_exporter.service
service runs on 9113 port

#netstat -tunlp (verification)

On prometheus node
#vim prometheus.yml
#add targets
#- targets: [ipaddress:9113]
#save and exit
#./prometheus
