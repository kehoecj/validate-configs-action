FROM alpine:3.20@sha256:beefdbd8a1da6d2915566fde36db9db0b524eb737fc57cd1367effd16dc0d06d
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
