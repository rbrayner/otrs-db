from mariadb:10.3

RUN sed -i 's/^\(max_allowed_packet\s*=\s*\).*$/\120M/' /etc/mysql/my.cnf
RUN sed -i 's/^\(query_cache_size\s*=\s*\).*$/\32M/' /etc/mysql/my.cnf
RUN sed -i 's/^\(innodb_log_file_size\s*=\s*\).*$/\256M/' /etc/mysql/my.cnf

EXPOSE 3306
