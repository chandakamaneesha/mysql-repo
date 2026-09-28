FROM mysql/mysql-server:5.7
EXPOSE 3306
COPY data.sql /docker-entrypoint-initdb.d
ENV MYSQL_ROOT_PASSWORD=admin123
