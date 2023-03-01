#!/bin/sh

if [! -f "/etc/redis/redis.conf.bak" ]; then

    # create a backup of redis.conf
    cp /etc/redis/redis.conf /etc/redis/redis.conf.bak

    # comment out the bind for redis to listen on all hosts
    sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis/redis.conf

    # set maximum memory Redis can use to 2 megabytes
    sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis/redis.conf

    # Set the eviction policy to LRU (least recently used) when memory limit reached
    sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf
fi

# starts redis server in "protected mode"
redis-server --protected-mode no