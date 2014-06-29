#!/bin/bash

mkdir group_vars roles
mkdir roles/common roles/mysql roles/php roles/zabbix-server

# group_vars
touch group_vars/all

# common
cd roles
mkdir -p common/files common/tasks
cp ../../zabbix-server-files/epel/RPM-GPG-KEY-EPEL-6 common/files/
cp ../../zabbix-server-files/epel/epel.repo common/files/

# mysql
mkdir -p mysql/tasks mysql/meta mysql/handlers mysql/templetes

# php
mkdir -p php/handlers php/tasks php/templetes
cp ../../zabbix-server-files/php.ini php/templetes/

# zabbix-server
mkdir -p zabbix-server/handlers zabbix-server/tasks zabbix-server/templetes zabbix-server/meta
cp ../../zabbix-server-files/zabbix_server.conf zabbix-server/templetes/

for dir in common/tasks mysql/meta mysql/tasks mysql/handlers php/handlers php/tasks zabbix-server/handlers zabbix-server/tasks zabbix-server/meta
do
    touch ${dir}/main.yml
done


