# Use the official debian image as the base image
FROM debian:bullseye-slim

# Install necessary tools
RUN apt-get update && \
    apt-get install -yqq wget curl php-fpm php-mysql && \
        rm -rf /var/lib/apt/lists/* 

# Download and install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
        mv wp-cli.phar /usr/local/bin/wp

# Copy default php fpm configuration
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

# Copy setup wordpress script
COPY ./tools/wordpress_setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress_setup.sh

# Change directory
WORKDIR /var/www/html/

# Expose 9000 for fastcgi
EXPOSE 9000

# In case error php-fpm7.3 not found
RUN mkdir -p /run/php

# Set entry point to wordpress script
ENTRYPOINT ["/usr/local/bin/wordpress_setup.sh"]

# Starting wp service at foreground
CMD ["/usr/sbin/php-fpm", "-F"]
