#!/bin/bash

echo -n  "Please enter your new external ip address: "
read new_ext_ip
echo
sed -i "s/^  ServerAlias [2-9].*/  ServerAlias $new_ext_ip/g" /etc/httpd/conf.d/15-horizon_vhost.conf
echo "Please wait while httpd restarts"
systemctl restart httpd
echo
grep ServerAlias /etc/httpd/conf.d/15-horizon_vhost.conf
echo
echo "External ip changed successfully"
