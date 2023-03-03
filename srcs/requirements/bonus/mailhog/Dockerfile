FROM debian:bullseye-slim

# Install required packages
RUN apt-get update && \
    apt-get install -yqq curl ca-certificates golang-go git netcat && \
    rm -rf /var/lib/apt/lists/*

# Download and install Mailhog
RUN curl -L https://github.com/mailhog/MailHog/releases/download/v1.0.0/MailHog_linux_amd64 -o /usr/local/bin/MailHog && \
    chmod +x /usr/local/bin/MailHog

# Install mhsendmail through curl
# RUN curl -LkSso /usr/bin/mhsendmail 'https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64' && \
#     chmod 0755 /usr/bin/mhsendmail && \
#     echo 'sendmail_path = "/usr/bin/mhsendmail --smtp-addr=mailhog:1025"' > /usr/local/etc/php/php.ini;

# Install mhsendmail through go and git
RUN go get github.com/mailhog/mhsendmail && \
    cp ~/go/bin/mhsendmail /usr/local/bin && \
    chmod +x /usr/local/bin/mhsendmail

# Copy the sendmail script
COPY ./tools/sendmail.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/sendmail.sh

# Expose the SMTP and HTTP ports
EXPOSE 1025 8025

# # Set the entrypoint to script
# ENTRYPOINT ["/usr/local/bin/sendmail.sh"]

# # Start Mailhog when the container starts
# CMD ["/usr/local/bin/MailHog"]
CMD ["sh", "-c", "/usr/local/bin/sendmail.sh", "/usr/local/bin/MailHog"]

# Start Mailhog and run the script when the container starts
# CMD ["sh", "-c", "/usr/local/bin/MailHog & sleep 5 && /usr/local/bin/sendmail.sh"]

# Start Mailhog and run the script when the container starts
# CMD ["sh", "-c", "/usr/local/bin/MailHog & /usr/local/bin/sendmail.sh"]
