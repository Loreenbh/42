FROM    debian:buster

RUN     apt update -y && apt upgrade -y && \
        apt install -y nginx && \
        apt install openssl -y && \
        rm -rf /var/lib/apt/lists/*

COPY    ./conf/default /etc/nginx/sites-available/.

RUN     mkdir -p /etc/nginx/ssl && \
        chown -R www-data:www-data /var/www/html /etc/nginx/ssl && \
        chmod -R 755 /var/www/html 

CMD     ["nginx", "-g", "daemon off;"]