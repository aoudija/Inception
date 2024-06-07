
service mariadb start
sleep 5

mariadb << 7bs
create database if not exists \`${dbname}\`;
DROP USER IF EXISTS '${dbuser}'@'%';
create user '${dbuser}'@'%' identified by '${dbpassword}';
grant all privileges on \`${dbname}\`.* to '${dbuser}'@'%';
flush privileges;
7bs
service mariadb stop
mysqld_safe --bind 0.0.0.0 --port $dbport
