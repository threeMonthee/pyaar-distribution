#构建镜像
docker build --tag pyaar-dev -f pyaar-dev.Dockerfile .

#service-user
docker run -d \
-m 1024m \
-e APP_NAME=service-user \
--name  service-user \
pyaar-dev

#service-payment
docker run -d \
-m 1024m \
-e APP_NAME=service-payment \
--name  service-payment \
pyaar-dev

#service-core
docker run -d \
-m 1024m \
-e APP_NAME=service-core \
--name  service-core \
pyaar-dev

#admin-console
docker run -d \
-m 1024m \
-e APP_NAME=service-console \
--name  service-console \
pyaar-dev

#frontend-user
docker run -d \
-m 1024m \
-e APP_NAME=frontend-user \
--name  frontend-user \
pyaar-dev

#frontend-payment
docker run -d \
-m 1024m \
-e APP_NAME=frontend-payment \
--name  frontend-payment \
pyaar-dev

#frontend-core
docker run -d \
-m 1024m \
-e APP_NAME=frontend-core \
--name  frontend-core \
pyaar-dev

#console-admin
docker run -d \
-p 8082:8082 \
-m 1024m \
-e APP_NAME=console-admin \
--name  console-admin \
pyaar-dev

#task
docker run -d \
-m 1024m \
-e APP_NAME=task \
--name  task \
pyaar-dev

#gateway
docker run -d \
-p 8080:8080 \
-m 1024m \
-e APP_NAME=gateway \
--name  gateway \
pyaar-dev
