FROM alpine:3.9.5

RUN apk add --no-cache python py-pip py-setuptools ca-certificates libmagic curl
RUN pip install python-dateutil python-magic

RUN S3CMD_CURRENT_VERSION=2.0.2 \
    && mkdir -p /opt \
    && wget https://github.com/s3tools/s3cmd/releases/download/v${S3CMD_CURRENT_VERSION}/s3cmd-${S3CMD_CURRENT_VERSION}.zip \
    && unzip s3cmd-${S3CMD_CURRENT_VERSION}.zip -d /opt/ \
    && ln -s $(find /opt/ -name s3cmd) /usr/bin/s3cmd \
    && ls /usr/bin/s3cmd

WORKDIR /app
