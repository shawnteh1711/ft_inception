#!/bin/bash

# Check if there is mysql default files
if [ -d "/var/lib/mysql/mysql" ]; then
    echo "[INFO] mysql is already initialized..."
else
    # initializa sql database and specifies the location where data files will be stored
    mysql_install_db --datadir=/var/lib/mysql

    chown -R mysql:root /var/lib/mysql

    # sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

    # Create bootstrap file
    echo 
    "
    USE mysql;
    FLUSH PRIVILEGES;
    # Create a user with remote access privileges
    # mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER 'myuser'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    # mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO 'myuser'@'%';"

    CREATE USER IF NOT EXISTS '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
    CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    SELECT user from mysql.user;
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
    FLUSH PRIVILEGES;
    " > temp.sql

    # Insert boostrap file into db as mysql user using mysqld daemon to run mysql server. 
    # A daemon is a program that runs in background and provide some service for other programs or user.
    # Bootstap mode allow sql server started with a specific SQL script and execute the commands from script
    # and then shut down. This simplifies the initialization process
    mysqld --user=mysql --bootstrap < temp.sql
fi

# Run command in Dockerfile
exec "$@"