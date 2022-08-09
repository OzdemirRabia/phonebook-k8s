#!/bin/bash

cd web_server/image_for_web_server/
docker build -t jupiterisland/webserver:v1 .
docker push jupiterisland/webserver:v1
cd ../../result_server/image_for_result_server/
docker build -t jupiterisland/resultserver:v1 .
docker push jupiterisland/resultserver:v1
cd ../../mysql_deployment/
kubectl apply -f .
cd ../web_server/
kubectl apply -f .
cd ../result_server/
kubectl apply -f .
cd ../secrets_configmap/
kubectl apply -f .