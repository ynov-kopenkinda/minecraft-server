#!/bin/bash

if [ -z "$1" ]; then
  mkdir -p /minecraft/plugins/AuthMe/
  cat /default-authme-config.yml | \
  sed "s/__SET_MYSQL_HOST/$DB_HOST/" | \
  sed "s/__SET_MYSQL_PORT/$DB_PORT/" | \
  sed "s/__SET_MYSQL_DATABASE/$DB_NAME/" | \
  sed "s/__SET_MYSQL_USERNAME/$DB_USER/" | \
  sed "s/__SET_MYSQL_PASSWORD/$DB_PASS/" > /minecraft/plugins/AuthMe/config.yml
fi

java -Xmx4096M -Xms1024M -jar spigot.jar nogui