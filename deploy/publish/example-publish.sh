#!/bin/sh

docker_host="pyaar-repository-registry.ap-southeast-1.cr.aliyuncs.com"

image_name='pyaar-service-user'

tag="1.2.0-"`date '+20%y%m%d_%H%M%S'`

gradle clean

gradle build -x test --build-cache

echo '\n Building' $image_name:$tag'...\n'

docker build -t $image_name:$tag . --build-arg jar-path=$1

read -p 'Continue to publish to Aliyun ? Y/N: ' push

if [ "$push" != 'Y' ]
then exit
fi

target_image=$docker_host/pyaar/$image_name

echo '\nRename' $image_name:$tag 'to' $target_image:$tag'\n'

docker tag $image_name:$tag $target_image:$tag

echo 'Publishing to Aliyun Repository...\n'

docker push $target_image:$tag

echo '\n Finished'


