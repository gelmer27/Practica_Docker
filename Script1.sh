#/bin/bash
docker network create 5.Red

docker create --name 5.Datacontainer -v /Base_de_datos:/var/www/html -v /Base_de_datos:/usr/share/nginx/html busybox

docker run -itd -p 8027:80 --network 5.Red --volumes-from 5.Datacontainer --name 5.NGINX nginx

docker run -itd -p 8028:80 --network 5.Red --volumes-from 5.Datacontainer --name 5.APACHE2 gelmer27/centos-httpd-php
