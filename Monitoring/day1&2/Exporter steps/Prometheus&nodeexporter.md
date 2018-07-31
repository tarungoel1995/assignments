Prometheus and node_exporter

#Follow the link

https://medium.com/@abhishekbhardwaj510/prometheus-overview-and-setup-dc0ee20791fb

#install node_exporter on one machine
#install prometheus on other machine
#prometheus service

```
[Unit]
Description=Prometheus Server.

[Service]

User=vagrant
ExecStart=/home/vagrant/Prometheus/prometheus-2.0.0.linux-amd64/prometheus \
    --config.file /home/vagrant/Prometheus/prometheus-2.0.0.linux-amd64/prometheus.yml \
    --storage.tsdb.path /home/vagrant/Prometheus/prometheus-2.0.0.linux-amd64/data/ \
    --web.console.templates=/home/vagrant/Prometheus/prometheus-2.0.0.linux-amd64/prometheus/consoles \
    --web.console.libraries=/home/vagrant/Prometheus/prometheus-2.0.0.linux-amd64/prometheus/console_libraries
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
#prometheus runs on 9090 port
