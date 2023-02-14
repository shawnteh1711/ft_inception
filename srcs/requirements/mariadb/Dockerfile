# # Use the official MariaDB image as the base imageadd t
# FROM debian:buster

# # Install mariadb server
# RUN apt-get update && apt-get install -y mariadb-server

# # Make directory for mysql Unix socket authentication plugin
# RUN mkdir -p /run/mysqld && chown -R mysql:root /run/mysqld

# # Copy the database initialization script to the container
# COPY ./tools/mariadb_setup.sh .
# COPY ./conf/mysql.cnf /etc/mysql/msql.cnf

# # Make the mariadb_setup.sh file executable
# RUN chmod +x ./mariadb_setup.sh

# # Expose the MariaDB port (default is 3306)
# EXPOSE 3306

# # Define the entry point command for initialization
# ENTRYPOINT ["./mariadb_setup.sh"]

# CMD ["mysqld"]
# # end  

#base image
FROM debian:buster

#install mariadb
RUN apt update
RUN apt install -yqq mariadb-server

#install vim for dev
RUN apt install -yqq nano

#expose port 3306 for maraidb
EXPOSE 3306

#copy database setup script
COPY ./conf/db-setup.sh .

#copy my config
COPY ./conf/mysql.cnf /etc/mysql/mysql.cnf

#run database setup script
CMD ["bash", "db-setup.sh"]
