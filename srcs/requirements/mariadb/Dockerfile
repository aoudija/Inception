FROM debian:bullseye

WORKDIR /db

RUN mkdir dbi

RUN apt update && apt install -y mariadb-server

COPY ./queries.sh .

CMD chmod +x queries.sh && ./queries.sh 
