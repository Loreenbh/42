FROM    debian:buster

RUN     apt update -y && apt upgrade -y && \
        apt -y install php7.3 && apt install -y \
        php7.3-fpm \
        curl \
        php-mysqli \
        mariadb-client && \
        rm -rf /var/lib/apt/lists/*

COPY    ./conf/www.conf /etc/php/7.3/fpm/pool.d/.
COPY    ./tools/script.sh .

RUN     chmod +x script.sh

RUN     mkdir -p /run/php && chown -R www-data:www-data /run/php

CMD     ["./script.sh"]