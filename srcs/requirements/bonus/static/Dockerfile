# Use the official debian image as the base image
FROM debian:bullseye-slim

# Install necessary tools
RUN apt-get update && \
        apt-get install -yqq nginx && \
            rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy default NGINX configuration
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/index.html /var/www/html/index.html


EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]