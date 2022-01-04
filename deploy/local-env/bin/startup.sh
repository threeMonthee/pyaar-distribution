#!/bin/bash

if [ -d "/home/pyaar" ]; then
  #如果源码下载过, 则更新源码
  cd /home/pyaar
  git pull
else
  #否则下载源码
  git clone https://liuxingyu:liuxingyu@192.168.1.135:9443/r/yidui-overseas-server.git /home/pyaar/
  cd /home/pyaar
fi

#定义项目名称, 并且根据环境变量APP_NAME判断要运行的项目名
PROJECT_NAME=''
if [[ "${APP_NAME}" == "gateway" ]]; then
  PROJECT_NAME='pyaar-gateway'
elif [[ "${APP_NAME}" == "service-user" ]]; then
  PROJECT_NAME='pyaar-service:pyaar-service-user'
elif [[ "${APP_NAME}" == "service-payment" ]]; then
  PROJECT_NAME='pyaar-service:pyaar-service-payment'
elif [[ "${APP_NAME}" == "service-core" ]]; then
  PROJECT_NAME='pyaar-service:pyaar-service-core'
elif [[ "${APP_NAME}" == "service-console" ]]; then
  PROJECT_NAME='pyaar-service:pyaar-service-console'

elif [[ "${APP_NAME}" == "frontend-user" ]]; then
  PROJECT_NAME='pyaar-frontend:pyaar-frontend-user'
elif [[ "${APP_NAME}" == "frontend-payment" ]]; then
  PROJECT_NAME='pyaar-frontend:pyaar-frontend-payment'
elif [[ "${APP_NAME}" == "frontend-core" ]]; then
  PROJECT_NAME='pyaar-frontend:pyaar-frontend-core'

elif [[ "${APP_NAME}" == "console-admin" ]]; then
  PROJECT_NAME='pyaar-console:pyaar-console-admin'
elif [[ "${APP_NAME}" == "task" ]]; then
  PROJECT_NAME='pyaar-task'
fi

echo start run ${PROJECT_NAME}...

gradle clean


gradle ${PROJECT_NAME}:bootRun --args='--spring.profiles.active=dev,dev-apiclient'
gradle pyaar-service:pyaar-service-user:bootRun --args='--nacos.config.addr=192.168.1.20:8848 --nacos.config.namespace=pyaar-test --nacos.config.group=pyaar'



gradle pyaar-service:pyaar-service-user:bootRun --args='--nacos.config.addr=192.168.1.115:8848 --nacos.config.namespace=pyaar-test --nacos.config.group=pyaar --Xms256m --Xmx256m'