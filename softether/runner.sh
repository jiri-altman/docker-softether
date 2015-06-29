#!/bin/sh

if [ ! -d "/config/etc" ]; then
  mkdir -p /config/etc 
fi

if [ ! -d "/config/var/log" ]; then
  mkdir -p /config/var/log
fi

if [ ! -d "/config/etc/vpnserver" ]; then
  mkdir -p /config/etc/vpnserver
fi

#if [ ! -f "/config/etc/timezone" ]; then
#mv /etc/timezone /config/etc/ && ln /config/etc/timezone /etc/
#fi

#mkdir -p /config/var/log/vpnserver && ln -s /config/var/log/vpnserver /var/log/

# Temporary solution
#echo 'Eurpope/Prague' | tee /config/etc/timezone

ln -sf /config/etc/localtime /etc/localtime

# Set timezone as specified in /config/etc/timezone
#dpkg-reconfigure -f noninteractive tzdata

if [ ! -d "/config/var/log/vpnserver/security_log" ]; then
  mkdir -p /config/var/log/vpnserver/security_log
fi

if [ ! -d "/config/var/log/vpnserver/packet_log" ]; then
  mkdir -p /config/var/log/vpnserver/packet_log
fi

if [ ! -d "/config/var/log/vpnserver/server_log" ]; then
  mkdir -p /config/var/log/vpnserver/server_log
fi

if [ ! -d "/var/log/vpnserver" ]; then
  mkdir -p /var/log/vpnserver
fi

if [ ! -f "/config/etc/vpnserver/vpn_server.config" ]; then
  touch /config/etc/vpnserver/vpn_server.config
fi

ln -sf /config/etc/vpnserver/vpn_server.config /usr/local/vpnserver/
ln -sf /config/var/log/vpnserver/*_log /usr/local/vpnserver/
ln -sf /config/var/log/vpnserver/*_log /var/log/vpnserver/

exec /usr/local/vpnserver/vpnserver execsvc

exit $?
