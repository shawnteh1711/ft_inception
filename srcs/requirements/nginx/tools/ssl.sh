#!/bin/sh

# Set the path where SSL certificate and key will be stored
SSL_DIR="/etc/nginx/ssl"

# Create the SSL directory if it doesn't already exist
mkdir -p $SSL_DIR

# Generate a new private key and self-signed SSL certificate using OpenSSL
openssl req -x509 -nodes -newkey rsa:4096 \
    -keyout $SSL_DIR/shawn.key -out $SSL_DIR/shawn.crt \
        -passout pass: -days 365 -subj "/C=MY/ST=Selangor/L=PetalingJaya/O=42KL/OU=42KL/CN=shawn"


# Run the command passed as an argument to the script
exec "$@"
