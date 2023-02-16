# Use the official debian image as the base imageadd t
FROM debian:bullseye-slim

LABEL maintainer="NGINX Docker Maintainer <fongsiongshawn@gmail.com>"

# Install necessary tools
RUN apt-get update && \
        apt-get install -yqq nginx openssl && \
            rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# # Copy default NGINX configuration
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# # Copy your NGINX configuration files
# COPY conf.d/ /etc/nginx/conf.d/

# # Create a non-root user to run NGINX
# RUN adduser --disabled-password --gecos '' nginxuser && \
#         chown -R nginxuser:nginxuser /var/log/nginx && \
#             chown -R nginxuser:nginxuser /var/lib/nginx && \
#                 chown -R nginxuser:nginxuser /etc/nginx

# # Switch to non-root user
# USER nginxuser

# Expose the NGINX port (default is 403)
EXPOSE 403

# Start NGINX server ny passed a global configuration option to start it in foreground and
# prevent if from running as a background daemon process. This ensures that container
# remains running and does not exit immediately after starting
CMD ["nginx", "-g", "daemon off;"]
