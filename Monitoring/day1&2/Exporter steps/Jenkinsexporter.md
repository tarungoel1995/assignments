Jenkins Exporter


- cd Downloads/
- wget https://github.com/lovoo/jenkins_exporter/archive/1.1.0.tar.gz
- tar -xzvf 1.1.0.tar.gz
- cp jenkins_exporter-1.1.0 ~/jenkins_exporter
- cd ~/jenkins_exporter
- sudo apt-get install python-pip
- pip install -r requirements.txt
service 
- sudo vim /etc/systemd/system/jenkins_exporter.service
```
[Unit]
Description=Jenkins_Exporter

[Service]
Environment=jenkins='http://localhost:8080/'
User=vagrant
ExecStart=/home/vagrant/jenkins_exporter/jenkins_exporter.py -j $jenkins
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
- sudo systemctl daemon-reload
- sudo systemctl enable jenkins_exporter.service
- sudo systemctl start jenkins_exporter.service
- sudo systemctl status jenkins_exporter.service

without service

- python jenkins_exporter.py --jenkins http://localhost:8080