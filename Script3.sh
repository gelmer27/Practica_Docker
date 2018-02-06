#/bin/bash
docker network create Red_eje3

docker create --name 3.Datacontainer -v /var/lib/mysql -v /usr/share/nginx/html busybox

docker run --network Red_eje3 --name=3.mariadb -p 3308:3308 -d -e MYSQL_ROOT_PASSWORD=mariadb -e MYSQL_USER1=gelmer -e MYSQL_PASSWORD1=mariadb --volumes-from 3.Datacontainer orboan/dcsss-mariadb


docker run --network Red_eje3 --name=3.NGINX -p 8083:80 -p 2222:22 -d --volumes-from 3.Datacontainer --dns 8.8.8.8 million12/nginx-php
