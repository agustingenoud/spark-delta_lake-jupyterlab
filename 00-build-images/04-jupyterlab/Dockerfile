FROM spark-base-delta

# -- Layer: JupyterLab

ARG spark_version=3.2.0
ARG jupyterlab_version=2.1.5

RUN apt-get update -y && \
    apt-get --no-install-recommends --no-install-suggests install -y python3 python3-pip python3-setuptools python3-distutils && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    pip3 install wget pyspark==${spark_version} jupyterlab==${jupyterlab_version} findspark pandas pyarrow py4j numpy scipy mlflow==1.23.0 seaborn delta-spark==1.1.0 && \
    apt-get autoremove -y && \
    rm -rvf /var/lib/apt/lists/*

RUN echo 'spark.sql.extensions io.delta.sql.DeltaSparkSessionExtension' >> "${SPARK_HOME}/conf/spark-defaults.conf" && \
    echo 'spark.sql.catalog.spark_catalog org.apache.spark.sql.delta.catalog.DeltaCatalog' >> "${SPARK_HOME}/conf/spark-defaults.conf"

# Trigger download of delta lake files
RUN echo "from pyspark.sql import SparkSession" > /tmp/init-delta.py && \
    echo "from delta import *" >> /tmp/init-delta.py && \
    echo "spark = configure_spark_with_delta_pip(SparkSession.builder).getOrCreate()" >> /tmp/init-delta.py && \
    python /tmp/init-delta.py && \
    rm /tmp/init-delta.py

# -- Runtime

EXPOSE 8888
WORKDIR ${SHARED_WORKSPACE}
CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=