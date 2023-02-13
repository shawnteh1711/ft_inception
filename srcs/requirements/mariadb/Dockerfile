# Use the official MariaDB image as the base imageadd t
# FROM mariadb:latest
FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

# Set the environment variables for MariaDB
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=mydb
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# Copy the database initialization script to the container
COPY ./tools/mariadb_setup.sh .

# Make the mariadb_setup.sh file executable
RUN chmod +x ./mariadb_setup.sh

# Expose the MariaDB port (default is 3306)
EXPOSE 3306

# Define the entry point command
ENTRYPOINT ["./mariadb_setup.sh"]

# Start MariaDB when the container is run
CMD ["mysqld"]
