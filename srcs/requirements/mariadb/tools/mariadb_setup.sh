# copy to custom data directory (init) and grant all permissions if directory not exist
# cp -n -r /var/lib/mysql/* /docker_mysqldata # -n is no overwrite, -r is recursive
# chmod -R 777 /docker_mysqldata

# # start mysql
# /etc/init.d/mysql start

# #create users and grant privelleges
# echo "CREATE USER IF NOT EXISTS  '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';" | mysql -u root -p$MYSQL_ROOT_PASSWORD
# echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root -p$MYSQL_ROOT_PASSWORD
# echo "GRANT ALL PRIVILEGES ON * . * TO '$MYSQL_ADMIN'@'%';" | mysql -u root -p$MYSQL_ROOT_PASSWORD
# echo "GRANT SELECT ON * . * TO '$MYSQL_USER'@'%';" | mysql -u root -p$MYSQL_ROOT_PASSWORD
# echo "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DATABASE;" | mysql -u root -p$MYSQL_ROOT_PASSWORD
# echo "USE $WORDPRESS_DATABASE;CREATE TABLE IF NOT EXISTS data (value VARCHAR(20));" | mysql -u root -p$MYSQL_ROOT_PASSWORD
# echo "SELECT user from mysql.user;" | mysql -u root -p$MYSQL_ROOT_PASSWORD
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -u root -p$MYSQL_ROOT_PASSWORD

# # stop mysql
# /etc/init.d/mysql stop

#mkdir for mysql unix socket
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

#if there is no mysql default files
if [ ! -d "/var/lib/mysql/mysql" ]
then
	#install mysql default files 
	mysql_install_db --datadir=/var/lib/mysql
else
	echo "[INFO] mysql is already initialized..."
fi

#create bootstrap file
echo \
"
FLUSH PRIVILEGES;
CREATE USER IF NOT EXISTS  '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASSWORD';
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
CREATE DATABASE IF NOT EXISTS $WORDPRESS_DATABASE;
GRANT ALL PRIVILEGES ON $WORDPRESS_DATABASE.* TO '$MYSQL_ADMIN'@'%';
GRANT ALL PRIVILEGES ON $WORDPRESS_DATABASE.* TO '$MYSQL_USER'@'%';
SELECT user from mysql.user;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
"\
	> temp.sql

#insert into db as mysql user
mysqld --user=mysql --bootstrap < temp.sql;

#run sql on foreground
echo "===============STARTING MARIADB SERVICE================"

# mysqld_safe --skip-syslog --log-error=logs. scrapped, need root and does not allow me to input pw
exec mysqld --user=mysql --console
