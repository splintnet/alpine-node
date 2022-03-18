FROM node:16-alpine
LABEL maintainer="info@splintnet.de"

# Install lib and node-gyp support
RUN set -xe \
    && apk --no-cache add --virtual native-deps \
    g++ gcc libgcc libstdc++ linux-headers libtool autoconf automake make nasm git bash curl dpkg pkgconfig libpng libpng-dev && \
    npm install --quiet node-gyp -g

RUN curl -sL https://sentry.io/get-cli/ | bash

WORKDIR /application

# any artisan file triggers laravel mixer (black) magic
RUN touch artisan
