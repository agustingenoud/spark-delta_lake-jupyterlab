#!/bin/bash

# -- Software Stack Version

SPARK_VERSION="3.2.0"
HADOOP_VERSION="3.2"
JUPYTERLAB_VERSION="2.1.5"

# -- Building the Images

docker build \
  -f ./00-cluster-base/Dockerfile \
  -t cluster-base-t .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg hadoop_version="${HADOOP_VERSION}" \
  -f ./01-spark-base/Dockerfile \
  -t spark-base-t .

docker build \
  -f ./02-spark-master/Dockerfile \
  -t spark-master-t .

docker build \
  -f ./03-spark-worker/Dockerfile \
  -t spark-worker-t .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg jupyterlab_version="${JUPYTERLAB_VERSION}" \
  -f ./04-jupyterlab/Dockerfile \
  -t jupyterlab-t .
