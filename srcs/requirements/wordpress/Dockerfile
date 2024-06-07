FROM debian:bullseye

RUN apt update && apt install -y curl

RUN apt install -y php
RUN apt install -y php-fpm
RUN apt install -y php-mysql

COPY ./wpr.sh .

CMD  bash ./wpr.sh