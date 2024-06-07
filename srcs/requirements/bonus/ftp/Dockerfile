FROM debian:bullseye

RUN apt update && apt install -y vsftpd

COPY ./conf.sh .

CMD bash ./conf.sh