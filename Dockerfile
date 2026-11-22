FROM alpine:3.20
RUN apk add --no-cache curl unzip ca-certificates
RUN curl -fsSL -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip /tmp/xray.zip -d /usr/local/bin xray \
    && chmod +x /usr/local/bin/xray \
    && rm /tmp/xray.zip
COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
