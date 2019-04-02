FROM nginx:1-alpine
LABEL maintainer="EEA: IDM2 A-Team <eea-edw-a-team-alerts@googlegroups.com>"

ARG RIOT_WEB_VERSION="1.0.6"

COPY default.conf /etc/nginx/conf.d/default.conf

RUN set -ex \
    && apk update \
    && apk add --no-cache \
        curl \
        git \
        libevent \
        libffi \
        libjpeg-turbo \
        nodejs \
        sqlite-libs \
        ca-certificates \
        openssl \
        bash \
        unzip \
        npm \
        yarn \
    && npm install -g webpack \
    && curl -L https://github.com/vector-im/riot-web/archive/v${RIOT_WEB_VERSION}.zip -o v.zip \
    && unzip v.zip \
    && rm v.zip \
    && mv riot-web-* /tmp/riot \
    && cd /tmp/riot \
    && npm install \
    && rm -rf /tmp/riot/node_modules/phantomjs-prebuilt/phantomjs

COPY html /tmp/html/

RUN cd /tmp/riot \
    && mv /tmp/html/welcome.html res/welcome.html \
    && mv /tmp/html/img/eea_logo.svg res/welcome/images/eea_logo.svg \
    && npm run build  \
    && mkdir -p /var/www \
    && mv /tmp/riot/webapp /var/www/riot \
    && echo "$RIOT_WEB_VERSION" > /var/www/riot/version \
    && update-ca-certificates \
    && apk del ca-certificates openssl git unzip
 

COPY docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 80
STOPSIGNAL SIGTERM

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
