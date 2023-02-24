# # Use the official debian image as the base image
# FROM debian:buster

# # Install necessary tools
# RUN apt-get update && \
# 	apt-get upgrade -y && \
#                 apt-get install -y wget curl php php-fpm php-mysql && \
#                         rm -rf /var/lib/apt/lists/*

# # Download and install wp-cli
# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     chmod +x wp-cli.phar && \
#         mv wp-cli.phar /usr/local/bin/wp

# # Copy default php fpm configuration
# COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

# # Copy setup wordpress script
# COPY ./tools/wordpress_setup.sh /usr/local/bin/
# RUN chmod +x /usr/local/bin/wordpress_setup.sh

# # Set working directory to /var/www/html
# WORKDIR /var/www/html/

# # Expose 9000 for fastcgi
# EXPOSE 9000

# # To ensure php-fpm service can store its runtime data
# RUN mkdir -p /run/php

# # Set entry point to wordpress script
# ENTRYPOINT ["/usr/local/bin/wordpress_setup.sh"]

# # Starting wp service at foreground
# CMD ["/usr/sbin/php-fpm7.3", "-F"]

FROM debian:bullseye-slim

LABEL maintainer="NGINX Docker Maintainer <fongsiongshawn@gmail.com>"

# Install necessary tools
RUN apt-get update && \
    apt-get install -yqq nginx openssl && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy default NGINX configuration
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Generate SSL certificate using OpenSSL
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -newkey rsa:4096 \
        -keyout /etc/nginx/ssl/shawn.key -out /etc/nginx/ssl/shawn.crt \
        -days 365 -subj "/C=MY/ST=Selangor/L=PetalingJaya/O=42KL/OU=42KL/CN=shawn"

# Expose the NGINX port (default is 443)
EXPOSE 443

# Start NGINX server in foreground
CMD ["nginx", "-g", "daemon off;"]
