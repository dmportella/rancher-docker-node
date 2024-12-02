FROM node:current-slim
ARG CONT_IMG_VER
ARG USER_ID=431
ARG GROUP_ID=433

LABEL MAINTAINER="Daniel Portella"
LABEL SUPPORT="https://ko-fi.com/gothyl"
LABEL version="${CONT_IMG_VER}"
LABEL description="Example expressjs site."

ENV CONT_IMG_VER=${CONT_IMG_VER}
ENV PORT=8080
ENV NODE_ENV=production

RUN mkdir app

COPY . /app

WORKDIR /app

RUN chmod +x /app/bin/www

RUN cd /app && npm install --silent

RUN groupadd -r appgroup -g ${GROUP_ID} && \
    useradd -u ${USER_ID} -r -g appgroup -d /app -s /sbin/nologin -c "app user" app-user && \
    chown -R app-user:appgroup /app && \
    chmod -R 774 /app

EXPOSE 8080

USER app-user

CMD ["/app/bin/www"]
