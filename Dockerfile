FROM  webdevops/php-nginx:7.4-alpine
ENV PHP_MAX_EXECUTION_TIME 110
ENV WEB_DOCUMENT_ROOT /app/public
RUN apk update && apk add --no-cache supervisor openssh nginx
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN /bin/bash /entrypoint.sh
ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]

