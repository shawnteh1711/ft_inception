FROM debian:bullseye-slim

# Install required packages
RUN apt-get update && \
    apt-get install -y curl ca-certificates golang-go git && \
    rm -rf /var/lib/apt/lists/*

# Download and install Mailhog
RUN curl -L https://github.com/mailhog/MailHog/releases/download/v1.0.0/MailHog_linux_amd64 -o /usr/local/bin/MailHog && \
    chmod +x /usr/local/bin/MailHog

# Install mhsendmail
# RUN curl -LkSso /usr/bin/mhsendmail 'https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64' && \
#     chmod 0755 /usr/bin/mhsendmail && \
#     echo 'sendmail_path = "/usr/bin/mhsendmail --smtp-addr=mailhog:1025"' > /usr/local/etc/php/php.ini;

RUN go get github.com/mailhog/mhsendmail

# Expose the SMTP and HTTP ports
EXPOSE 1025 8025

# Start Mailhog when the container starts
CMD ["MailHog"]
