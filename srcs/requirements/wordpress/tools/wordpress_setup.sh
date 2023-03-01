# #!/bin/sh

# if [ ! -f ./wp-config.php ]; then

#     # Download the lastest version of wordpress
#     wget http://wordpress.org/latest.tar.gz

#     # Extract the wordpress archive
#     tar -xzvf latest.tar.gz

#     # Move the wordpress files to the web root directory
#     mv wordpress/* .

#     # Remove the archive and wordpress files
#     rm -rf latest.tar.gz && rm -rf wordpress

#     # Download wp core files
#     wp core download --allow-root

#     # Configure wp
#     wp config create  --dbhost=$MYSQL_HOSTNAME --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --allow-root 

#     # Install wp
#     wp core install --url=$DOMAIN_NAME --title=$BLOG_TITLE --admin_name=$ADMIN_USER --admin_password=$ADMIN_PASSWD --admin_email=$ADMIN_EMAIL --allow-root

#     # Create user
#     wp user create $GENERAL_USER $GENERAL_EMAIL --user_pass=$GENERAL_PASSWD --allow-root

#     # Change configuration directly without using wp cli
#     sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
#     sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
#     sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
#     sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php

#     # copy wp-config-sample.php into wp-config.php
#     cp wp-config-sample.php wp-config.php
# else
#     echo "Wordpress has already been installed"
# fi

# exec "$@"

#!/bin/sh

if [ -f ./wp-config.php ]
then
	echo "Wordpress has already been installed"
else
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

	wp config set WP_REDIS_HOST redis --allow-root
	wp config set WP_REDIS_PORT 6379 --raw --allow-root
	wp config set WP_REDIS_TIMEOUT 1 --raw --allow-root
	wp config set WP_REDIS_READ_TIMEOUT 1 --raw --allow-root
	wp config set WP_REDIS_DATABASE 0 --raw --allow-root
	wp config set WP_CACHE_KEY_SALT $DOMAN_NAME --allow-root
	wp plugin install redis-cache --allow-root
	wp plugin update --all --allow-root
	wp plugin activate redis-cache --allow-root
	wp redis enable --allow-root
fi

exec "$@"
