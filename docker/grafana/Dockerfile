ARG VERSION=5.1.3
FROM centos
ARG VERSION
RUN yum install wget -y
WORKDIR /home
RUN wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-${VERSION}-1.x86_64.rpm && \
    yum install initscripts fontconfig -y && \
    yum install grafana-${VERSION}-1.x86_64.rpm -y && \
    /sbin/chkconfig --add grafana-server
ADD startup.sh /startup.sh

#CMD sh /startup.sh

