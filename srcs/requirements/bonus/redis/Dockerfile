# Base image
FROM debian:bullseye-slim

# Install redis
RUN apt-get update && \
        apt-get install -yqq redis && \
            rm -rf /var/lib/apt/list/*

# Copy setup script
COPY ./tools/redis.sh /tmp/redis.sh

# Expose 6379 port default redis
EXPOSE 6379

# Run setup script
CMD ["sh", "/tmp/redis.sh"]