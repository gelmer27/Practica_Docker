#/bin/bash
docker network create Red_2

docker create --name 2.Datacontainer -v /var/lib/mysql -v /var/www/html busybox

docker run --network Red_2 --name=mariadb -p 3308:3308 -d -e MYSQL_ROOT_PASSWORD=mariadb -e MYSQL_USER1=gelmer -e MYSQL_PASSWORD1=mariadb --volumes-from 2.Datacontainer orboan/dcsss-mariadb


docker run --network Red_2 --name=2.apache -p 8083:80 -p 2222:22 -d --volumes-from 2.Datacontainer --dns 8.8.8.8 gelmer27/centos-httpd-php
