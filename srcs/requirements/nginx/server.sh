# nginxpath=$(find ~ -name "nginx" -print 2> /dev/null | grep "etc")

nginxpath="/etc/nginx"
touch "$nginxpath/cert.key"
touch "$nginxpath/cert.pem"

openssl genrsa -out "$nginxpath/cert.key" 2048 #privatekey
openssl req -new -x509 -key "$nginxpath/cert.key" -out "$nginxpath/cert.pem" -days 365 -subj "/C=MO/ST=s/L=Meknes/O=a/OU=a/CN=a/emailAddress=a"
#requested a certificate and signed it
echo '
    server {
        listen       443 ssl;
        server_name localhost;
        
        root /var/www/html;
        index index.php;

        ssl_protocols TLSv1.2;
        ssl_certificate      /etc/nginx/cert.pem;
        ssl_certificate_key  /etc/nginx/cert.key;
    
        location ~ \.php$ {
            include /etc/nginx/snippets/fastcgi-php.conf;
            fastcgi_pass wordpress:9000;
        }
}' > "$nginxpath/sites-available/default"
