FROM docker.io/ubuntu:20.04

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        s3cmd \
        mysql-client \
        subversion \
        curl \
        ca-certificates \
        gnupg2 \
        lsb-release \
 && curl -L https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
 && echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends postgresql-client-12 postgresql-client-13 \
 && apt-get --purge -y autoremove \
 && apt-get clean && apt-get autoclean \
 && rm -rf /var/lib/apt/lists

ENV PG_VERSION=12
