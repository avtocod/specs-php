FROM php:8.3-alpine

ENV \
    COMPOSER_ALLOW_SUPERUSER="1" \
    COMPOSER_HOME="/tmp/composer"

COPY --from=composer:2.8.9 /usr/bin/composer /usr/bin/composer

RUN set -x \
    && apk add --no-cache binutils git \
    && apk add --no-cache --virtual .build-deps autoconf linux-headers pkgconf make g++ gcc 1>/dev/null \
    # install xdebug (for testing with code coverage), but not enable it
    && pecl install xdebug-3.3.0 1>/dev/null \
    && apk del .build-deps \
    && mkdir /src ${COMPOSER_HOME} \
    && ln -s /usr/bin/composer /usr/bin/c \
    && chmod -R 777 ${COMPOSER_HOME} \
    && composer --version \
    && php -v \
    && php -m

WORKDIR /src
