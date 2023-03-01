# Use the official debian image as the base image
FROM debian:bullseye-slim

LABEL maintainer="NGINX Docker Maintainer <fongsiongshawn@gmail.com>"

# Install necessary tools
RUN apt-get update && \
        apt-get install -yqq nginx openssl && \
            rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy default NGINX configuration
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Copy generate ssl certificate with openssl using sh script
COPY ./tools/ssl.sh ./tmp/
RUN chmod +x ./tmp/ssl.sh

# Expose the NGINX port (default is 443)
EXPOSE 443

ENTRYPOINT ["./tmp/ssl.sh"]
# RUN	mkdir -p /etc/nginx/ssl
# RUN	openssl req -x509 -nodes -newkey rsa:4096 -keyout /etc/nginx/ssl/shawn.key -out /etc/nginx/ssl/shawn.crt -days 365 -subj "/C=MY/ST=Selangor/L=ShahAlam/O=42KL/OU=shawn/CN=shawn"

# Start NGINX server ny passed a global configuration option to start it in foreground and
# prevent if from running as a background daemon process. This ensures that container
# remains running and does not exit immediately after starting

CMD ["nginx", "-g", "daemon off;"]
