FROM mariadb:10.4.10
MAINTAINER "Rodrigo Brayner" <rbrayner@gmail.com>
ENV MYSQL_ROOT_PASSWORD changeme

#mariadb image runs as mysql user (uid 27) but we need to do some configuration
#changes so we need to temporarly switch to root
USER root

#RUN sed -i '/max_allowed_packet/d' /etc/mysql/my.cnf

# COPY addons.cnf /etc/mysql/conf.d/

#Change db configuration as required by official install docs and Enable utf8 support
RUN sed -i.bk -r '/^\[mysqld\]$/a max_allowed_packet=2048M' /etc/mysql/my.cnf && \
    sed -i.bk -r '/^\[mysqldump\]$/a max_allowed_packet=2048M' /etc/mysql/my.cnf && \
    sed -i.bk -r '/^\[mysqld\]$/a query_cache_size=64M' /etc/mysql/my.cnf && \
    sed -i.bk -r '/^\[mysqld\]$/a innodb_log_file_size=512M' /etc/mysql/my.cnf && \
    sed -i.bk -r '/^\[mysqld\]$/a net_read_timeout=28800' /etc/mysql/my.cnf && \
    sed -i.bk -r '/^\[mysqld\]$/a net_write_timeout=28800' /etc/mysql/my.cnf && \
    sed -i.bk -r '/^\[mysqld\]$/a interactive_timeout=28800' /etc/mysql/my.cnf && \
    sed -i.bk -r '/^\[mysqld\]$/a wait_timeout=28800' /etc/mysql/my.cnf && \
    sed -i.bk -r '/^\[mysqld\]$/a skip-character-set-client-handshake' /etc/mysql/my.cnf && \
    sed -i.bk -r "/^\[mysqld\]$/a init_connect='SET collation_connection = utf8_unicode_ci'" /etc/mysql/my.cnf && \
    sed -i.bk -r '/^\[mysqld\]$/a collation-server = utf8_general_ci' /etc/mysql/my.cnf && \
    sed -i.bk -r "/^\[mysqld\]$/a init-connect=\'SET NAMES utf8\'" /etc/mysql/my.cnf && \
    sed -i.bk -r '/^\[mysqld\]$/a character-set-server = utf8' /etc/mysql/my.cnf && \
    sed -i.bk -r '/^\[mysqld\]$/a innodb_force_recovery = 3' /etc/mysql/my.cnf

# #Change db configuration as required by official install docs and Enable utf8 support
# RUN echo "[mysqld]" >> /etc/mysql/conf.d/otrs.cnf &&\
#     echo "max_allowed_packet=64M" >> /etc/mysql/conf.d/otrs.cnf &&\
#     echo "query_cache_size=32M" >> /etc/mysql/conf.d/otrs.cnf &&\
#     echo "innodb_log_file_size=256M" >> /etc/mysql/conf.d/otrs.cnf &&\
#     echo "skip-character-set-client-handshake" >> /etc/mysql/conf.d/otrs.cnf &&\
#     echo "init-connect='SET NAMES utf8'" >> /etc/mysql/conf.d/otrs.cnf &&\
#     echo "init_connect='SET collation_connection = utf8_unicode_ci'" >> /etc/mysql/conf.d/otrs.cnf &&\
#     echo "collation-server = utf8_general_ci" >> /etc/mysql/conf.d/otrs.cnf &&\
#     echo "character-set-server = utf8" >> /etc/mysql/conf.d/otrs.cnf
