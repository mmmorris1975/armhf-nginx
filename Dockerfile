# A much thinner image than the "official" arm32v7 nginx image (alpine vs debian)
FROM arm32v6/alpine:3.6
MAINTAINER Mike Morris

RUN apk update && \
    apk add nginx && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    mkdir -m 0755 -p /run/nginx && chown root:nginx /run/nginx && \
    rm -rf /var/cache/apk/*

COPY ./nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
