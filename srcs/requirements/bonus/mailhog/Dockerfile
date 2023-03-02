FROM debian:bullseye-slim

# Install required packages
RUN apt-get update && \
    apt-get install -y curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Download and install Mailhog
RUN curl -L https://github.com/mailhog/MailHog/releases/download/v1.0.0/MailHog_linux_amd64 -o /usr/local/bin/MailHog && \
    chmod +x /usr/local/bin/MailHog

# Expose the SMTP and HTTP ports
EXPOSE 1025 8025

# Start Mailhog when the container starts
CMD ["MailHog"]
