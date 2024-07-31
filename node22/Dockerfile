FROM node:22-alpine
LABEL maintainer="info@splintnet.de"

# Install lib and node-gyp support
RUN set -xe \
    && apk --no-cache add --virtual native-deps \
    g++ gcc libgcc libstdc++ linux-headers libtool autoconf automake make nasm git bash curl dpkg jpeg tiff jpeg zlib zlib-dev pkgconf file gcc musl-dev pkgconfig libpng libpng-dev && \
    npm install --quiet node-gyp -g

RUN curl -sL https://sentry.io/get-cli/ | bash

WORKDIR /application

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"

RUN mkdir /pnpm

RUN corepack enable

RUN pnpm config set store-dir /pnpm

# any artisan file triggers laravel mixer (black) magic
RUN touch artisan
