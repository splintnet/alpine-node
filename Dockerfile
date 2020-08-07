FROM node:14.7-alpine
LABEL maintainer="info@splintnet.de"

# Install lib support
RUN set -xe \
    && apk add --no-cache \
		bash \
		curl

RUN curl -sL https://sentry.io/get-cli/ | bash

WORKDIR /application

# any artisan file triggers laravel mixer (black) magic
RUN touch artisan
