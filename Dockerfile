FROM apache/spark:3.5.0

USER root

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget curl git build-essential cmake \
    && rm -rf /var/lib/apt/lists/*

# Download Gluten (Velox backend)
WORKDIR /opt

RUN wget https://archive.apache.org/dist/incubator/gluten/1.3.0-incubating/apache-gluten-1.3.0-incubating-bin-spark3.5.tgz && \
    tar -xzf apache-gluten-1.3.0-incubating-bin-spark3.5.tgz

# Copy jars
RUN cp -r /opt/apache-gluten-1.3.0-incubating-bin-spark3.5/jars/* /opt/spark/jars/

# Set environment
ENV SPARK_HOME=/opt/spark

USER spark