#!/usr/bin/bash

grab_contenaire=`sudo docker images | awk {'print $1'} | grep -v REPOSITORY | head -n 1`

sudo docker run -d --name $grab_contenaire -P -e APACHE_SERVERNAME=$grab_contenaire -d $grab_contenaire /usr/sbin/httpd -D FOREGROUND

grab_port=$(for i in `sudo docker ps -a | awk {'print $1'} | grep -v CONTAINER` ; do sudo docker port $i | awk -F: {'print $2'};done)

echo "App running on http://$grab_contenaire.ssense.com:$grab_port"

