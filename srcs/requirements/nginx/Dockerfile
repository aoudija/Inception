FROM debian:bullseye

WORKDIR /server

COPY . .

RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y openssl
RUN ./server.sh

CMD nginx -g 'daemon off;'
