# # Use the official MariaDB image as the base imageadd t
# # FROM mariadb:latest
# FROM debian:buster

# # Install mariadb server
# RUN apt-get update
# RUN apt-get install -y mariadb-server

# # Set the environment variables for MariaDB
# ENV MYSQL_ROOT_PASSWORD=rootpassword
# ENV MYSQL_DATABASE=mydb
# ENV MYSQL_USER=myuser
# ENV MYSQL_PASSWORD=mypassword

# # Copy the database initialization script to the container
# COPY ./tools/mariadb_setup.sh .

# # Make the mariadb_setup.sh file executable
# RUN chmod +x ./mariadb_setup.sh

# # Expose the MariaDB port (default is 3306)
# EXPOSE 3306

# # Define the entry point command
# ENTRYPOINT ["./mariadb_setup.sh"]

# # Start MariaDB when the container is run
# CMD ["mysqld"]

FROM debian:buster

# Create working directory
RUN mkdir -p /mariaDB
WORKDIR /mariaDB

# Install necessary tools
RUN apt-get update && apt-get install -y \
vim mariadb-server procps gettext-base 

# mysql
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sql.template /mariaDB/script.sql.template  
COPY tools/entrypoint.sh .	 
RUN chmod 755 /mariaDB/entrypoint.sh

# RUN mysql_install_db
ENTRYPOINT [ "/mariaDB/entrypoint.sh" ] 
CMD ["mysqld_safe"]
