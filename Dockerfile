FROM alpine:3.21@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c
COPY entrypoint.sh /entrypoint.sh
ENV CFV_VERSION=v1.7.1
RUN apk --no-cache add curl tar && \
  curl https://github.com/Boeing/config-file-validator/releases/download/${CFV_VERSION}/validator-${CFV_VERSION}-linux-386.tar.gz \
  -o /tmp/validator-${CFV_VERSION}-linux-386.tar.gz  -s -L && \
  tar -xvf /tmp/validator-${CFV_VERSION}-linux-386.tar.gz -C /tmp && \
  mv /tmp/validator /usr/local/bin && \
  rm -rf /tmp/* && \
  chmod 0755 /usr/local/bin/validator && \
  chmod 0755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
