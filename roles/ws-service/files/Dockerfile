FROM alpine
MAINTAINER Tomas Slusny <slusnucky@gmail.com>

# Required for go binary
RUN apk add --no-cache libc6-compat

ARG BIN_FILE
ADD ${BIN_FILE} app
RUN chmod +x app

ENTRYPOINT /app --redisaddr "$REDIS_HOST"
