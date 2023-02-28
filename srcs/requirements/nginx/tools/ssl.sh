# #!/bin/sh

# # Set the path where SSL certificate and key will be stored
# SSL_DIR="/etc/nginx/ssl"

# # Create the SSL directory if it doesn't already exist
# mkdir -p $SSL_DIR

# # Generate a new private key and self-signed SSL certificate using OpenSSL
# openssl req -x509 -nodes -newkey rsa:4096 \
#     -keyout $SSL_DIR/shawn.key -out $SSL_DIR/shawn.crt \
#         -days 365 -subj "/C=MY/ST=Selangor/L=PetalingJaya/O=42KL/OU=42KL/CN=shawn"


# # Run the command passed as an argument to the script
# exec "$@"


CERTS_PATH="/etc/nginx/certs"

mkdir -p $CERTS_PATH
openssl genrsa -out $CERTS_PATH/private.key 2048
openssl req -new -key $CERTS_PATH/private.key -out $CERTS_PATH/csr.csr -subj "/C=MY/ST=KL/L=KL/O=42/OU=42KL/CN=Hiro"
openssl x509 -req -days 365 -in $CERTS_PATH/csr.csr -signkey $CERTS_PATH/private.key -out $CERTS_PATH/certificate.crt


exec "$@"