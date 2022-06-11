# syntax=docker/dockerfile:1

# Use LTS version
FROM node:17-alpine AS build
WORKDIR /app
COPY package*.json ./

# Install all dependencies for build
# Use `npm ci` instead of `npm install` to install dependencies
# https://blog.npmjs.org/post/171556855892/introducing-npm-ci-for-faster-more-reliable
RUN npm ci

# Copy just needed files
COPY dockerize/copy.sh rollup.config.js ./
COPY public/ ./public/
COPY src/ ./src/

RUN npm run build

FROM alpine:3.6 AS run
COPY --from=build /app/copy.sh /copy.sh
COPY --from=build /app/public /output
ENTRYPOINT ["/bin/sh", "/copy.sh"]
