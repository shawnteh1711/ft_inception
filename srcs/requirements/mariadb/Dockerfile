# Use the official debian image as the base imageadd t
FROM debian:bullseye-slim

# Install mariadb server
RUN apt-get update && \
        apt-get install -yqq mariadb-server && \
            rm -rf /var/lib/apt/list/*

# Make directory for mysql Unix socket authentication plugin
# RUN chown -R mysql:root /var/lib/mysql
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# Copy the database initialization script to the container
COPY ./tools/mariadb_setup.sh .
COPY ./conf/my.cnf /etc/mysql/my.cnf

# Updates the MySQL/MariaDB configuration file to replace string 127.0.0.1 with 0.0.0.0 
# effectively making the server listen on all available network interfaces.
# RUN sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Make the mariadb_setup.sh file executable
RUN chmod +x ./mariadb_setup.sh

# Expose the MariaDB port (default is 3306)
EXPOSE 3306

# Temporary env 
ENV MYSQL_ADMIN="root"

ENV MYSQL_ADMIN_PASSWORD="rootpassword"

ENV MYSQL_ROOT_PASSWORD="rootpassword"

ENV MYSQL_DATABASE="mydb"

ENV MYSQL_USER="myuser"

ENV MYSQL_PASSWORD="mypassword"


# Define the entry point command for initialization
ENTRYPOINT ["./mariadb_setup.sh"]

CMD ["mysqld"]
# end  
