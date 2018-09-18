#!/bin/bash

v=$(mysql -h$MYSQL_HOST -u$MYSQL_USERNAME -p$MYSQL_PASSWORD -e "show databases" | grep airflow | wc -l)
if [ $v -eq 0 ]; then
    mysql -h$MYSQL_HOST -u$MYSQL_USERNAME -p$MYSQL_PASSWORD -e "create schema airflow"
    airflow initdb
fi

nohup airflow schedule &
airflow webserver -p 8080