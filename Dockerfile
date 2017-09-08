FROM mariadb:10.3

RUN sed -i 's/^\(max_allowed_packet\s*=\s*\).*$/\120M/' /etc/mysql/my.cnf
RUN sed -i 's/^\(query_cache_size\s*=\s*\).*$/\132M/' /etc/mysql/my.cnf
#RUN sed -i 's/^\(innodb_log_file_size\s*=\s*\).*$/\1256M/' /etc/mysql/my.cnf

echo "innodb_log_file_size = 256M" >> /etc/mysql/my.cnf

EXPOSE 3306
