nginxpath=$(find ~ -name "nginx" -print 2> /dev/null | grep "etc")

touch "$nginxpath/cert.key"
touch "$nginxpath/cert.pem"

openssl genrsa -out "$nginxpath/cert.key" 2048 #privatekey
openssl req -new -x509 -key "$nginxpath/cert.key" -out "$nginxpath/cert.pem" -days 365 -subj "/C=MO/ST=s/L=Meknes/O=a/OU=a/CN=a/emailAddress=a"


echo '
    events {
    worker_connections  1024;
    }
    http {
    server {
        listen       443 ssl;
        server_name  localhost;

        ssl_certificate      cert.pem;
        ssl_certificate_key  cert.key;

        ssl_session_cache    shared:SSL:1m;
        ssl_session_timeout  5m;

        ssl_ciphers  HIGH:!aNULL:!MD5;
        ssl_prefer_server_ciphers  on;
        ssl_protocols TLSv1.2;

        location / {
            root   html;
            index  index.html index.htm;
        }
    }
}' > "$nginxpath/nginx.conf"
