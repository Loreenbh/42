FROM    debian:buster

RUN     apt update -y && apt upgrade -y && \
        apt-get install -y mariadb-server && \
        rm -rf /var/lib/apt/lists/*

COPY    ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY    ./tools/init.sh /etc/mysql/init.sh

RUN     chmod +x /etc/mysql/init.sh

RUN     mkdir -p /run/mysqld && \
        chown -R mysql:mysql /var/run/mysqld /var/lib/mysql

CMD     ["/etc/mysql/init.sh"]



