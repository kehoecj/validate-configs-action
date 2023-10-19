FROM alpine:3.18
COPY entrypoint.sh /entrypoint.sh
RUN apk --no-cache add curl && \
  curl https://github.com/Boeing/config-file-validator/releases/download/v1.4.0/validator-1.4.0-linux-amd64 \
  -o /usr/local/bin/validator -s -L && \
  chmod 0755 /usr/local/bin/validator && \
  chmod 0755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]