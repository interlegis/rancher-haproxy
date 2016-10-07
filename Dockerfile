FROM rawmind/rancher-tools:0.3.4-5
MAINTAINER Fabio Rauber <fabiorauber@gmail.com>

#Set environment
ENV SERVICE_NAME=haproxy \
    SERVICE_USER=haproxy \
    SERVICE_UID=10007 \
    SERVICE_GROUP=haproxy \
    SERVICE_GID=10007 \
    SERVICE_ARCHIVE=/opt/haproxy-rancher-tools.tgz 

# Add files
ADD root /
RUN cd ${SERVICE_VOLUME} && \
    tar czvf ${SERVICE_ARCHIVE} * ; rm -rf ${SERVICE_VOLUME}/* 
