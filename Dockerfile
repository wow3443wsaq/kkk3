FROM alpine:edge

ARG AUUID="f9f6bae3-c2f6-484e-abd8-ef1cfa550649"
ARG CADDYIndexPage="https://codeload.github.com/PavelDoGreat/WebGL-Fluid-Simulation/zip/refs/heads/master"
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
