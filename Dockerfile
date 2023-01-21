FROM alpine:edge

ARG AUUID="b4672aed-8f07-4710-96d4-b857c7ac0d0d"
ARG CADDYIndexPage="https://github.com/happyevero/Html/raw/main/GoidFood-html.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8000

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
