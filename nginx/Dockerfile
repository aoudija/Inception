FROM alpine:latest

WORKDIR /server

COPY . .

RUN apt-get install nginx
RUN apt-get install openssl

EXPOSE 443

CMD ["chmod 777 script.sh","./script.sh && nginx"]
