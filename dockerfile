FROM node:argon
MAINTAINER Daniel Portella
LABEL version 1.0.0
LABEL description Example expressjs site.

ENV PORT 8080
ENV NODE_ENV production

RUN mkdir app

COPY . /app

WORKDIR /app

RUN chmod -x /app/bin/www

RUN cd /app && npm install --silent

RUN groupadd -r appgroup -g 433 && \
    useradd -u 431 -r -g appgroup -d /app -s /sbin/nologin -c "app user" app-user && \
    chown -R app-user:appgroup /app && \
    chmod -R 777 /app

EXPOSE 8080

USER app-user

CMD ["/app/bin/www"]