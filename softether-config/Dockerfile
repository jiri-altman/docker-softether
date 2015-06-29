# SoftEther VPN server - Configuration Container
#
# VERSION   0.1

FROM busybox:latest
MAINTAINER Jiri Altman <altman.jiri@gmail.com>

LABEL "description"="This container holds /config volume which contains configuration files, log files, etc.."
LABEL "vendor"="Jiri Altman"
LABEL "version"="0.1"

# Create new config hive as external volume
RUN mkdir -p /config

WORKDIR /config

# Create /etc, /etc/vpnconfig and /var/log
#RUN mkdir -p etc && mkdir -p var/log && mkdir -p etc/vpnconfig

# Prepare vpn_server.config file
#RUN touch etc/vpnconfig/vpn_server.config

# Mount volume /config
VOLUME /config

ENTRYPOINT ["/bin/true"]
