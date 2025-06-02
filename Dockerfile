FROM alpine:3.22@sha256:8a1f59ffb675680d47db6337b49d22281a139e9d709335b492be023728e11715
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
