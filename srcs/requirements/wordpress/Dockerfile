# Use the official debian image as the base image
FROM debian:bullseye-slim

# Install necessary tools
RUN apt-get update && \
    apt-get install -yqq wget php-fpm php-mysql && \
        rm -rf /var/lib/apt/lists/* 

# Copy default php fpm configuration
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# copy setup wordpress script
# COPY ./tools/wordpress_setup.sh .
COPY ./tools/wordpress_setup.sh /usr/local/bin/
# RUN chmod +x ./wordpress_setup.sh
RUN chmod +x /usr/local/bin/wordpress_setup.sh

WORKDIR /var/www/html/

# Expose 9000 for fastcgi
EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/wordpress_setup.sh"]
# ENTRYPOINT ["./wordpress_setup.sh"]

# Starting wp service at foreground
CMD ["/usr/sbin/php-fpm7.3", "-F"]
