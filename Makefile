all:
	docker compose -f srcs/docker-compose.yml up --build
clean:
	docker stop mariadb nginx wordpress redis vsftpd adminer cadvisor website &&\
	docker rm mariadb nginx wordpress redis vsftpd adminer cadvisor website &&\
	docker volume rm srcs_volumedb srcs_volumewpng &&\
	sudo rm -rf /home/aoudija/data/db/* &&\
	sudo rm -rf /home/aoudija/data/wpng/*
re:clean all