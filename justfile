#!/usr/bin/env just --justfile

docker-build:
    docker build -t spark-simple:0.0.1 .

colima-kube-reset:
    colima kube reset;
    kubectl create serviceaccount spark;
    kubectl create clusterrolebinding spark-role --clusterrole edit --serviceaccount default:spark ;

submit:
    ./spark_simple_submit.sh
