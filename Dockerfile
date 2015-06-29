# SoftEther VPN server
# 
# VERSION       0.1


FROM debian:8
MAINTAINER Jiri Altman <altman.jiri@gmail.com>

LABEL "description"="This image is based on cnf/docker-softether and is used to build SoftEther VPN which is compatible with vmware/photon. Problem with wrong timezone is solved - container is using host's setting."
LABEL "vendor"="Jiri Altman"
LABEL "version"="0.2"

# Version of SoftEther VPN package
ENV VERSION v4.17-9562-beta-2015.05.30

# Create new config hive as external volume for /etc and /var/log
# RUN mkdir -p /config/etc && mkdir -p /config/var/log

# Relocate the timezone file
RUN mv /etc/timezone /config/etc/ && ln -s /config/etc/timezone /etc/

WORKDIR /usr/local/vpnserver
RUN apt-get update &&\
        apt-get -y -q install gcc make wget && \
        apt-get clean && \
        rm -rf /var/cache/apt/* /var/lib/apt/lists/* && \
	wget http://www.softether-download.com/files/softether/${VERSION}-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-${VERSION}-linux-x64-64bit.tar.gz -O /tmp/softether-vpnserver.tar.gz &&\
        tar -xzvf /tmp/softether-vpnserver.tar.gz -C /usr/local/ &&\
        rm /tmp/softether-vpnserver.tar.gz &&\
        make i_read_and_agree_the_license_agreement &&\
        apt-get purge -y -q --auto-remove gcc make wget

# Relocate SoftEther VPN log files
RUN mkdir -p /config/var/log/vpnserver && ln -s /config/var/log/vpnserver /var/log/

ADD runner.sh /usr/local/vpnserver/runner.sh
RUN chmod 755 /usr/local/vpnserver/runner.sh

EXPOSE 443/tcp 992/tcp 1194/tcp 1194/udp 5555/tcp 500/udp 4500/udp

ENTRYPOINT ["/usr/local/vpnserver/runner.sh"]
