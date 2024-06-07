FROM debian:bullseye

RUN apt update && apt install -y curl php-fpm

RUN mkdir -p /var/www/html

RUN curl -L https://www.adminer.org/latest.php -o /var/www/html/adminer.php

RUN mkdir -p /run/php

CMD php-fpm7.4 -F
