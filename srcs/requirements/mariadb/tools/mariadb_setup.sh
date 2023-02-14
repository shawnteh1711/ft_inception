#!/bin/bash

# Check if there is mysql default files
if [ -d "/var/lib/mysql/mysql" ]; then
    echo "[INFO] mysql is already initialized..."
else
    mysql_install_db --datadir=/var/lib/mysql

    chown -R mysql:root /var/lib/mysql

    # Create bootstrap file
    echo 
    "
    USE mysql;
    FLUSH PRIVILEGES;
    CREATE USER IF NOT EXISTS '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
    CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
    GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
    SELECT user from mysql.user;
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
    FLUSH PRIVILEGES;
    " > temp.sql

    # Insert boostrap file into db as mysql user
    mysqld --user=mysql --bootstrap < temp.sql
fi

# Run command in Dockerfile
# exec "$@"
exec mysqld --user=mysql --console