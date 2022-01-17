# Data Science Docker Environment

Build from scratch docker images from the Dockerfiles.
Create a Spark cluster (1 Main + 2 Workers) and a Jupyter Lab interface.
Based on the great [article](https://towardsdatascience.com/apache-spark-cluster-on-docker-ft-a-juyterlab-interface-418383c95445) of André Perez. I updated the versions of openjdk to 11, spark (3.2.0) & hadoop compatibility.

### Go to a terminal

Enter directory

    cd 00-build-images

Make file executable

    chmod +x build-images.sh

Run image builder

    ./build-images.sh
