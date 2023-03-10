# Use the official debian image as the base image
FROM debian:buster

# Install necessary tools
RUN apt-get update && \
	apt-get upgrade -y && \
        apt-get install -yqq wget curl php php-fpm php-mysql mariadb-client && \
            rm -rf /var/lib/apt/lists/*

# Install bonus redis tools
RUN apt-get update && \
	apt-get upgrade -y && \
        apt-get install -yqq redis php-redis && \
            rm -rf /var/lib/apt/lists/*

# Download and install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
        mv wp-cli.phar /usr/local/bin/wp

# Copy default php fpm configuration
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# Copy setup wordpress script
COPY ./tools/wordpress_setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress_setup.sh

# Set working directory to /var/www/html
WORKDIR /var/www/html/

# Expose 9000 for fastcgi
EXPOSE 9000

# To ensure php-fpm service can store its runtime data
RUN mkdir -p /run/php

# Set entry point to wordpress script
ENTRYPOINT ["/usr/local/bin/wordpress_setup.sh"]

# Starting wp service at foreground and ifnore deamonize from conf file
CMD ["/usr/sbin/php-fpm7.3", "-F"]
