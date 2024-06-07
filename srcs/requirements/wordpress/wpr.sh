# souce ../.env
sleep 10
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp --allow-root core download --path=$path
mv $path/wp-config-sample.php $path/wp-config.php

wp config set SERVER_PORT $dbport --allow-root --path=$path
wp config set DB_NAME $dbname --allow-root --path=$path
wp config set DB_USER $dbuser --allow-root --path=$path
wp config set DB_PASSWORD $dbpassword --allow-root --path=$path
wp config set DB_HOST $dbhost --allow-root --path=$path
# wp --allow-root config create --dbname=my-database --dbuser=amine --dbpass=qwerty123 --dbhost=mariadb:3306 --path=$path

wp --allow-root core install --url=$url --title="Inception" --admin_user=$adminuser --admin_password=$adminpassword --admin_email=$adminemail --path=$path
wp --allow-root user create $user $useremail --role=subscriber --user_pass=$userpassword --path=$path
# service php7.4-fpm start

sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/" /etc/php/7.4/fpm/pool.d/www.conf

wp plugin install redis-cache --activate --allow-root --path=$path
wp config set WP_REDIS_HOST redis --allow-root --path=$path
wp config set WP_REDIS_PORT 6379 --allow-root --path=$path
wp redis enable --allow-root --path=/var/www/html

mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F
