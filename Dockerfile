FROM keinos/php7-alpine

RUN apk update \
    && apk add --update \
      php-json \
    && rm -rf /var/cache/apk/* \
    && sed -i -e 's/expose_php = On/expose_php = Off/' /etc/php7/php.ini

COPY ./src /app

WORKDIR /app

ENTRYPOINT [ "/app/run-server.sh"]
