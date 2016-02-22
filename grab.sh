#!/bin/sh

grab_contenaire=`sudo docker images | awk {'print $1'} | grep -v REPOSITORY | head -n 1`
grab_port=$(for i in `docker ps -a | awk {'print $1'} | grep -v CONTAINER` ; do docker port $i | awk -F: {'print $2'};done)

sudo docker run -d --name $grab_contenaire -P -e APACHE_SERVERNAME=$grab_contenaire -d $grab_contenaire /usr/sbin/httpd -D FOREGROUND

echo "App running on http://$grab_contenaire.ssense.com:$grab_port"
