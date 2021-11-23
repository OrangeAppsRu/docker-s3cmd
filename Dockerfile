FROM docker.io/ubuntu:20.04

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        s3cmd \
        postgresql-client \
        mysql-client \
        curl \
        ca-certificates \
 && apt-get --purge -y autoremove \
 && apt-get clean && apt-get autoclean \
 && rm -rf /var/lib/apt/lists
